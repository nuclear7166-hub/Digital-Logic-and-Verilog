`timescale 1ns / 1ps
module full_adder(
    input a, b, cin,
    output s, cout    );
    
    assign cout = a&b | b&cin | cin&a;
    assign s = a^b^cin;
endmodule
