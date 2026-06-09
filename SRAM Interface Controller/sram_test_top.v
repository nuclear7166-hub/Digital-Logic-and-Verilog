`timescale 1ns / 1ps
module sram_test_top (
    input clk,
    input rst,
    input [15:0] sw,     
    input btn_write,
    input btn_read,
    output [7:0] led
);
wire cs;
wire [2:0] ad;
wire [7:0] din;
assign cs  = sw[15];       // CS
assign ad  = sw[13:11];    // 주소
assign din = sw[10:3];     // 데이터

wire btn_w_clean, btn_r_clean;

debounce db_w (
    .clk(clk),
    .rst(rst),
    .noisy_in(btn_write),
    .clean_out(btn_w_clean)
);
debounce db_r (
    .clk(clk),
    .rst(rst),
    .noisy_in(btn_read),
    .clean_out(btn_r_clean)
);
// 엣지 검출
wire write_pulse, read_pulse;
edge_detect ed_w (
    .clk(clk),
    .rst(rst),
    .sig(btn_w_clean),
    .pulse(write_pulse)
);
edge_detect ed_r (
    .clk(clk),    .rst(rst),      .sig(btn_r_clean),      .pulse(read_pulse)  );
// SRAM 연결
wire [7:0] dout;
sram_model u_sram (
    .clk(clk),    .cs(cs),    .we(write_pulse),    .ad(ad),     .din(din),     .dout(dout) );
reg [7:0] led_reg;

always @(posedge clk or posedge rst) begin
    if (rst)
        led_reg <= 0;
    else if (read_pulse)
        led_reg <= dout;
end

assign led = led_reg;

endmodule

module debounce (
    input clk,
    input rst,
    input noisy_in,
    output reg clean_out
);
parameter DEBOUNCE_CNT = 500_000;
reg [19:0] cnt;
reg sync0, sync1;
always @(posedge clk) begin
    sync0 <= noisy_in;      sync1 <= sync0;
end
always @(posedge clk or posedge rst) begin
    if (rst) begin
        cnt <= 0;            clean_out <= 0;
    end else begin
        if (sync1 != clean_out) begin
            if (cnt < DEBOUNCE_CNT)
                cnt <= cnt + 1;
            else begin
                clean_out <= sync1;
                cnt <= 0;
            end
        end else begin
            cnt <= 0;
        end
    end
end
endmodule

module edge_detect (    input clk,    input rst,    input sig,    output reg pulse  );
reg prev;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        prev <= 0;        pulse <= 0;
    end else begin
        pulse <= sig & ~prev;        prev <= sig;
    end
end
endmodule
module sram_model #(
    parameter DEPTH=8,
    parameter WIDTH=8, 
    parameter DEPTH_LOG=$clog2(DEPTH)
)(
    input clk,      input cs, we, 
    input  [DEPTH_LOG-1:0] ad,      input  [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout);
reg [WIDTH-1:0] mem[DEPTH-1:0];
integer i;
initial begin
    for ( i=0;i<DEPTH;i=i+1)
        mem[i] = 0;
end
always @(posedge clk) begin
    if (cs & we)          mem[ad] <= din;
    else if (cs & !we)        dout <= mem[ad];
end
endmodule