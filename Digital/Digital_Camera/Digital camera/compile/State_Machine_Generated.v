//-----------------------------------------------------------------------------
//
// Title       : FSM Exposure Control
// Design      : Digital Camera
// Author      : Marius C. K. Gulbransen
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Digital camera\compile\State_Machine.v
// Generated   : 11/12/19 17:51:23
// From        : \\sambaad.stud.ntnu.no\mariugul\Documents\Digital_Camera\Digital camera\src\State_Machine.asf
// By          : FSM2VHDL ver. 5.0.7.2
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ns / 1ps

module State_Machine (ADC, Clk, Erase, Exp_Dec, Exp_Inc, Expose, Init, NRE_1, NRE_2, Reset);
input      	Clk;
input      	Exp_Dec;
input      	Exp_Inc;
input      	Init;
input      	Reset;
output     	ADC;
output     	Erase;
output     	Expose;
output     	NRE_1;
output     	NRE_2;

reg         ADC, next_ADC;
wire        Clk;
reg         Erase, next_Erase;
wire        Exp_Dec;
wire        Exp_Inc;
reg         Expose, next_Expose;
wire        Init;
reg         NRE_1, next_NRE_1;
reg         NRE_2, next_NRE_2;
wire        Reset;

// USER DEFINED ENCODED state machine: Sreg0
// State codes definitions:
`define Exposure 2'b01
`define Readout 2'b10
`define Idle 2'b00

reg [1:0] CurrState_Sreg0;
reg [1:0] NextState_Sreg0;


//--------------------------------------------------------------------
// Machine: Sreg0
//--------------------------------------------------------------------
//----------------------------------
// Next State Logic (combinatorial)
//----------------------------------
always @ (Init or Reset or CurrState_Sreg0)
begin : Sreg0_NextState
	NextState_Sreg0 <= CurrState_Sreg0;
	// Set default values for outputs and signals
	// ... 
	case (CurrState_Sreg0) // synopsys parallel_case full_case
		`Exposure:
			if (Ovf5 = '1')	
				NextState_Sreg0 <= `Readout;
			else if (Reset = '1')	
				NextState_Sreg0 <= `Idle;
		`Readout:
			if (Reset = '1' | Ovf4 = '1')	
				NextState_Sreg0 <= `Idle;
		`Idle:
			if (Init = '1' & Reset = '0')	
				NextState_Sreg0 <= `Exposure;
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