//-----------------------------------------------------------------------------
//
// Title       : Debouncer
// Design      : Debouncer
// Author      : PJR
// Company     : AGH
//
//-----------------------------------------------------------------------------
//
// Description : Simple debounce circuit
//
//-----------------------------------------------------------------------------

`timescale 1 ns / 1 ps


module Debouncer (CLK, CLR, CEI, PUSH, PE);
		 
input CLK;	// 100 MHz clock
input CLR;	// clear
input CEI;	// clock enable input
input PUSH;	// pushbutton entry
output PE;	// debounced output

wire CLK;
wire CLR;
wire CEI;
wire PUSH;
wire PE;
	

reg [2:0] Delay; 			// debounce register
								

	always @(posedge CLK, posedge CLR)
		if (CLR)
			Delay <= 0;
		else
			if (CEI)
				Delay <= {Delay[1:0], PUSH};	// shift register

assign PE = ((Delay == 3'b011) & CEI) ? 1 : 0;

	
endmodule