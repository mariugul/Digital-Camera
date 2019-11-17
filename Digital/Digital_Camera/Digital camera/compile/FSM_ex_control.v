//-----------------------------------------------------------------------------
//
// Title       : No Title
// Design      : Digital
// Author      : user
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Digital camera\compile\FSM_ex_control.v
// Generated   : 11/16/19 18:16:28
// From        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Digital camera\src\FSM_ex_control.asf
// By          : FSM2VHDL ver. 5.0.7.2
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ns / 1ps

module FSM_ex_control (ADC, Clk, Erase, Expose, Init, NRE_1, NRE_2, Ovf4, Ovf5, Reset, Timer_start);
input      	Clk;
input      	Init;
input      	Ovf4;
input      	Ovf5;
input      	Reset;
output     	ADC;
output     	Erase;
output     	Expose;
output     	NRE_1;
output     	NRE_2;
output     	Timer_start;

reg         ADC, next_ADC;
wire        Clk;
reg         Erase, next_Erase;
reg         Expose, next_Expose;
wire        Init;
reg         NRE_1, next_NRE_1;
reg         NRE_2, next_NRE_2;
wire        Ovf4;
wire        Ovf5;
wire        Reset;
reg         Timer_start, next_Timer_start;

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