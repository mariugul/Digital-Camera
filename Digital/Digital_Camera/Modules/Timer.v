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
`timescale 1 ms / 100 us

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
output reg Ovf4;
output reg Ovf5;



// Logic implementation	
reg [7:0] Counter;	// 256-bit counter

// Reset
always@(posedge Reset)
	begin
		Ovf4 <= 0;
		Ovf5 <= 0;
		Counter <= 0;
	end
	
// On negative Clock tick
always@(negedge Clk)	 
	begin
		Ovf5 <=  0; // Make sure overflow flags only stay high for one clock pulse
		Ovf4 <=  0; // ---- " ----
	end

// On Clock tick
always@(posedge Clk) 
	begin 
		// Start counter signal
		if( Start == 1)	   
			begin			 	
				//----------------------------------------
				// Increment counter
				Counter <= Counter + 1;
				$display("Counter = %d, Exposure time: %d", Counter, Exp_Time);
				//----------------------------------------
				// Count up to received Exposure time
				if (Counter == Exp_Time) begin
					Ovf5 <= 1;		 
					$display("Ovf5 = HIGH", Counter);
					end							  
				
				//----------------------------------------
				// After X amount of time, drive Ovf4 posedge
				if (Counter == 40)
					Ovf4 <= 1;		
					
				// After X amount of time, drive Ovf4 posedge	(eventually Ovf5?)
				else if (Counter == 60)
					Ovf4 <= 1;						 
					
				//----------------------------------------
			end		  
		// Keep counter at '0' until Start is driven high
		else if (Start == 0)
			Counter <= 0; // Reset counter 
		
					
	end
endmodule
