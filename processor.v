module processor(clock,reset,enter,dataIn,dataOut,halt);
	
	//external I/O
	input clock,reset,enter;
	input [7:0]dataIn;
	output wire [7:0]dataOut;
	output wire halt;
	
	//control signal
	wire irLoad,jmpMux,pcLoad,memInst,memWr,aLoad,sub;
	wire [1:0]aSel;
	
	//status signal
	wire [2:0]IR;
	wire aEq0,aPos;

	
	controlUnit cu0 (irLoad,IR,jmpMux,pcLoad,memInst,memWr,aLoad,aSel,
					         sub,clock,reset,aEq0,aPos,halt,enter);
			
	dataPath    dp0 (clock,reset,irLoad,jmpMux,pcLoad,memInst,memWr,
					         aSel,aLoad,sub,IR,aEq0,aPos,dataIn,dataOut);

endmodule 