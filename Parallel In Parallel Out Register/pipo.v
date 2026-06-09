`timescale 1ns / 1ps
module pipo(
    input CLK, CLRN,
    input [3:0] D,
    output reg [3:0] Q
    );
    
    always @(posedge CLRN or posedge CLK)   begin
    if(CLRN)
        Q <= 4'b0000;
    else
        Q <= D;     end
endmodule
