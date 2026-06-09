`timescale 1ns / 1ps

module moore_110detector(
    input clk, 
    input reset, 
    input din, 
    output dout, 
    output reg [1:0] state
);
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    reg [1:0] state_next;

    always @(posedge clk or negedge reset) begin
        if (!reset) 
            state <= S0;
        else 
            state <= state_next;
    end

    always @(*) begin
        case(state)
            S0: state_next = (din) ? S1 : S0;
            S1: state_next = (din) ? S2 : S0;
            S2: state_next = (din) ? S2 : S3;
            S3: state_next = (din) ? S1 : S0;
            default: state_next = S0;
        endcase
    end

    assign dout = (state == S3);

endmodule