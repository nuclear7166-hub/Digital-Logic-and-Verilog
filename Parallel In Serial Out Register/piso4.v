`timescale 1ns / 1ps
module piso4(CLK, SH_LDN, D, Q);
    input CLK, SH_LDN;
    input [3:0] D;
    output Q;
    reg [3:0] BUFF;
    wire Q;
    
    always @(negedge SH_LDN or posedge CLK)     begin
    if(~SH_LDN)BUFF <= D;
    else    begin
    BUFF[3:1] <= BUFF[2:0];
    BUFF[0] <= 1'b0;
    end     end
    assign Q = BUFF[3];    
endmodule
