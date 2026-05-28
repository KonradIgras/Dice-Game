
`timescale 1ns / 1ps

module lock(CE, BUTTON, SWITCH, LOCKED);
    wire CE;
    input CE;
    wire BUTTON;
    input BUTTON;
    wire SWITCH;
    input SWITCH;
    reg LOCKED;
    output LOCKED;

always @(posedge BUTTON) begin
    if(CE)    
	if (SWITCH == 0)
       	    LOCKED <= ~LOCKED;
    	end

endmodule