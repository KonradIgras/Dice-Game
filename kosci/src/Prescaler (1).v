//-----------------------------------------------------------------------------
//
// Title       : Prescaler
// Design      : TutorVerilog_final
// Author      : PJR
// Company     : AGH
//
//-----------------------------------------------------------------------------
//
// File        : D:\My_Office\AGH\Dydaktyka\PSC\AHDL\Verilog\TutorVerilog\TutorVerilog_final\src\Prescaler.v
// Generated   : Sun Dec  1 16:56:08 2024
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ps


module Prescaler #(parameter integer DIVIDE_FACTOR = 10)(CLK, CLR, CEO);
	
wire CLK;
input CLK;
wire CLR;
input CLR;
wire CEO;
output CEO;
	
localparam integer CNT_WIDTH = $clog2(DIVIDE_FACTOR);
reg [CNT_WIDTH-1:0] Divider;           					// internal divider register 
									// remember to adjust lenght of Divider register when DIVIDE_FACTOR is being changed

	always @(posedge CLK, posedge CLR)
		if (CLR)
			Divider <= 0;
		else
			if (Divider == DIVIDE_FACTOR-1)
				Divider <= 0;
			else
				Divider <= Divider + 1;

assign CEO = (Divider == (DIVIDE_FACTOR-1)) ? 1 : 0; // full parethesis

//assign CEO = Divider == DIVIDE_FACTOR-1 & CE ? 1 : 0; // no parethesis at all - natural operator precedence

	
endmodule