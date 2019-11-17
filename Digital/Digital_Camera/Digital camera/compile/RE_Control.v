//-----------------------------------------------------------------------------
//
// Title       : RE_Control
// Design      : Digital camera
// Author      : user
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Digital camera\compile\RE_Control.v
// Generated   : Sat Nov 16 18:16:49 2019
// From        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Digital camera\src\RE_Control.bde
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

module RE_Control (Clk,Exp_decrease,Exp_increase,Init,Reset,ADC,Erase,Expose,NRE_1,NRE_2) ;

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

// ----------- Signal declarations -------- //
wire NET118;
wire NET63;
wire NET86;
wire NET96;

// ---- Declaration for Dangling inputs ----//
wire Dangling_Input_Signal = DANGLING_INPUT_CONSTANT;

// -------- Component instantiations -------//

FSM_ex_control U5
(
	.ADC(ADC),
	.Clk(Clk),
	.Erase(Erase),
	.Expose(Expose),
	.Init(Init),
	.NRE_1(NRE_1),
	.NRE_2(NRE_2),
	.Ovf4(NET63),
	.Ovf5(NET86),
	.Reset(NET96)
);



Timer_counter U6
(
	.Clk(Clk),
	.Initial(NET118),
	.Ovf4(NET63),
	.Ovf5(NET86),
	.Reset(NET96),
	.Start(Dangling_Input_Signal)
);



CTRL_ex_time U7
(
	.Clk(Clk),
	.Exp_decrease(Exp_decrease),
	.Exp_increase(Exp_increase),
	.Exp_time(NET118),
	.Reset(NET96)
);



endmodule 
