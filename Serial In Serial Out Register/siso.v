`timescale 1ns / 1ps
module siso(
    input CLK, CLRN, DIN,
    output Q
    );
    reg [3:0] BUFF;
    
    always @(negedge CLRN or posedge CLK)   begin
    if(CLRN == 1'b0) BUFF = 4'b0000;
    else    begin
    BUFF[3:1] = BUFF[2:0];
    BUFF[0] = DIN;      end         end
    assign Q = BUFF[3];
endmodule