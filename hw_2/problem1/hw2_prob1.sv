//////////////////////////////////////////////////////////////
// hw2_prob1.sv 
//
// Author: Yusme Pradera ypradera@pdx.edu
// Date: 5/1/2020
//
// HW2 part 1.a
// 
////////////////////////////////////////////////////////////////
module hw2_prob1 (
input logic A, B, C, D,
output logic Y
);
timeunit 1ns/1ns;
assign Y = (~(A|D))&(B&C&~D);

endmodule: hw2_prob1

module hw2_prob1_Top;
	timeunit 1ns/1ns;
	logic Y,A,B,C,D;
		
	// instantiating the hw2_prob1 module
	hw2_prob1 test1(.*);
		
	
	//instantiating the testbench
	tb_hw2_prob2 TB(.*);
	
endmodule : hw2_prob1_Top