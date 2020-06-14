//////////////////////////////////////////////////////////////
// tb_hw2_prob2.sv 
//
// Author: Yusme Pradera ypradera@pdx.edu
// Date: 5/1/2020
//
// HW2 part 1.b
// Test bench for Problem 1  
////////////////////////////////////////////////////////////////
module tb_hw2_prob2(A,B,C,D,Y);
timeunit 1ns/1ns;
parameter delay = 5;
output A, B, C, D;
input  Y;

logic A,B,C,D,Y;

int e,f,g,h; 
	// Genreating the combinations for A, B, C and D
	initial begin
		for(e=0;e<2;e++) begin
			A=e;
		
		for(f=0;f<2;f++) begin
			B=f;
				
		for(g=0;g<2;g++) begin
			C=g;
					
		for(h=0;h<2;h++) begin												
			D=h;
#delay;
$monitor("For inputs: A = %b, B = %b, C = %b, D = %b :: outputs: Y = %b", A,B,C,D,Y);
	end //firts loop 
	end //second loop 
	end //third loop
	end //fourth loop 
end 

endmodule