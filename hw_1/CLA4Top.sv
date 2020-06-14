
module CLA4Top;
timeunit 1ns/1ns;
parameter nBITS = 4;
logic [nBITS - 1 : 0] ain, bin, sum;
logic cin, cout;
// instantiate your 4 bit CLA design module here
CLA4Bit lookA (.*);	
// instantiate the test bench module as follows
test #(4) TB(.*);
endmodule

module CLA4Bit(ain, bin, cin, sum, cout);
	timeunit 1ns/1ns;
	input [3:0] ain,bin;
   	input cin;
    	output logic [3:0] sum;
    	output logic cout;
	
	//#2 AND , OR 
	//#3 XOR
    wire [3:0] G,P,C; //C carry in input
	
	assign #2 G[0] =  (ain[0] & bin[0]);
	assign #2 G[1] =  (ain[1] & bin[1]);
	assign #2 G[2] =  (ain[2] & bin[2]);
	assign #2 G[3] =  (ain[3] & bin[3]);
   
    assign #3 P[0] =  (ain[0] ^ bin[0]);
	assign #3 P[1] =  (ain[1] ^ bin[1]);
	assign #3 P[2] =  (ain[2] ^ bin[2]);
	assign #3 P[3] =  (ain[3] ^ bin[3]);
    
    assign    C[0] = cin;
	assign #4 C[1] = (G[0] | (C[0] & P[0]));
    assign #6 C[2] = (G[1] | (G[0] & P[1]) | (C[0] & P[1] & P[0]));
    assign #8 C[3] = (G[2] | (G[1] & P[2]) | (G[0] & P[1] & P[2]) | (C[0] & P[2] & P[1] & P[0]));
    	
    assign #3 sum[3] =  (P[3] ^ C[3]);
	assign #3 sum[2] =  (P[2] ^ C[2]);
	assign #3 sum[1] =  (P[1] ^ C[1]);
	assign #3 sum[0] =  (P[0] ^ C[0]); 
 	
    assign #10 cout= (G[3] | (G[2]&P[3]) | (G[1]&P[2]&P[3]) | (G[0]&P[1]&P[2]&P[3]) | (C[0]&P[0]&P[1]&P[2]&P[3])); 
			
  endmodule                                    