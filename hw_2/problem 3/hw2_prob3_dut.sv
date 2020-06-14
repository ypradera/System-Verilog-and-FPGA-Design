/////////////////////////////////////////////////////////////
// hw2_prob3_dut.sv 
//
// Author: Yusme Pradera ypradera@pdx.edu
// Date: 5/3/2020
//
// HW2 part 3.b
// 
// instantiates instances of the ALU module and the register file 
// module provided in the release.
////////////////////////////////////////////////////////////////

import ALU_REGFILE_defs::*;

module hw2_prob3_dut (
	input logic [REGFILE_ADDR_WIDTH-1:0] 	Read_Addr_1,
											Read_Addr_2,
	input logic [REGFILE_ADDR_WIDTH-1:0]	Write_Addr,	
	input logic 							Write_enable,
	input logic [REGFILE_WIDTH-1:0] 		Write_data,

	// This is the ALU interface
	input logic 		Carry_In,
	input aluop_t		Opcode,
	output logic [ALU_OUTPUT_WIDTH-1:0] ALU_Out,
	// clock system
	input logic Clock 
);

	timeunit 1ns/1ns;
	logic [REGFILE_WIDTH-1:0]		d_out1, d_out2;
	logic [ALU_INPUT_WIDTH-1:0]		ain, bin;
	
	assign ain = d_out1[ALU_INPUT_WIDTH-1:0];
	assign bin = d_out2[ALU_INPUT_WIDTH-1:0];
	
	// instantiating module ALU
	hw2_prob3_alu ALU1(
		.A_In(ain),
		.B_In(bin),
		.Carry_In(Carry_In),
		.Opcode(Opcode),
		.ALU_Out(ALU_Out)
	);
	
	// Register file module
	register_file reg_file(
		.Data_Out_1(d_out1),
		.Data_Out_2(d_out2),
		.Data_In(Write_data),
		.Read_Addr_1(Read_Addr_1),
		.Read_Addr_2(Read_Addr_2),
		.Write_Addr(Write_Addr),
		.Write_enable(Write_enable),
		.Clock(Clock)
	);

	
endmodule : hw2_prob3_dut