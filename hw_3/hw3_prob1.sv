//////////////////////////////////////////////////////////////
// hw3_prob1.sv - Shift Register
//
// Author: Yusme Pradera (ypradera@pdx.edu)
// Date: 5/22/20
//
// Description:
// ------------
// Implementation of n bits serial in parallel out 4-bit shift register
////////////////////////////////////////////////////////////////

module hw3_prob1(CLK, CLR, SHIFT, SerialIn, Q);
	timeunit 1ns/1ns;
	parameter WIDTH = 4;
    input logic SerialIn, SHIFT, CLK, CLR;
    output logic [WIDTH-1:0] Q;
	logic [WIDTH-1:0] D;
	
	// Mux implementation 
    always_comb begin
        if (SHIFT == 1'b1) D = {SerialIn, Q[WIDTH-1:1]};
			else		   D = Q;
		end
		
	// Shift register 
	always_ff@(posedge CLK) begin 
		if(CLR)		Q <= '0;
			else	Q <= D;
    end

endmodule