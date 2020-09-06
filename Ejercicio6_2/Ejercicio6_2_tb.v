module tb_DFF();

reg clk, reset, set, A; 
reg [2:0] FS;
wire[2:0] Y;

BehavioralLeveling_FSM   FMS_1(clk, reset, set, A, Y);

initial begin
	clk=0;
	forever #10 clk = ~clk;  
end 

initial begin

	#1 $display("");
	$display("EJERCICIO 6: EJERCICIO 3");
    $display("A |  FS   Y ");
    $display("--|-------------");
    $monitor(" %b | S%b %b ", A, FS, Y);
	   
	   reset = 1; A = 1; set = 0; FS = 0;
	#1 reset=0;
    #13  A = 1; FS = 0; 
    #10  A = 1; FS = 1; 
    #10  A = 1; FS = 1; 
    #10  A = 1; FS = 2;
    #10  A = 1; FS = 2; 
    #10  A = 1; FS = 3; 
	#10  A = 1; FS = 3; 
    #10  A = 1; FS = 4;
    #10  A = 1; FS = 4; 
    #10  A = 1; FS = 5;
	#10  A = 1; FS = 5; 
    #10  A = 1; FS = 6;
    #10  A = 1; FS = 6; 
    #10  A = 1; FS = 7;
	#10  A = 1; FS = 7;
	#10  A = 0; FS = 0; 
    #10  A = 0; FS = 0; 
    #10  A = 0; FS = 7;
    #10  A = 0; FS = 7; 
    #10  A = 0; FS = 6; 
	#10  A = 0; FS = 6; 
    #10  A = 0; FS = 5;
    #10  A = 0; FS = 5; 
    #10  A = 0; FS = 4;
	#10  A = 0; FS = 4; 
    #10  A = 0; FS = 3;
    #10  A = 0; FS = 3; 
    #10  A = 0; FS = 2;
	#10  A = 0; FS = 2;
	#10  A = 0; FS = 1;
	#10  A = 0; FS = 1;
	#10  reset = 1;
	#10 $display("");
 end
	
	initial
	#350 $finish; 

	initial begin
     $dumpfile("Ejercicio6_2_tb.vcd");
     $dumpvars(0, tb_DFF);
    end

endmodule 