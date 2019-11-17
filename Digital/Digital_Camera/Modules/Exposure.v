`ifdef _VCP
`else
`define library(a,b)
`endif


// ---------- Design Unit Header ---------- //
`timescale 1 ms / 100 us

module Ctrl_Ex_Time (Clk,Exp_Decrease,Exp_Increase,Reset,Counter_Clk,Counter_Reset,Exp_Time) ;

// ------------ Port declarations --------- //
input Clk;
wire Clk;
input Exp_Decrease;
wire Exp_Decrease;
input Exp_Increase;
wire Exp_Increase;
input Reset;
wire Reset;
output Counter_Clk;
wire Counter_Clk;
output Counter_Reset;
wire Counter_Reset;
output [4:0] Exp_Time;
reg [4:0] Exp_Time; // 5-bit register for storing value 2-30ms

// ----------- Signal declarations -------- //
wire NET21;
wire NET25;

// ----------- Terminals assignment --------//
//	       ---- Input terminals ---         //
assign NET21 = Clk;
assign NET25 = Reset;

//		   ---- Output terminals ---        //
assign Counter_Clk = NET21;
assign Counter_Reset = NET25;

// ----------- Logic ---------------------- // 

// Map clock and reset to timer 
assign Counter_Clk = Clk;			
assign Counter_Reset = Reset;

// Reset
always@(posedge Reset)	 
	Exp_Time <= 5'd15;  // Set exposure time to 15ms on reset 	
	
// Clock tick
always@(posedge Clk)
	begin		
		//----------------------------------------
		
		// Exposure increase
		if (Exp_Increase == 1 && Exp_Time < 30)		// Limit increase to 30ms
			Exp_Time <= Exp_Time + 1; 				// Add '1ms' to the register
			
		// Exposure decrease
		else if (Exp_Decrease == 1 && Exp_Time > 2) // Limit decrease to 2ms
			Exp_Time <= Exp_Time - 1; 				// Subtract '1ms' from the register	
		
		//----------------------------------------
	end
endmodule 
