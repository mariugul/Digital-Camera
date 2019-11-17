//-----------------------------------------------------------------------------
//
// Title       : RE_Control_tb
// Design      : Test design
// Author      : user
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : RE_Control_TB.v
// Generated   : Sun Nov 17 01:01:48 2019
// From        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Test design\src\TestBench\RE_Control_TB_settings.txt
// By          : tb_verilog.pl ver. ver 1.2s
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps
module RE_Control_tb;


//Internal signals declarations:
reg Clk;
reg Exp_Decrease;
reg Exp_Increase;
reg Reset;
reg Take_pic;
wire ADC;
wire Erase;
wire Expose;
wire NRE_1;
wire NRE_2;



// Unit Under Test port map
	RE_Control UUT (
		.Clk(Clk),
		.Exp_Decrease(Exp_Decrease),
		.Exp_Increase(Exp_Increase),
		.Reset(Reset),
		.Take_pic(Take_pic),
		.ADC(ADC),
		.Erase(Erase),
		.Expose(Expose),
		.NRE_1(NRE_1),
		.NRE_2(NRE_2));	   

always
	#0.5 Clk = ~Clk; // Generate a clock signal at 1kHz
		
initial
	begin	
		Clk = 1'b0;		   	//Reset clock and define initial values
		Reset = 1'b0;							  
		Take_pic = 1'b0;
		Exp_Increase = 1'b0;
		Exp_Decrease = 1'b0;
		#1; Reset = 1'b1;
		#1; Reset = 1'b0;		
		#1; Exp_Increase = 1'b1;
		#10; Exp_Increase = 1'b0;
		#1; Take_pic = 1'b1;
		#1; Take_pic = 1'b0;
		#40 $finish; // Stop the simulation after 40ms delay
	end

initial
	$monitor($realtime,,"ps %h %h %h %h %h %h %h %h %h %h ",Clk,Exp_Decrease,Exp_Increase,Reset,Take_pic,ADC,Erase,Expose,NRE_1,NRE_2);

endmodule
