module tb_DFF();

reg clk, reset, set, A, B; 
reg [1:0]FS;
wire Y;

BehavioralLeveling_FSM   FMS_1(clk, reset, set, A, B, Y);

initial begin
	clk=0;
	forever #10 clk = ~clk;  
end 

initial begin

	#1 $display("");
	$display("EJERCICIO 6: EJERCICIO 1");
    $display(" A  B | FS  Y ");
    $display("-----|------------");
    $monitor(" %b  %b |  S%b   %b ", A, B, FS, Y);
	   
	   reset = 1; A = 0; B = 0; set = 0; FS = 0;
	#1 reset=0;
    #13  A = 0; B = 0; FS = 0; 
    #10  A = 0; B = 0; FS = 0; 
    #10  A = 1; B = 0; FS = 0; 
    #10  A = 1; B = 0; FS = 1;
    #10  A = 1; B = 0; FS = 1; 
    #10  A = 1; B = 0; FS = 0; 
	#10  A = 1; B = 0; FS = 0; 
    #10  A = 1; B = 1; FS = 1;
    #10  A = 1; B = 1; FS = 1; 
    #10  A = 1; B = 1; FS = 2;
	#10  A = 1; B = 1; FS = 2; 
    #10  A = 1; B = 0; FS = 0;
    #10  A = 0; B = 0; FS = 0; 
    #10  A = 0; B = 0; FS = 0;
	#10  A = 0; B = 0; FS = 0;	
	#10 $display("");
 end
	
	initial
	#180 $finish; 

	initial begin
     $dumpfile("Ejercicio6_1_tb.vcd");
     $dumpvars(0, tb_DFF);
    end

endmodule 