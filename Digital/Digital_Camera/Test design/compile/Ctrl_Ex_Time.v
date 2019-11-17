//-----------------------------------------------------------------------------
//
// Title       : Ctrl_Ex_Time
// Design      : Test design
// Author      : user
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Test design\compile\Ctrl_Ex_Time.v
// Generated   : Sun Nov 17 04:06:36 2019
// From        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Test design\src\Ctrl_Ex_Time.bde
// By          : Bde2Verilog ver. 2.01
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`ifdef _VCP
`else
`define library(a,b)
`endif


// ---------- Design Unit Header ---------- //
`timescale 1ps / 1ps

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
initial Exp_Time = 5'd15; // Initialize exposure time to 15ms
	
always@(posedge Clk or posedge Reset)
	begin
		// Checks the exposure time	
		if (Reset == 0) 
		begin
			// Exposure increase
			if (Exp_Increase == 1 && Exp_Time < 30)		// Limit increase to 30ms
				Exp_Time <= Exp_Time + 1; 							// Add '1ms' to the register
					 
			else if (Exp_Decrease == 1 && Exp_Time > 2) // Limit decrease to 2ms
				Exp_Time <= Exp_Time - 1; 							// Subtract '1ms' from the register					
		end
		// Reset
		else
			Exp_Time <= 5'd15; 							// Set exposure time to 15ms on reset 	
	end
endmodule 
