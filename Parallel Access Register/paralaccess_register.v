`timescale 1ns / 1ps
module paralaccess_register
    #(parameter N = 4)
    (
        input clk,
        input SI,
        input [N-1:0] I,
        input load,
        input reset_n,
        output [N-1:0] Q,
        output SO
     );
     reg [N-1:0] Q_reg, Q_next;
     
     always @(posedge clk or negedge reset_n)   begin
        if(!reset_n)
            Q_reg <= {N{1'b0}};
        else
            Q_reg <= Q_next;    end
        always @(*) begin
            if(load)
                Q_next = I;
            else
                Q_next = {SI, Q_reg[N-1:1]};    end
        assign SO = Q_reg[0];
        assign Q = Q_reg;
endmodule