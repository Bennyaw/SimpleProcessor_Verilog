module ONEHZ_CLOCK (CLOCK_50, RESET, CLOCK1);
	
	input CLOCK_50;
	input [0:0] RESET;
	output reg [3:0] CLOCK1;
	
	integer count;
	
	
	always @ (posedge CLOCK_50, negedge RESET)
		
		if (~RESET) //reset
			begin
			count <= 8'd0;
			CLOCK1  <= 8'd0;			
			end
		
		else
	               if (count == 5000000)
				    begin
				    CLOCK1  <= ~CLOCK1;
				    count <= 8'd0;
				    end
			
			       else
				    begin
				    CLOCK1  <= CLOCK1;
				    count <= count + 1'd1;
				    end  

endmodule 