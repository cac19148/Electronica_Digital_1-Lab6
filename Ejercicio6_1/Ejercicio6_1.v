module DFF_2IN(input logic [1:0] D,input wire clk,input wire async_reset,input wire sync_set,output [1:0] Q);
reg Q;
always @(posedge clk or posedge async_reset)  
	begin
		if(async_reset)
			begin
				Q <= 2'b00; 
			end
		else if(sync_set==1'b1)
					begin
						Q <= 2'b11;
					end
		else
			begin
				Q <= D;
			end
	end
endmodule 

module BehavioralLeveling_FSM (input wire clk, async_reset, sync_set, A, B, output Y);

	wire [1:0]D;
	wire [1:0]Q;
	
	DFF_2IN FFD1(D,clk, async_reset, sync_set, Q);
	
	assign D[1] = ( Q[0] & B ) | ( Q[1] & A & B );
	assign D[0] = ~Q[1] & ~Q[0] & A;
	assign Y = Q[1] & A & B;
	
endmodule



