`timescale 1ns/1ps

module pwm_basic_tb;

parameter BITS = 8;

reg clk;
reg reset_n;
reg [BITS-1:0] d;
wire Q;

pwm_basic #(BITS) uut (
    .clk(clk),
    .reset_n(reset_n),
    .d(d),
    .Q(Q)
);


//-------------------------------
// 10 ns Clock
//-------------------------------
initial begin 
#25600;
$finish;
end 

initial
begin
    clk = 0;
    forever #20 clk = ~clk;
end

initial 
begin 

reset_n=1'b0;
#2
reset_n=1'b1;
d=0.25*(2**BITS);

end







endmodule