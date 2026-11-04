`timescale 1ns / 1ps
module tb_deg_rad_G5;
reg  [15:0] degree;
wire [31:0] radian;
real radian_real;
deg_rad_G5 uut(.degree(degree), .radian(radian));
always @(*) begin
    radian_real = $rtoi((radian / 65536.0) * 1000.0 + 0.5) / 1000.0;
end
initial begin
    $display("Time\tDegree\tRadian");
    $monitor("%0t\t%d\t%f", $time, degree, radian_real);
    degree = 0;   #10;
    degree = 30;  #10;
    degree = 45;  #10;
    degree = 60;  #10;
    degree = 90;  #10;
    degree = 120; #10;
    degree = 180; #10;
    degree = 360; #10;
    $finish;
end
endmodule
