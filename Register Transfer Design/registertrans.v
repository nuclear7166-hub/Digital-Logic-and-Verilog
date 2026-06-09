`timescale 1ns / 1ps
module registertrans(
    input DATA_IN, CLK1,
    output reg [3:0] A, B
    );
    
    always @(posedge CLK1)    begin
        A <= DATA_IN;
    end
    
    always @(posedge CLK1)    begin
    B <= A;
    end    
endmodule
