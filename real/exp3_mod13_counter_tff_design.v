`timescale 1ns / 1ps
module mod13_up_counter_G5(
    input        clk,
    input        reset,
    output [3:0] Q
);
// record names T1..T4 for flip-flops Q0..Q3
wire T1 = ~Q[3] | ~Q[2];                          // T0 = (Q3Q2)'
wire T2 = Q[0];                                   // T1 = Q0
wire T3 = (Q[3] & Q[2]) | (Q[1] & Q[0]);          // T2 = Q3Q2 + Q1Q0
wire T4 = (Q[3] & Q[2]) | (Q[2] & Q[1] & Q[0]);   // T3 = Q3Q2 + Q2Q1Q0
T_FF_G5 t1 (clk, reset, T1, Q[0]);
T_FF_G5 t2 (clk, reset, T2, Q[1]);
T_FF_G5 t3 (clk, reset, T3, Q[2]);
T_FF_G5 t4 (clk, reset, T4, Q[3]);
endmodule

module T_FF_G5(
    input      clk,
    input      reset,
    input      T,
    output reg Q
);
always @(posedge clk or posedge reset) begin
    if (reset)
        Q <= 1'b0;      // asynchronous reset
    else if (T)
        Q <= ~Q;        // toggle
    else
        Q <= Q;         // hold
end
endmodule
