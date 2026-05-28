`timescale 1ns / 1ps

module seg7(CLK, CLR, CE, IN0, IN1, IN2, IN3, IN4, OUT, AN);
    wire CE;
	input CE;
    wire CLK;								  
	input CLK;
    wire CLR; 
	input CLR;
    wire [3:0]IN0;
	input [3:0]IN0;
    wire [3:0]IN1;
	input [3:0]IN1;
    wire [3:0]IN2;
	input [3:0]IN2;
    wire [3:0]IN3;
	input [3:0]IN3;
    wire [3:0]IN4;
	input [3:0]IN4;
    wire [6:0]OUT;
	output [6:0]OUT;
    reg [4:0]AN;
	output [4:0]AN;
    
    reg [3:0] NumData [0:4];
    reg [2:0] count;
    
    always @(posedge CLK or posedge CLR)
        if(CLR)
            count <= 3'b000;
        else
	if(CE)
            if(count==3'b100)
            	count <= 3'b000;
            else 
                count <= count + 1;
    always @(*)
        begin
            NumData[0] = IN0;
            NumData[1] = IN1;
            NumData[2] = IN2;
            NumData[3] = IN3;
            NumData[4] = IN4;
            
            AN = ~(5'b00001 << count);
        end 
    assign OUT = bin2seg7(NumData[count]);
    function [6:0] bin2seg7; 
        input [3:0] num; 
        begin 
            case(num) 
                4'd0: bin2seg7 = 7'b0111111; 
                4'd1: bin2seg7 = 7'b0000110; 
                4'd2: bin2seg7 = 7'b1011011; 
                4'd3: bin2seg7 = 7'b1001111; 
                4'd4: bin2seg7 = 7'b1100110; 
                4'd5: bin2seg7 = 7'b1101101; 
                4'd6: bin2seg7 = 7'b1111101;
                4'd7: bin2seg7 = 7'b0000111;
                4'd8: bin2seg7 = 7'b1111111;
                4'd9: bin2seg7 = 7'b1101111; 
                default: bin2seg7 = 7'b0000000; 
            endcase 
        end 
    endfunction
endmodule
