`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2026 09:28:43 PM
// Design Name: 
// Module Name: timer_input_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module timer_input_tb
#(parameter BITS=8);
reg clk;
reg reset_n;
reg [BITS-1:0] Q;
wire done;

timer_input uut(.clk(clk), .reset_n(reset_n), .Q(Q), .done(done));

initial begin 
#25600;
$finish;
end 

always
begin
#20
clk=~clk;
end

initial begin 
clk=0;
reset_n=0;
Q = 'd128;
#2 reset_n=1;









end

endmodule
