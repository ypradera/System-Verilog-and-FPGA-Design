
module CLA8Top;
timeunit 1ns/1ns;
parameter nBITS = 8;
logic [nBITS - 1 : 0] ain, bin, sum;
logic cin, cout;
logic conectLookA;

// instantiate CLA design module here
CLA4Bit lookA1(
	.ain(ain[7:4]),
	.bin(bin[7:4]),
	.cin(conectLookA),
	.sum(sum[7:4]),
	.cout(cout)
);

CLA4Bit lookA(
	.ain(ain[3:0]),
	.bin(bin[3:0]),
	.cin(cin),
	.sum(sum[3:0]),
	.cout(conectLookA)
);


// instantiate the test bench module as follows
test #(8) TB(.*);
endmodule

                                  