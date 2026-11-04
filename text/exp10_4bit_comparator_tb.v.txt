`timescale 1ns / 1ps
module tb_four_bit_digital_comparator_G5;
reg  [3:0] A;
reg  [3:0] B;
wire A_greater_B, A_lesser_B, A_equal_B;
four_bit_digital_comparator_G5 uut (
    .A(A), .B(B),
    .A_greater_B(A_greater_B),
    .A_lesser_B(A_lesser_B),
    .A_equal_B(A_equal_B)
);
initial begin
    A = 4'b0000; B = 4'b0000; #10;
    A = 4'b1010; B = 4'b0101; #10;
    A = 4'b0101; B = 4'b1010; #10;
    A = 4'b1001; B = 4'b1001; #10;
    A = 4'b1000; B = 4'b0111; #10;
    A = 4'b0110; B = 4'b0101; #10;
    A = 4'b0100; B = 4'b0101; #10;
    A = 4'b0001; B = 4'b0000; #10;
    $finish;
end
initial begin
    $monitor("Time=%0t | A=%b B=%b | Greater=%b Lesser=%b Equal=%b",
             $time, A, B, A_greater_B, A_lesser_B, A_equal_B);
end
endmodule
