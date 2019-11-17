//-----------------------------------------------------------------------------
//
// Title       : Block
// Design      : Digital camera
// Author      : user
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Digital camera\compile\Block_diagram.v
// Generated   : Sat Nov 16 17:42:34 2019
// From        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Digital camera\src\Block_diagram.bde
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

module Block (Clk,Exp_decrease,Exp_increase,Init,Reset,ADC,Erase,Expose,NRE_1,NRE_2) ;

// ------------ Port declarations --------- //
input Clk;
wire Clk;
input Exp_decrease;
wire Exp_decrease;
input Exp_increase;
wire Exp_increase;
input Init;
wire Init;
input Reset;
wire Reset;
output ADC;
wire ADC;
output Erase;
wire Erase;
output Expose;
wire Expose;
output NRE_1;
wire NRE_1;
output NRE_2;
wire NRE_2;

// ----------------- Constants ------------ //
parameter DANGLING_INPUT_CONSTANT = 1'bZ;

// ---- Declaration for Dangling inputs ----//
wire Dangling_Input_Signal = DANGLING_INPUT_CONSTANT;

// -------- Component instantiations -------//

FSM_ex_control U1
(
	.ADC(),
	.Clk(Dangling_Input_Signal),
	.Erase(),
	.Expose(),
	.Init(Dangling_Input_Signal),
	.NRE_1(),
	.NRE_2(),
	.Ovf4(Dangling_Input_Signal),
	.Ovf5(Dangling_Input_Signal),
	.Reset(Dangling_Input_Signal)
);



endmodule 
