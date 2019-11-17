`timescale 1 ms / 100 us
module Timer_Counter_tb;


//Internal signals declarations:
reg Clk, Reset, Start;
reg [4:0]Exp_Time;
wire Ovf4, Ovf5;

// Unit Under Test port map
	Timer_Counter UUT (
		.Clk(Clk),
		.Reset(Reset),
		.Start(Start),
		.Exp_Time(Exp_Time),
		.Ovf4(Ovf4),
		.Ovf5(Ovf5));
	  
// Clock generation
always 
	#0.5 Clk = ~Clk;
		
// Initialize 
initial 
	begin	  
		// Initializes all input values to Zero
		Clk = 1'b0;
		Reset = 1'b0;
		Start = 1'b0;
		Exp_Time = 8'd8; 
		
		// Reset the module
		#0.5; Reset = 1'b1;
		#0.5; Reset = 1'b0;
			
		// Drive input signals	
		#0.5; Start = 1'b1; // Pulse on start
		//#1; Start = 1'b0; // ---- " ----
		
		// Stop simulation	
		#50; Start = 1'b0;
		#10; $finish;
		
	end					

	// Defines monitor outputs
//initial
	//$monitor($realtime,,"ps %h %h %h %h %h %h ",Clk,Reset,Start,Exp_Time,Ovf4,Ovf5);

endmodule
