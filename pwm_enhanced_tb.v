`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2026 10:49:31 PM
// Design Name: 
// Module Name: pwm_enhanced_tb
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


module pwm_enhanced_tb
#(parameter BITS=8);
    reg clk;
    reg reset_n;
    reg [BITS-1:0] d;
    reg [BITS-1:0] In;
    wire pwm_out;
    
    pwm_enhanced uut(.clk(clk), .reset_n(reset_n), .d(d), .In(In), .pwm_out(pwm_out));
    
    always
    begin
    #2650;
    $finish;
    end
    
    always begin 
    #10 clk=~clk;
    end
    
    initial begin 
    clk=0;
    reset_n=0;
    #2 reset_n=1;
    
    d='d50;
    In='d1;
    
    
    end
endmodule
