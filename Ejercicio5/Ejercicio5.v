module DFF_4IN(input logic [3:0] D,input logic clk,input logic async_reset,input logic sync_set,output [3:0] Q);
reg Q;
always @(posedge clk or posedge async_reset)  
begin
  if(async_reset)
   begin
   Q <= 4'b0000; 
   end
  else if(clk)
   begin
	if(sync_set==1'b1)
	begin
	  Q <= 4'b1111; 
	end
	
	else
	 begin
	  Q <= D;
	 end
   end
end 
endmodule 