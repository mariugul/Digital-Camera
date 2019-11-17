//-----------------------------------------------------------------------------
//
// Title       : No Title
// Design      : Test design
// Author      : user
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Test design\compile\Testbench.v
// Generated   : Sun Nov 17 02:23:55 2019
// From        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Test design\src\Testbench.bde
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

module Testbench (Input1,Input2,Input3,Input4,Input5,Output1,Output2,Output3,Output4,Output5) ;

// ---- User defined diagram parameters --- //

// name = value


// --- User defined diagram declarations -- //
// Enter your code here

// ------------ Port declarations --------- //
input Input1;
wire Input1;
input Input2;
wire Input2;
input Input3;
wire Input3;
input Input4;
wire Input4;
input Input5;
wire Input5;
output Output1;
wire Output1;
output Output2;
wire Output2;
output Output3;
wire Output3;
output Output4;
wire Output4;
output Output5;
wire Output5;

// ----------------- Constants ------------ //
parameter DANGLING_INPUT_CONSTANT = 1'bZ;

// --------------- Init processes ----------//

initial
begin : Initial
	// statements
end

// ---- Declaration for Dangling inputs ----//
wire Dangling_Input_Signal = DANGLING_INPUT_CONSTANT;

// -------------- Always processes ---------//

always
// Section above this comment may be overwritten according to
// "Update sensitivity list automatically" option status
begin : Always_1
	#0.5 clk_in = ~clk_in; // Generate a clock signal at 1kHz
end

// ----------- Continuous assignments -------//

// assign <strength> <delay> net = net or register;
// -------- Component instantiations -------//

RE_Control U1
(
	.ADC(),
	.Clk(Dangling_Input_Signal),
	.Erase(),
	.Exp_Decrease(Dangling_Input_Signal),
	.Exp_Increase(Dangling_Input_Signal),
	.Expose(),
	.NRE_1(),
	.NRE_2(),
	.Reset(Dangling_Input_Signal),
	.Take_pic(Dangling_Input_Signal)
);



endmodule 
