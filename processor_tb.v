module processor_tb();
	
	//external I/O
	reg clock,reset,enter;
	reg [7:0]dataIn;
	wire [7:0]dataOut;
	wire halt;

	reg [7:0]x,y;
	initial begin
	reset=1;
	enter=1;
	#6 reset = 0;
	#4 reset = 1;dataIn = 8'd50;x=dataIn;
	$display("Entered X value for GCB %d at time %d",dataIn,$time);
	#4 enter = 0;
	#2 enter = 1;
	#6 dataIn = 8'd20;y=dataIn;
	$display("Entered Y value for GCB %d at time %d",dataIn,$time);
	#2 enter = 0;
	#2 enter = 1;
	$monitor("Processing : %d",dataOut);
	end
	
  always@(halt)
    if(halt)
      displaySummary();
      
  task displaySummary();
    begin 
        $display("\n-------SUMMARY:-------");
        $display("X value : %d\nY value : %d\nGCD value of X and Y is: %d\n",x,y,dataOut);
    end
  endtask
  
	initial
	begin
	 clock = 0;
	 forever #2 clock = ~clock;
	end
	 
	
	
	processor p0 (clock,reset,enter,dataIn,dataOut,halt);

endmodule 