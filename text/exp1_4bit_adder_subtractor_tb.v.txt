`timescale 1ns / 1ps
module tb_Add_Sub_G5;
reg  [3:0] A;
reg  [3:0] B;
reg        M;
wire [3:0] S;
wire       Cout;
Add_Sub_G5 uut(.A(A), .B(B), .M(M), .S(S), .Cout(Cout));
initial begin
    $display("Time\tA\tB\tM\tS\tCout");
    $monitor("%0t\t%d\t%d\t%b\t%d\t%b", $time, A, B, M, S, Cout);
    A = 4'd5;  B = 4'd3; M = 0; #10;
    A = 4'd9;  B = 4'd6; M = 0; #10;
    A = 4'd12; B = 4'd5; M = 0; #10;
    A = 4'd6;  B = 4'd4; M = 1; #10;
    A = 4'd3;  B = 4'd7; M = 1; #10;
    A = 4'd10; B = 4'd6; M = 1; #10;
    A = 4'd9;  B = 4'd9; M = 1; #10;
    A = 4'd7;  B = 4'd5; M = 0; #10;
    $finish;
end
endmodule
