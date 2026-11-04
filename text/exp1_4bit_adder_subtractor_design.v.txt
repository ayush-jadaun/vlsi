`timescale 1ns / 1ps
module Add_Sub_G5(
    input  [3:0] A,
    input  [3:0] B,
    input        M,
    output reg [3:0] S,
    output reg   Cout
);
reg [4:0] temp;
reg [3:0] bcomp;
always @(*) begin
    bcomp = B ^ {4{M}};          // invert B when M = 1
    temp  = A + bcomp + M;       // M is also the carry-in (+1)
    Cout  = temp[4];             // 5th bit = carry out
    if (M && (B > A))
        S = ~(temp[3:0]) + 4'b0001;  // negative answer -> show magnitude
    else
        S = temp[3:0];
end
endmodule
