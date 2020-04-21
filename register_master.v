module register_master(load,clear,clock,dataIn,dataOut);
	
	parameter size = 1;
	
	input load,clear,clock;
	input [size-1:0]dataIn;
	output reg [size-1:0]dataOut;
	
always@(posedge clock,negedge clear)
	if(!clear)
		dataOut <= 0;
	else//no reset
		if(load)
			dataOut <= dataIn;
		else
			dataOut <= dataOut;


		

endmodule 