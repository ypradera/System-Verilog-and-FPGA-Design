//////////////////////////////////////////////////////////////
// pmodSSD_Interface.sv  
//
// Author: Yusme Pradera (ypradera@pdx.edu)
// Date: 5/22/20
//
// Description:
// ------------
// Interfacing pmodSSD two-digit 7 segment display
////////////////////////////////////////////////////////////////

module pmodSSD_Interface #(
	parameter SIMULATE = 1				// set to 1 for this project, else it will take
										// 100’s of thousand cycles of simulation time
										// for each digit change.
) (
	input logic clk,  reset, 			// clock and reset signals
	input logic[4:0]  digit1, digit0, 	// digit character codes
	output logic 	  SSD_AG, SSD_AF, 		// Anode segment drivers
	                  SSD_AE, SSD_AD,
					  SSD_AC, SSD_AB, SSD_AA,
	
	output logic SSD_C 					// Common cathode "digit enable"

);

	timeunit 1ns/1ns;
	
	logic tick_60Hz, tick_120Hz;
	logic [6:0] anodes_out;


	function logic [6:0] segment ( input logic [4:0] seg_A ) ;
		case (seg_A)
			// digits from 0 to 9
			'd0: segment = 7'b1111110;
			'd1: segment = 7'b0000110;
			'd2: segment = 7'b1101101;
			'd3: segment = 7'b1111001;
			'd4: segment = 7'b0110011;
			'd5: segment = 7'b1011011;
			'd6: segment = 7'b1011111;
			'd7: segment = 7'b1110000;
			'd8: segment = 7'b1111111;
			'd9: segment = 7'b1111011;

			// Char from A to F
			'd10: segment = 7'b1110111;
			'd11: segment = 7'b0011111;
			'd12: segment = 7'b1001110;
			'd13: segment = 7'b0111101;
			'd14: segment = 7'b1001111;
			'd15: segment = 7'b1000111;

			// from  a to g
			'd16: segment = 7'b1000000;
			'd17: segment = 7'b0100000;
			'd18: segment = 7'b0010000;
			'd19: segment = 7'b0001000;
			'd20: segment = 7'b0000100;
			'd21: segment = 7'b0000010;
			'd22: segment = 7'b0000001;			
			'd23: segment = 7'b0000000; // space
			
			'd24: segment = 7'b0110111; // H 
			'd25: segment = 7'b0001110; // L 			
			'd26: segment = 7'b1110111; // R 		
			'd27: segment = 7'b0000110; // l			
			'd28: segment = 7'b0000101; // r			
			'd29: segment = 7'b0000000; // space
			'd30: segment = 7'b0000000; // space
			'd31: segment = 7'b0000000; // space

			default: segment = 7'bxxxxxxx;
		endcase
	endfunction

	clk_divider #(.SIMULATE(SIMULATE)) OP_hz (.clk(clk),.reset(reset),.tick_out(tick_120Hz)
	);
	
	

// enable
	always_ff @(posedge clk) 
	begin
		if (reset)
			tick_60Hz <= 1'b0;
		else if (tick_120Hz)
			tick_60Hz <= ~tick_60Hz;
		else
			tick_60Hz <= tick_60Hz;
	end
// Mux implementation 
	always_ff @(posedge clk) 
	begin
		if (tick_60Hz)
			anodes_out <= segment(digit1);
		else
			anodes_out <= segment(digit0);
	end

	assign SSD_C = tick_60Hz;
	assign {SSD_AA, SSD_AB, SSD_AC, SSD_AD, SSD_AE, SSD_AF, SSD_AG} = anodes_out;

endmodule: pmodSSD_Interface