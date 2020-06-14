/////////////////////////////////////////////////////////////
// tb_hw2_prob2.sv 
//
// Author: Yusme Pradera ypradera@pdx.edu
// Date: 5/2/2020
//
// HW2 part 2.b
// 
////////////////////////////////////////////////////////////////

module tb_hw2_prob2(x_in1, x_in2, x_in3, x_in4, x_in5, enable, y_out);

	timeunit 1ns/1ns;
	parameter delay=5; 
	
	output x_in1, x_in2, x_in3, x_in4, x_in5, enable;
	input y_out;
	
	logic x_in1, x_in2, x_in3, x_in4, x_in5, enable;
	tri y_out;
	int e,f,g,h,z,en; 

	// Generating combinations 
	initial begin
		for(en=0;en<2;en++) begin
			enable=en; 	
			
		for(f=0;f<2;j++) begin
			x_in1=f;	
			
		for(q=0;g<2;g++) begin
			x_in2=g;	
			
		for(h=0;h<2;h++) begin
			x_in3=h;	
			
		for(z=0;z<2;z++) begin
			x_in4=z;
			
		for(e=0;e<2;e++) begin
			x_in5=e;		
#delay;
$monitor("For inputs: x_in1 = %b, x_in2 = %b, x_in3 = %b, x_in4 = %b, x_in5 = %b, enable = %b :: outputs: y_out = %b", x_in1,x_in2,x_in3,x_in4,x_in5,enable,y_out);
    end //first loop
	end //second loop 
	end //third loop 
	end //fourt loop 
	end //fifth loop 
	end //sixth loop 
end

endmodule