//-----------------------------------------------------------------------------
//
// Title       : Timer_Counter
// Design      : Test design
// Author      : user
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Test design\compile\Timer_Counter.v
// Generated   : Sun Nov 17 04:38:34 2019
// From        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Test design\src\Timer_Counter.bde
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

module Timer_Counter (Clk,Reset,Start,Exp_Time,Ovf4,Ovf5) ;

// ------------ Port declarations --------- //
input Clk;
wire Clk;
input Reset;
wire Reset;
input Start;
wire Start;
input [4:0] Exp_Time;
wire [4:0] Exp_Time;
output Ovf4;
wire Ovf4;
output Ovf5;
wire Ovf5;


// Logic implementation	
reg [7:0] Counter;	// 256-bit counter

always@(posedge Clk) 
	begin
		if(Start == 1)	   
			begin
		    	Counter <= Counter + 1;
				if(Counter >= Exp_Time)  
						
					
			end		  
		// Reset to zero
		else 
			 Counter <= 0;
			
		
	end
endmodule
