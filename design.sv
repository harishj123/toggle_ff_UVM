// Code your design here
module tff( 	
  input clk,
  input rstn,
  input t,
  output reg q
);

  always @ (posedge clk) begin
    if (!rstn)
      q <= 0;
    else
    	if (t)
          q <= !(t);
    	else
      		q <= t;
  end
endmodule
