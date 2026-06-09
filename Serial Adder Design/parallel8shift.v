`timescale 1ns / 1ps
module parallel8shift(
    input clk,
    input rstb,
    input load,
    input sin,
    input [7:0]din,
    output reg [7:0] pout     );
    
    always @(posedge clk or negedge rstb)   begin
        if(!rstb) pout[7:0] <= 8'b0;
        else if(load) pout[7:0] <= din[7:0];
        else pout[7:0] <= {sin, pout[7:1]}; end
endmodule
