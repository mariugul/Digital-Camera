//-----------------------------------------------------------------------------
//
// Title       : RE_Control_tb
// Design      : Digital camera
// Author      : user
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : RE_Control_TB.v
// Generated   : Sat Nov 16 18:39:06 2019
// From        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Digital camera\src\TestBench\RE_Control_TB_settings.txt
// By          : tb_verilog.pl ver. ver 1.2s
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps
module RE_Control_tb;
//Parameters declaration: 
defparam UUT.DANGLING_INPUT_CONSTANT = 1'bZ;
parameter DANGLING_INPUT_CONSTANT = 1'bZ;

//Internal signals declarations:
reg Clk;
reg Exp_decrease;
reg Exp_increase;
reg Init;
reg Reset;
wire ADC;
wire Erase;
wire Expose;
wire NRE_1;
wire NRE_2;



// Unit Under Test port map
	RE_Control UUT (
		.Clk(Clk),
		.Exp_decrease(Exp_decrease),
		.Exp_increase(Exp_increase),
		.Init(Init),
		.Reset(Reset),
		.ADC(ADC),
		.Erase(Erase),
		.Expose(Expose),
		.NRE_1(NRE_1),
		.NRE_2(NRE_2));

initial
	$monitor($realtime,,"ps %h %h %h %h %h %h %h %h %h %h ",Clk,Exp_decrease,Exp_increase,Init,Reset,ADC,Erase,Expose,NRE_1,NRE_2);

endmodule
