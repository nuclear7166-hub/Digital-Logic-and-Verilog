`timescale 1ns / 1ps

module mealy_1011(
    input clk,
    input reset_n,
    input x,
    output y,
    output reg [1:0] state
);
    reg [1:0] next_state;

    localparam S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            S0: next_state = (x) ? S1 : S0;
            S1: next_state = (x) ? S1 : S2;
            S2: next_state = (x) ? S3 : S0;
            S3: next_state = (x) ? S1 : S2; 
            default: next_state = S0;
        endcase
    end

    assign y = (state == S3 && x == 1);

endmodule