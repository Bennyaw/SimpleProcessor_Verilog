module dataPath(clock,reset,irLoad,jmpMux,pcLoad,memInst,memWr,
				aSel,aLoad,sub,ir,aEq0,aPos,dataIn,dataOut);
	
	input wire clock,reset;
	
	//control signal
	input wire irLoad,jmpMux,pcLoad,memInst,memWr,aLoad,sub;
	input wire [1:0]aSel;	

	
	input wire[7:0]dataIn;
	output [7:0]dataOut;
	
	//status signals
	output [2:0]ir;
	output aEq0,aPos;
	
	wire [7:0]ramOut;
	wire [7:0]irOut;
	//wire [7:0]regA_Out;
	
	wire [4:0]pcAddress;//pc reg out
	wire [4:0]pcIn;
	wire  [4:0]pcIncrement;
	wire [4:0]pcOut;

	wire [7:0]aOut;
	wire [7:0]aIn;
	wire [7:0]subOut;
	wire [3:0]OR1,OR2;
	
	mux4to1 aRegIn (aSel,subOut,dataIn,ramOut,aIn);

	assign dataOut[7:0] = aOut[7:0];
	assign subOut[7:0]  = sub?(aOut[7:0]-ramOut[7:0]):(aOut[7:0]+ramOut[7:0]);
	assign aPos = ~aOut[7];
	
	or(OR1,aOut[0],aOut[1],aOut[2],aOut[3]);
	or(OR2,aOut[4],aOut[5],aOut[6],aOut[7]);
	nor(aEq0,OR1,OR2);

	
	assign pcIncrement = pcOut + 5'd1;
	assign pcIn[4:0] = jmpMux?irOut[4:0]:pcIncrement[4:0];
	assign pcAddress[4:0] = memInst?irOut[4:0]:pcOut[4:0]; 
	
	assign ir[2:0] = irOut[7:5];
	
			
	RAM ram (clock,memWr,pcAddress,ramOut,aOut,reset);
	register_master #(.size(8))IR (.load(irLoad),.clear(reset),.clock(clock),.dataIn(ramOut),.dataOut(irOut));
	register_master #(.size(5))PC (.load(pcLoad),.clear(reset),.clock(clock),.dataIn(pcIn),.dataOut(pcOut));
	register_master #(.size(8))A  (.load(aLoad) ,.clear(reset),.clock(clock),.dataIn(aIn),.dataOut(aOut));
		
endmodule 