/////////////////////////////////////////////////////////////
// hw2_prob2.sv 
//
// Author: Yusme Pradera ypradera@pdx.edu
// Date: 5/2/2020
//
// HW2 part 2.a
// 
////////////////////////////////////////////////////////////////

module hw2_prob2 (
input logic x_in1, x_in2, x_in3, x_in4, x_in5, enable,
output tri y_out
);
	timeunit 1ns/1ns;
	logic E; 

	always_comb begin
		E =  ~((x_in1 & x_in2)| (x_in3 & x_in4 & x_in5));
	end
	//For the tri-state 
	assign y_out = enable ? E :1'bz;
	
endmodule : hw2_prob2

module hw2_prob2_Top;
	logic x_in1, x_in2, x_in3, x_in4, x_in5, enable;
	tri y_out;
	
	timeunit 1ns/1ns;
	
// instantiating problem2 module
	hw2_prob2 prob2(
		.x_in1(x_in1),
		.x_in2(x_in2),
		.x_in3(x_in3),
		.x_in4(x_in4),
		.x_in5(x_in5),
		.enable(enable),
		.y_out(y_out)
	);
	
	//test bench 
	tb_hw2_prob2 TB(.*);

endmodule : hw2_prob2_Top