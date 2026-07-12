module timer_input
  #(parameter BITS = 8)(
  input clk,
  input reset_n,
  input [BITS-1:0] Q,
  output reg done);
  
  reg [BITS-1:0] counter;
  
  always@(posedge clk, negedge reset_n)
  begin 
  if(~reset_n || counter==Q)
  counter<='b0;
  else 
  counter<=counter+1;
  end
  
  always@(*)
  if (counter==Q)
  begin
  done=1'b1;
  end
  else 
  begin
  done=1'b0;
  end
  
endmodule
