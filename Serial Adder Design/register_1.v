`timescale 1ns / 1ps
module register_1(
    input clk, rstb,
    input din,
    output reg dout    );
    
    always @(posedge clk, negedge rstb)
    dout <= din;
endmodule
