`timescale 1ns / 1ps

module universal_register
    #(parameter N=4)
    (
        input clk, reset_n,
        input MSB_in, LSB_in,     
        input [N-1:0] I,
        input [1:0] s,
        output [N-1:0] Q 
    );
        
    reg [N-1:0] Q_reg, Q_next;

    always @(posedge clk or negedge reset_n) begin
        if(!reset_n)
            Q_reg <= {N{1'b0}};
        else
            Q_reg <= Q_next;
    end

    always @(*) begin              
        case(s)
            2'b00 : Q_next = Q_reg;                         // 유지
            2'b01 : Q_next = {MSB_in, Q_reg[N-1:1]};        // 우시프트
            2'b10 : Q_next = {Q_reg[N-2:0], LSB_in};        // 좌시프트 (가변 범위 적용)
            2'b11 : Q_next = I;                             // 병렬 로드
            default : Q_next = Q_reg;
        endcase
    end

    assign Q = Q_reg;        
endmodule