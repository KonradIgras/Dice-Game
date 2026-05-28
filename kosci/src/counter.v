`timescale 1ns / 1ps

module counter(CLK, CLR, CE, BIN);
	wire CLK;
    input CLK;
	wire CLR;
    input CLR;
	wire CE;
    input CE;	 
	wire [3:0] BIN;
    output [3:0] BIN;
    
    reg [3:0] count;
    
    always @(posedge CLK or posedge CLR)
        if(CLR)
            count <= 4'b0000;
        else
        if(CE)
            if(count == 4'b0110)
                count <= 4'b0001;
            else
                count <= count + 1;
    assign BIN = count;
            
endmodule