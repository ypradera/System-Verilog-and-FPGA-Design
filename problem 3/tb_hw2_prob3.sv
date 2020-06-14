//////////////////////////////////////////////////////////////
// tb_hw2_prob3.sv - testbench for the ALU/REGFILE problem
//
//
// Description:
// ------------
// Implements a testbench for the ALU/REGFILE problem.  Not exhaustive
// coverage but I tried to implement it in a way that additional tests could be added
//
// Note:  Original code created by Michael Ciletti
////////////////////////////////////////////////////////////////

import ALU_REGFILE_defs::*;

module tb_hw2_prob3;

timeunit 1ns/1ns;

// parameters and constants
parameter	CLK_PERIOD = 10;	// clock period is 10 time units

// declare internal variables
bit								clk = 1'b0;				// system clock
bit   [REGFILE_ADDR_WIDTH-1:0]	rd_addr_1, rd_addr_2;	// register file read port addresses
bit   [REGFILE_ADDR_WIDTH-1:0]	wr_addr, wr_addr_2;		// register file write port addresses
bit								we;						// register file  write enable
bit	  [REGFILE_WIDTH-1:0] 		wr_data, wr_data_2;		// register file write dataregister 						
bit								c_in;					// carry in to the ALU
aluop_t							opc;					// operation for the ALU to perform

logic [ALU_OUTPUT_WIDTH-1:0] 	alu_out; 				// ALU result

// instantiate the alu_regfile (the DUT)
hw2_prob3_dut DUT
(
	.Read_Addr_1(rd_addr_1),
	.Read_Addr_2(rd_addr_2),
	.Write_Addr(wr_addr),
	.Write_enable(we),
	.Write_data(wr_data),
	.Carry_In(c_in),
	.Opcode(opc),
	.ALU_Out(alu_out),
	.Clock(clk)
);

//////////////////////////////////
// Tasks to manipulate the register file
//////////////////////////////////

// define a task to write a location in the register file
task write_regfile(bit [REGFILE_ADDR_WIDTH-1:0] write_addr, bit [REGFILE_WIDTH-1:0] write_data);
	// set up the write address and data

	we = 1'b0;
	wr_addr = write_addr;
	wr_data = write_data;		
	// perform the write operation
	// use the negedge because the regfile is clocked on the posedge
	@(negedge clk);

	we = 1'b1;
	@(negedge clk);
	we = 1'b0;
endtask


// define a task to display the contents of the regfile
task display_regfile;
	$strobe("Contents of the Register file are:");
	for (int i = 0; i < REGFILE_SIZE; i++) begin
		#1  // need to advance simulation time
		rd_addr_1 = i;
		$strobe("regfile[%d]: %b", rd_addr_1, DUT.reg_file.Data_Out_1);
	end
	$strobe("-----------------------------------");
	#10;
endtask


task initialize_regfile(bit [REGFILE_WIDTH-1:0] initial_value);
	$display("initializing register file to %h", initial_value);
	for (int i = 0; i < REGFILE_SIZE; i++) begin
		#1  // need to advance simulation time
		write_regfile(i, initial_value);
	end
	$display ("register file initialization complete");
endtask
	
	
// generate the system clock
always begin
	#(CLK_PERIOD / 2) clk = ~clk;
end // clock generator


// test vectors
initial begin
	$display("Testing register file by walking a 1 through all of the locations");
	
	// initialize the opcode (avoids a warning for QuestaSim)
	opc = ADD_OP;
	
	// initialize the register file locations to 0
	initialize_regfile(16'h0000);	
		
	// initialize the data
	wr_data_2 = 16'h8000;

	// walk 1's through the regfile
	for (int k = 0; k < REGFILE_SIZE; k++) begin
		wr_addr_2 = k;
		if (wr_data_2 == 16'h8000) begin
			wr_data_2 = 16'h0001;
		end
		else begin
			wr_data_2 = wr_data_2 << 1;
		end
		
		// write the data to the regfile
		$display("Writing %b to regfile[%d]", wr_data_2, wr_addr_2);
		write_regfile(wr_addr_2, wr_data_2);
	end
	
	// display the contents of the register file
	$display("\nCheck functionality by manually examining the register file contents");
	display_regfile;
	
	// Test the ALU - this is rudimentary - much room for improvement
	$display("\n\nALU Test - This is rudimentary");
	
	// initialize the register file
	initialize_regfile(16'h1234);
	
	// put some data in the first two register file locations
	// these are the ones we are going to supply to the ALU
	write_regfile(0, 16'h5555);
	write_regfile(1, 16'hAAAA);
	rd_addr_1 = 0;
	rd_addr_2 = 1;
	wr_addr_2 = 5'd23;
	
	// test all of the ALU operations
	for (int j = 0; j < 8; j++) begin
		@(posedge clk);
		case(j)
			0: opc = ADD_OP;
			1: opc = SUB_OP;
			2: opc = SUBA_OP;
			3: opc = ORAB_OP;
			4: opc = ANDAB_OP;
			5: opc = NOTAB_OP;
			6: opc = EXOR_OP;
			7: opc = EXNOR_OP;
		endcase
		
		// display and store the result
		$strobe("operation: %12s\t A_In: %b, B_In: %b, ALU_Out: %b", opc.name,
					DUT.ALU1.A_In, DUT.ALU1.B_In, alu_out);
		#10;  // wait for the dust to settle :)
		wr_addr_2 += 1;
		write_regfile(wr_addr_2, alu_out);

	end
	$display("\nCheck functionality by manually examining the register file");
	display_regfile;
		
	repeat(5)@(posedge clk);
	$display("\nALU/REGFILE Test complete\n");
	$stop;
end

endmodule


		
		



