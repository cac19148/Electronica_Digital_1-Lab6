module tb_DFF();
reg [3:0] D;
reg clk;
reg reset;
reg set;
wire [3:0] Q;

DFF_4IN FFP1(D,clk,reset,set,Q);

	initial begin
	  clk=0;
		 forever #10 clk = ~clk;  
	end 
	initial begin 
	   reset=0; set=0; D=4'b0000;
	#2 reset=1;
	#4 D=4'b0000;
	#6 D=4'b1111;
	#3 reset=0;
	#3 D=4'b0000;
	#6 D=4'b1111;
	#3 set=1;
	#3 D=4'b0000;
	#6 D=4'b1111;
	#3 set=0;
	#3 D=4'b0000;
	#6 D=4'b1111;
	#6 D=4'b0000;
	#6 D=4'b1111;
	#6 D=4'b0000;
	#6 D=4'b1111;
	#6 D=4'b0000;
	#6 D=4'b1111;
	#6 D=4'b0000;
	#6 D=4'b1111;
	#6 D=4'b0000;
	#6 D=4'b1111;
	#6 D=4'b0000;
	#6 D=4'b1111;
	#6 D=4'b0000;
	#6 D=4'b1111;
	#6 D=4'b0000;
	#6 D=4'b1111;
	#6 D=4'b0000;
	
	end 
	
	initial
	#155 $finish; 

	initial begin
     $dumpfile("Ejercicio5_tb.vcd");
     $dumpvars(0, tb_DFF);
    end

endmodule 