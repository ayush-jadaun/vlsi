`timescale 1ns / 1ps
module testbench;
reg  [3:0] A;
wire [3:0] GRAY;
binary_to_gray BG (GRAY, A);   // connected by position: (gray, a)
initial begin
    $monitor($time, " BINARY= %b, GRAY= %b", A, GRAY);
end
initial begin
    A = 4'd0;
    #5 A = 4'd1;
    #5 A = 4'd2;
    #5 A = 4'd3;
    #5 A = 4'd4;
    #5 A = 4'd5;
    #5 A = 4'd6;
    #5 A = 4'd7;
    #5 A = 4'd8;
    #5 A = 4'd9;
    #5 A = 4'd10;
    #5 A = 4'd11;
    #5 A = 4'd12;
    #5 A = 4'd13;
    #5 A = 4'd14;
    #5 A = 4'd15;
    #5 $finish;
end
endmodule
