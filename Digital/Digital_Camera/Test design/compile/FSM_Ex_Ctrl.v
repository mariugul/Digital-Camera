//-----------------------------------------------------------------------------
//
// Title       : No Title
// Design      : 
// Author      : user
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Test design\compile\FSM_Ex_Ctrl.v
// Generated   : 11/16/19 21:59:09
// From        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Test design\src\FSM_Ex_Ctrl.asf
// By          : FSM2VHDL ver. 5.0.7.2
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ns / 1ps

module FSM_Ex_Ctrl (ADC, Clk, Erase, Expose, NRE_1, NRE_2, Ovf4, Ovf5, Reset, Start_Timer, Take_Pic);
input      	Clk;
input      	Ovf4;
input      	Ovf5;
input      	Reset;
input      	Take_Pic;
output     	ADC;
output     	Erase;
output     	Expose;
output     	NRE_1;
output     	NRE_2;
output     	Start_Timer;

reg         ADC;
wire        Clk;
reg         Erase;
reg         Expose;
reg         NRE_1;
reg         NRE_2;
wire        Ovf4;
wire        Ovf5;
wire        Reset;
reg         Start_Timer;
wire        Take_Pic;

// USER DEFINED ENCODED state machine: Sreg0
// State codes definitions:
`define Idle 2'b00
`define Exposure 2'b01
`define Readout 2'b10

reg [1:0] CurrState_Sreg0;
reg [1:0] NextState_Sreg0;


//--------------------------------------------------------------------
// Machine: Sreg0
//--------------------------------------------------------------------
//----------------------------------
// Next State Logic (combinatorial)
//----------------------------------
always @ (CurrState_Sreg0)
begin : Sreg0_NextState
	NextState_Sreg0 <= CurrState_Sreg0;
	// Set default values for outputs and signals
	// ... 
	case (CurrState_Sreg0) // synopsys parallel_case full_case
		`Idle:
			NextState_Sreg0 <= `Exposure;
		`Exposure:
			NextState_Sreg0 <= `Readout;
		`Readout:
			NextState_Sreg0 <= `Idle;
	endcase
end

//----------------------------------
// Current State Logic (sequential)
//----------------------------------
always @ (posedge Clk)
begin : Sreg0_CurrentState
	CurrState_Sreg0 <= NextState_Sreg0;
end

endmodule