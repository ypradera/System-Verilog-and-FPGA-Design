/////////////////////////////////////////////////////////////
// hw2_prob3_alu.sv 
//
// Author: Yusme Pradera ypradera@pdx.edu
// Date: 5/3/2020
//
// HW2 part 3.a
//
// model for a simple digital system
// the includes an ALU (Arithmetic Logic Unit) with inputs taken from 
// a 32 entry x 16 bit wide Register File
// and the results written back to the Register file
// 
////////////////////////////////////////////////////////////////

import ALU_REGFILE_defs::*;
module hw2_prob3_alu (
	input logic [ALU_INPUT_WIDTH-1:0] A_In, B_In,
	input logic Carry_In,
	input aluop_t Opcode,
	output logic [ALU_OUTPUT_WIDTH-1:0] ALU_Out 												
);
	timeunit 1ns/1ns;
	
	always @(A_In or B_In or Opcode) 
	begin		
		
	case(Opcode)							
		
		ADD_OP :
			begin						
				ALU_Out = A_In + B_In + Carry_In;
			end
			
		SUB_OP : 
			begin					
				ALU_Out = A_In + (~B_In) + Carry_In;
			end
			
		SUBA_OP : 
			begin
				ALU_Out = A_In + (~A_In) + Carry_In;
			end
			
		ORAB_OP : 
			begin	
				ALU_Out = {1'b0, A_In | (B_In)};
			end
			
		ANDAB_OP : 
			begin
				ALU_Out = {1'b0, A_In & (B_In)};
			end
			
		NOTAB_OP : 
			begin	
				ALU_Out = {1'b0, (~A_In) & (B_In)};
			end
			
		EXOR_OP : 
			begin	
				ALU_Out = {1'b0, A_In ^ (B_In)};
			end
			
		EXNOR_OP : 
			begin	
				ALU_Out = {1'b0, A_In ~^ (B_In)};
			end
			
		default : 
			begin		
				ALU_Out = 9'b0;
			end
		endcase
	end
	
endmodule : hw2_prob3_alu