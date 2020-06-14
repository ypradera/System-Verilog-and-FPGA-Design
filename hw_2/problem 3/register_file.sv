//////////////////////////////////////////////////////////////
// register_file.sv - Register File for ALU/REGFILE problem
//
//
// Description:
// ------------
// Implements a parameterized Register File.  The register file
// is a dual read port, single write port Register file such as 
// would be used in a RISC CPU
//
// Note:  Original code created by Michael Ciletti
////////////////////////////////////////////////////////////////

import ALU_REGFILE_defs::*;

module register_file (
		output logic [REGFILE_WIDTH-1:0]		Data_Out_1, Data_Out_2,		// dual read port outputs from the register file
		input  logic [REGFILE_WIDTH-1:0]		Data_In,					// single write port input to the register file
		input  logic [REGFILE_ADDR_WIDTH-1:0]	Read_Addr_1, Read_Addr_2,	// read port addresses
		input  logic [REGFILE_ADDR_WIDTH-1:0]	Write_Addr,					// address to write Data_In to
		input  logic							Write_enable,				// write enable (1 to write)
		input  logic							Clock						// clock
);

timeunit 1ns/1ns;

// define the register file
logic [REGFILE_WIDTH-1:0]	regfile[REGFILE_SIZE];


// initialize the register file locations to all 0's
initial begin
	for (int i = 0; i < REGFILE_SIZE; i++)begin
		regfile[i] = '0;
	end
end


// implement the register file logic

// update the two read ports
assign Data_Out_1 = regfile[Read_Addr_1];
assign Data_Out_2 = regfile[Read_Addr_2];

// do a write if Write_enable is asserted
always @(posedge Clock) begin
	if (Write_enable == 1'b1) begin
		regfile[Write_Addr] = Data_In;
	end
end

endmodule: register_file
	