module DFF_3IN(input logic [2:0] D,input wire clk,input wire async_reset,input wire sync_set,output [2:0] Q);
reg Q;
always @(posedge clk or posedge async_reset)  
	begin
		if(async_reset)
			begin
				Q <= 3'b000; 
			end
		else if(sync_set==1'b1)
					begin
						Q <= 3'b111;
					end
		else
			begin
				Q <= D;
			end
	end
endmodule 

module BehavioralLeveling_FSM (input wire clk, async_reset, sync_set, A, output wire [2:0] Y);

	wire [2:0]D;
	wire [2:0]Q;
	
	DFF_3IN FFD1(D,clk, async_reset, sync_set, Q);
	
	assign D[2] = ( ~Q[2] & Q[1] & Q[0] & A ) | ( ~Q[2] & ~Q[1] & ~Q[0] & ~A ) | ( Q[2] & ~Q[1] & Q[0] ) | ( Q[2] & ~Q[0] & A ) | ( Q[2] & Q[1] & ~A );
	assign D[1] = ( ~Q[1] & Q[0] & A ) | ( Q[1] & ~Q[0] & A ) | ( Q[1] & Q[0] & ~A ) | ( ~Q[1] & ~Q[0] & ~A );
	assign D[0] = ~Q[0];
	
	assign Y[2] = Q[2];
	assign Y[1] = ( ~Q[2] & Q[1] ) | ( Q[2] & ~Q[1] );
	assign Y[0] = ( ~Q[1] & Q[0] ) | ( Q[1] & ~Q[0] );
	
endmodule
