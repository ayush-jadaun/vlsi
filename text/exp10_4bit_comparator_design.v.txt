`timescale 1ns / 1ps
module four_bit_digital_comparator_G5(
    input  [3:0] A,
    input  [3:0] B,
    output A_greater_B,
    output A_lesser_B,
    output A_equal_B
);
wire E3 = ~(A[3] ^ B[3]);   // XNOR: 1 when bits are equal
wire E2 = ~(A[2] ^ B[2]);
wire E1 = ~(A[1] ^ B[1]);
wire E0 = ~(A[0] ^ B[0]);
assign A_greater_B = (A[3] & ~B[3]) |
                     (E3 & A[2] & ~B[2]) |
                     (E3 & E2 & A[1] & ~B[1]) |
                     (E3 & E2 & E1 & A[0] & ~B[0]);
assign A_lesser_B  = (~A[3] & B[3]) |
                     (E3 & ~A[2] & B[2]) |
                     (E3 & E2 & ~A[1] & B[1]) |
                     (E3 & E2 & E1 & ~A[0] & B[0]);
assign A_equal_B   = E3 & E2 & E1 & E0;
endmodule
