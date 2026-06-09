`timescale 1ns / 1ps

module MUX_gatelevel(
    input a, b,
    input A, B, C, D,
    output Q
);
    wire    a_not, b_not;
    wire    A_pick, B_pick, C_pick, D_pick;
    
    not(a_not, a);
    not(b_not, b);
    
    and(A_pick, a_not, b_not, A);
    and(B_pick, a    , b_not, A);
    and(C_pick, a_not, b    , A);
    and(D_pick, a    , b    , A);
    
    or(Q, A_pick, B_pick, C_pick, D_pick);
     
endmodule
