`timescale 1ns / 1ps
module binary_to_gray (gray, a);
output [3:0] gray;
input  [3:0] a;
assign gray[3] = a[3];
assign gray[2] = a[3] ^ a[2];
assign gray[1] = a[2] ^ a[1];
assign gray[0] = a[1] ^ a[0];
endmodule
