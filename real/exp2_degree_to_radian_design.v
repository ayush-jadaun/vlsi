`timescale 1ns / 1ps
module deg_rad_G5(
    input  [15:0] degree,
    output [31:0] radian
);
parameter K = 16'd1144;            // (pi/180) x 2^16
assign radian = degree * K;        // fixed-point result, Q16
endmodule
