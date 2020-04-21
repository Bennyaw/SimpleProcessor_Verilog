module hardware_dataPath(CLOCK_50,KEY,SW,LEDG,LEDR,HEX0,HEX1);

	input CLOCK_50;
	output [6:0]HEX0,HEX1;
	input [1:0]KEY;
	input [9:0]SW;
	output [7:0]LEDG;
	output [9:0]LEDR;
	
	//external I/O
	wire clock,reset,enter,halt;
	wire [7:0]dataIn,dataOut;
	
	//control signal
	wire irLoad,jmpMux,pcLoad,memInst,memWr,aLoad,sub;
	wire [1:0]aSel;
	
	//status signal
	wire [2:0]IR;
	wire aEq0,aPos;
	
	ONEHZ_CLOCK c0 (CLOCK_50,KEY[0],clock);
	
	assign reset = KEY[0];
	assign enter = ~KEY[1];
	
	assign LEDG[7:7] = halt;
	assign LEDR[9:0] = SW[9:0];
	assign dataIn[7:0] = SW[7:0];
	
	controlUnit cu0 (irLoad,IR,jmpMux,pcLoad,memInst,memWr,aLoad,aSel,
					 sub,clock,reset,aEq0,aPos,halt,enter);
			
	dataPath    dp0 (clock,reset,irLoad,jmpMux,pcLoad,memInst,memWr,
					 aSel,aLoad,sub,IR,aEq0,aPos,dataIn,dataOut);
	
	BCD_hex b0		(HEX0,dataOut[3:0]);
	BCD_hex b1		(HEX1,dataOut[7:4]);

endmodule 