//-----------------------------------------------------------------------------
//
// Title       : RE_Control
// Design      : Test design
// Author      : user
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Test design\compile\RE_Control.v
// Generated   : Sun Nov 17 04:41:16 2019
// From        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Test design\src\RE_Control.bde
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

module RE_Control (Clk,Exp_Decrease,Exp_Increase,Reset,Take_pic,ADC,Erase,Expose,NRE_1,NRE_2) ;

// ------------ Port declarations --------- //
input Clk;
wire Clk;
input Exp_Decrease;
wire Exp_Decrease;
input Exp_Increase;
wire Exp_Increase;
input Reset;
wire Reset;
input Take_pic;
wire Take_pic;
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

// ----------- Signal declarations -------- //
wire NET101;
wire NET111;
wire NET142;
wire NET152;
wire NET162;
wire NET194;
wire [4:0] Bus;

// -------- Component instantiations -------//

Timer_Counter Counter
(
	.Clk(NET111),
	.Exp_Time(Bus[4]),
	.Ovf4(NET142),
	.Ovf5(NET152),
	.Reset(NET101),
	.Start(NET162)
);



Ctrl_Ex_Time Exposure
(
	.Clk(Clk),
	.Counter_Clk(NET111),
	.Counter_Reset(NET101),
	.Exp_Decrease(Exp_Decrease),
	.Exp_Increase(Exp_Increase),
	.Exp_Time(Bus[4]),
	.Reset(Reset)
);



FSM_Ex_Ctrl FSM
(
	.ADC(ADC),
	.Clk(Clk),
	.Erase(Erase),
	.Expose(Expose),
	.NRE_1(NRE_1),
	.NRE_2(NET194),
	.Ovf4(NET142),
	.Ovf5(NET152),
	.Reset(Reset),
	.Start_Timer(NET162),
	.Take_Pic(Take_pic)
);



// ----------- Terminals assignment --------//
//		   ---- Output terminals ---        //
assign NRE_2 = NET194;

endmodule 
