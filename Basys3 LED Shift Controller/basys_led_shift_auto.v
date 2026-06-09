`timescale 1ns / 1ps
module basys_led_shift_auto(
    input clk,
    input reset,
    input btnL,
    input btnR,
    output reg [7:0] led
    );
    
    // 1. Meta-stability 방지 (Synchronizer)
    reg [1:0] syncL, syncR;
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            syncL <= 0; syncR <= 0;
        end else begin
            syncL <= {syncL[0], btnL};
            syncR <= {syncR[0], btnR};
        end
    end

    // 2. Debounce 로직
    parameter DEBOUNCE = 1_000_000;
    reg [19:0] cntL, cntR;
    reg debL, debR;
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            cntL <= 0; debL <= 0;
            cntR <= 0; debR <= 0;
        end else begin
            if(syncL[1] != debL) begin
                if(cntL < DEBOUNCE) cntL <= cntL + 1;
                else begin debL <= syncL[1]; cntL <= 0; end
            end else cntL <= 0;
            
            if(syncR[1] != debR) begin
                if(cntR < DEBOUNCE) cntR <= cntR + 1;
                else begin debR <= syncR[1]; cntR <= 0; end
            end else cntR <= 0;
        end
    end

    // 3. 버튼 엣지 검출 (Edge Detection) - 추가된 부분
    reg debL_reg, debR_reg;
    wire btnL_push, btnR_push;

    always @(posedge clk or posedge reset) begin
        if(reset) begin
            debL_reg <= 0; debR_reg <= 0;
        end else begin
            debL_reg <= debL;
            debR_reg <= debR;
        end
    end
    // 이전 상태는 0이고 현재 상태는 1일 때 (버튼을 누르는 순간) 1이 됨
    assign btnL_push = (debL && !debL_reg); 
    assign btnR_push = (debR && !debR_reg);

    // 4. 1초 자동 타이머 (기존 유지)
    parameter ONE_SEC = 100_000_000;
    reg [26:0] sec_cnt;
    reg tick_1s;
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            sec_cnt <= 0; tick_1s <= 0;
        end else begin
            if(sec_cnt < ONE_SEC - 1) begin
                sec_cnt <= sec_cnt + 1;
                tick_1s <= 0;
            end else begin
                sec_cnt <= 0;
                tick_1s <= 1;
            end
        end
    end   

    // 5. LED 시프트 로직 (수정된 부분)
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            led <= 8'b0000_0001;
        end else begin
            // 1초 타이머가 동작하거나 OR 버튼을 누르는 순간 즉시 실행
            if(tick_1s || btnL_push || btnR_push) begin
                if (debL)      led <= {led[6:0], led[7]}; // 왼쪽 이동
                else if (debR) led <= {led[0], led[7:1]}; // 오른쪽 이동
             end
        end
    end
endmodule