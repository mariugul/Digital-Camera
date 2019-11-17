//-----------------------------------------------------------------------------
//
// Title       : No Title
// Design      : Digital camera
// Author      : user
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Digital camera\compile\Block diagram.v
// Generated   : Sat Nov 16 17:35:49 2019
// From        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Digital camera\src\Block diagram.bde
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

module \Block_diagram  (Input1,Input2) ;

// ------------ Port declarations --------- //
input Input1;
wire Input1;
input Input2;
wire Input2;

// ----------------- Constants ------------ //
parameter DANGLING_INPUT_CONSTANT = 1'bZ;

// ----------- Signal declarations -------- //
wire NET139;
wire NET155;
wire NET221;
wire NET250;
wire NET294;

// ---- Declaration for Dangling inputs ----//
wire Dangling_Input_Signal = DANGLING_INPUT_CONSTANT;

// -------- Component instantiations -------//

CTRL_ex_time U3
(
	.Clk(NET294),
	.Exp_decrease(Dangling_Input_Signal),
	.Exp_increase(Dangling_Input_Signal),
	.Exp_time(NET139),
	.Reset(NET155)
);



Timer_counter U4
(
	.Clk(NET294),
	.Initial(NET139),
	.Ovf4(NET250),
	.Ovf5(NET221),
	.Reset(NET155),
	.Start(Dangling_Input_Signal)
);



endmodule 
