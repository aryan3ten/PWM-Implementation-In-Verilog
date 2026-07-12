module pwm_enhanced
#(parameter BITS=8)(  
      input clk,
      input reset_n,
      input [BITS-1:0] d, //Duty cycle ke liye
      input [BITS-1:0] In, //Input ki timer kab tak chalega
      output reg pwm_out
      );
      
      wire en;
      reg [BITS-1:0] counter_out;
      reg Q;
      
      always@(posedge clk, negedge reset_n)
      if (~reset_n)
      begin
      counter_out<='b00;
      end
      else if (en)
      begin
      counter_out<=counter_out+1;
      end
      else
      begin 
      counter_out<=counter_out;
      end
     
      always@(*)
      Q = (counter_out<d);
      
      always@(posedge clk, negedge reset_n)
      if (~reset_n)
      pwm_out<='b0;
      else 
      pwm_out<=Q; 
      
      timer_input t0 (.clk(clk), .reset_n(reset_n), .done(en), .Q(In));
      
endmodule
