`timescale 1 ms / 100 us
module Ctrl_Ex_Time_tb;


//Internal signals declarations:
reg Clk;
reg Exp_Decrease;
reg Exp_Increase;
reg Reset;
wire Counter_Clk;
wire Counter_Reset;
wire [4:0]Exp_Time;



// Unit Under Test port map
	Ctrl_Ex_Time UUT (
		.Clk(Clk),
		.Exp_Decrease(Exp_Decrease),
		.Exp_Increase(Exp_Increase),
		.Reset(Reset),
		.Counter_Clk(Counter_Clk),
		.Counter_Reset(Counter_Reset),
		.Exp_Time(Exp_Time));
		
// Clock generation
always 
	#0.5 Clk = ~Clk;
	
// Initialize
initial 
	begin
		// Initializes all input values to Zero
		Clk = 1'b0;
		Reset = 1'b0;
		Exp_Increase = 1'b0;
		Exp_Decrease = 8'b0; 
		
		// Reset the module
		#0.5; Reset = 1'b1;
		#0.5; Reset = 1'b0;
			
		// Test increase of exposure	
		#0.5; Exp_Increase = 1'b1; // Increment by one
		#0.5; Exp_Increase = 1'b0; 
		#2.5; Exp_Increase = 1'b1; // Increment by one
		#0.5; Exp_Increase = 1'b0;
		
		// Stop simulation	
		#10; $finish;
	end
	
initial
	$monitor($realtime,,"ps %h %h %h %h %h %h %h ",Clk,Exp_Decrease,Exp_Increase,Reset,Counter_Clk,Counter_Reset,Exp_Time);

endmodule
