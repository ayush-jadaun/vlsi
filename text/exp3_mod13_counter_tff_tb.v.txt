`timescale 1ns / 1ps
module tb_mod13_up_counter_G5;
reg  clk;
reg  reset;
wire [3:0] Q;
mod13_up_counter_G5 DUT(.clk(clk), .reset(reset), .Q(Q));
always #5 clk = ~clk;   // 10 ns period = 100 MHz
initial begin
    clk   = 1'b0;
    reset = 1'b1;
    #10;
    reset = 1'b0;
    #150;
    $finish;
end
initial begin
    $monitor("Time = %0t | Reset = %b | Q = %d (%b)", $time, reset, Q, Q);
end
endmodule
