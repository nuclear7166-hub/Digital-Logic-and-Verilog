`timescale 1ns / 1ps
module top(
    input clk,
    input [7:0] sw,
    output reg [3:0] an,
    output [6:0] fnd
    );
    
    wire [11:0] bcd;
    bytetobcd u_bcd (.d(sw), .a(bcd));
    fnd_decoder u_fnd (.bcd(digit), .seg(fnd));
    
    reg [18:0] clk_div = 0;
    always @(posedge clk) begin
        clk_div <= clk_div +1;
    end
    
    wire scan_clk = clk_div[18];
    reg [1:0] sel = 0;
    reg [3:0] digit;
    
    always @(posedge scan_clk) begin
        sel <= sel +1;
    end
    
    always @(*) begin
        case(sel)
            2'b00 : begin
                an = 4'b1110;
                digit = bcd [3:0];      end
            2'b01 : begin
                an = 4'b1101;
                digit = bcd [7:4];      end
            2'b10 : begin
                an = 4'b1011;
                digit = bcd [11:8];      end
            2'b11 : begin
                an = 4'b0111;   end
            endcase
        end          
endmodule

module bytetobcd(
    input [7:0] d,
    output [11:0] a);
    
    reg [3:0] hundreds, tens, ones;
    reg [6:0] temp_reg;
    
    always @(*) begin
        hundreds = d / 100;
        temp_reg = d % 100;
        tens = temp_reg / 10;
        ones = temp_reg % 10;   end
        assign a = {hundreds, tens, ones};
endmodule

module fnd_decoder(
    input [3:0] bcd,
    output reg [6:0] seg);
    
    always @(*) begin
        case(bcd)
            4'd2 : seg = 7'b0100100;
            4'd3 : seg = 7'b0110000;
            4'd4 : seg = 7'b0011001;
            4'd5 : seg = 7'b0010010;
            4'd7 : seg = 7'b1111000;
            4'd8 : seg = 7'b0000000;
            4'd9 : seg = 7'b0010000;
            default : seg = 7'b1111111;     endcase
    end
endmodule          