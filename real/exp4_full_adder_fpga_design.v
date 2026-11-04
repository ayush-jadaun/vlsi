`timescale 1ns / 1ps
module full_adder(
    input  a,     // SW0
    input  b,     // SW1
    input  cin,   // SW2
    output sum,   // LD0
    output cout   // LD1
);
assign sum  = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
