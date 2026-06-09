`timescale 1ns / 1ps
module serialadder(
    input clk, rstb, load, [7:0] a, b,
    output [7:0] sum
    );
    wire [7:0] b_in;
    
    parallel8shift dut1(
        .clk(clk),
        .rstb(rstb),
        .sin(sum_1bit),
        .din(a),
        .pout(sum),
        .load(load) );
     parallel8shift dut2(
        .clk(clk),
        .rstb(rstb),
        .sin(1'b0),
        .din(b),
        .pout(b_in),
        .load(load) );
     register_1 dut3(
        .clk(clk),
        .rstb(rstb),
        .din(cout),
        .dout(cin) );
     full_adder dut4(
        .a(sum[0]),
        .b(b_in[0]),
        .cin(cin),
        .cout(cout),
        .s(sum_1bit) );
endmodule
