module controlUnit(irLoad,irIn,jmpMux,pcLoad,memInst,memWr,aLoad,aSel,
			sub,clock,reset,aEq0,aPos,halt,enter);
			
		input [2:0]irIn;
		input aEq0,aPos,enter;
		input clock,reset;
		output reg irLoad,jmpMux,pcLoad,memInst,memWr,aLoad,sub,halt;
		output reg [1:0]aSel;
		
		reg [3:0]state,next_state;
		
		parameter s0=4'd0, 	s1=4'd1,  s2=4'd2,  s3=4'd8,  s4=4'd9, s5=4'd10,
				  s6=4'd11, s7=4'd12, s8=4'd13, s9=4'd14, s10=4'd15;
		  
always@(posedge clock, negedge reset)
	if(!reset)
		state<=s0;
	else
		state<=next_state;
		
always@(state or irIn or enter)
	case(state)
		s0 : next_state= s1;
		
		s1 : next_state= s2;
		
		s2 : if(irIn == 3'd0)//000
				next_state= s3;
			 else if(irIn == 3'd1)//001
				next_state= s4;
			 else if(irIn == 3'd2)//010
				next_state= s5;
			 else if(irIn == 3'd3)//011
				next_state= s6;
			 else if(irIn == 3'd4)//100
				next_state= s7;
			 else if(irIn == 3'd5)//101
				next_state= s8;
			 else if(irIn == 3'd6)//110
				next_state= s9;
			 else if(irIn == 3'd7)//111
				next_state= s10;
			 else//unregconised value for irIn
				next_state= s0;
				
		s7 : if(enter)
				next_state= s0;
			 else
				next_state= s7;
				
		s3 : next_state= s0;
		s4 : next_state= s0;
		s5 : next_state= s0;
		s6 : next_state= s0;
		s8 : next_state= s0;
		s9 : next_state= s0;
			 
		s10: next_state= s10;
		default : next_state= s0; 
	endcase

always@(state)
	case(state)
		s0 : begin 
			 irLoad=4'd0; jmpMux=4'd0; pcLoad=4'd0; memInst=4'd0; memWr=4'd0; 
			 aSel=2'b00; aLoad=4'd0; sub=4'd0; halt=4'd0;
			 end
			 
		s1 : begin
			 irLoad=4'd1; jmpMux=4'd0; pcLoad=4'd1; memInst=4'd0; memWr=4'd0; 
			 aSel=2'b00; aLoad=4'd0; sub=4'd0; halt=4'd0;
			 end
			 
		s2 : begin
			 irLoad=4'd0; jmpMux=4'd0; pcLoad=4'd0; memInst=4'd1; memWr=4'd0; 
			 aSel=2'b00; aLoad=4'd0; sub=4'd0; halt=4'd0;
			 end
			 
		s3 : begin
			 irLoad=4'd0; jmpMux=4'd0; pcLoad=4'd0; memInst=4'd0; memWr=4'd0; 
			 aSel=2'b10; aLoad=4'd1; sub=4'd0; halt=4'd0;
			 end
			 
		s4 : begin
			 irLoad=4'd0; jmpMux=4'd0; pcLoad=4'd0; memInst=4'd1; memWr=4'd1; 
			 aSel=2'b00; aLoad=4'd0; sub=4'd0; halt=4'd0;
			 end
			 
		s5 : begin
			 irLoad=4'd0; jmpMux=4'd0; pcLoad=4'd0; memInst=4'd0; memWr=4'd0; 
			 aSel=2'b00; aLoad=4'd1; sub=4'd0; halt=4'd0;
			 end
			 
		s6 : begin
			 irLoad=4'd0; jmpMux=4'd0; pcLoad=4'd0; memInst=4'd0; memWr=4'd0; 
			 aSel=2'b00; aLoad=4'd1; sub=4'd1; halt=4'd0;
			 end
			 
		s7 : begin
			 irLoad=4'd0; jmpMux=4'd0; pcLoad=4'd0; memInst=4'd0; memWr=4'd0; 
			 aSel=2'b01; aLoad=4'd1; sub=4'd0; halt=4'd0;
			 end
			 
		s8 : begin
			 irLoad=4'd0; jmpMux=4'd1; pcLoad=aEq0; memInst=4'd0; memWr=4'd0; 
			 aSel=2'b00; aLoad=4'd0; sub=4'd0; halt=4'd0;
			 end
			 
		s9 : begin
			 irLoad=4'd0; jmpMux=4'd1; pcLoad=aPos; memInst=4'd0; memWr=4'd0; 
			 aSel=2'b00; aLoad=4'd0; sub=4'd0; halt=4'd0;
			 end
			 
		s10: begin
			 irLoad=4'd0; jmpMux=4'd0; pcLoad=4'd0; memInst=4'd0; memWr=4'd0; 
			 aSel=2'b00; aLoad=4'd0; sub=4'd0; halt=4'd1;
			 end
			 
	default: begin
			 irLoad=4'd0; jmpMux=4'd0; pcLoad=4'd0; memInst=4'd0; memWr=4'd0; 
			 aSel=2'b00; aLoad=4'd0; sub=4'd0; halt=4'd0;
			 end
	endcase
	
endmodule

