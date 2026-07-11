module pwm_basic
#(parameter BITS=8)(  
      input clk,
      input reset_n,
      input [BITS-1:0] d,
      output reg Q
      );
      
      reg [BITS-1:0] counter_out;
      
      always@(posedge clk, negedge reset_n)
      if (~reset_n)
      begin
      counter_out<='b00;
      Q=1'b0;
      end
      else
      begin
      counter_out<=counter_out+1;
      end
     
      always@(*)
      Q = (counter_out<d);
      
      
      
endmodule
