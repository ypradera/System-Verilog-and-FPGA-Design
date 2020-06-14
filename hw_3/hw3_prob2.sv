//////////////////////////////////////////////////////////////
// hw3_prob2.sv - Car Wash FSM
//
// Author: Yusme Pradera (ypradera@pdx.edu)
// Date: 5/22/20
//
// Description:
// ------------
// Implementation of FSM for a car wash sequence given as a state diagram 
////////////////////////////////////////////////////////////////

module carwash_fsm(
input logic clk, CLR, 	// clock and reset signal. CLR is asserted high
						// to reset the FSM
input logic TOKEN,		 // customer inserted a token. Asserted high
input logic START, 		// customer pressed the START button. Asserted high
input logic T1DONE, 	// spray time has expired. Asserted high
input logic T2DONE, 	// rinse time (after soap) has expired. Asserted
						// high
output logic CLRT1, 	// clear the spray timer. Assert high
output logic CLRT2, 	// clear the rinse timer. Assert high
output logic SOAP, 		// apply soap. Assert high
output logic SPRAY	 // turn on the spray. Assert high
);

    timeunit 1ns/1ns;

    typedef enum logic [2:0] {
        S0 = 3'b000,
        S1 = 3'b001,
        S2 = 3'b010,
        S3 = 3'b011,
        S4 = 3'b100
    } sta;
		// current state  and next state
    sta c_s, n_s;

    // Next state 
    always_comb begin: next_state
        case (cs)
            S0 :  if (!TOKEN)        n_s = S0;
                    else             n_s = S1;
            
			S1 :  if (START)         n_s = S4;
                  
				  else if (TOKEN)    n_s = S2;                    
					else             n_s = S1;
           
		   S2 :  if (T1DONE)         n_s = S3;
                    else             n_s = S2;
            
			S3 :  if (T2DONE)        n_s = S4;
                    else             n_s = S3;
            
			S4 :  if (T1DONE)        n_s = S0;
                    else             n_s = S4;
            //default case
			default:                 n_s = S0;
        endcase
    end: next_state

    //Out logic
    always_comb begin: out_logic
        {CLRT1, CLRT2, SOAP, SPRAY}   = 4'b0000;
        
		case (cs)
            S0  :   ;
            S1  :   CLRT1             = 1'b1;
            S2  :   {CLRT2, SPRAY}    = 2'b11;
            S3  :   {CLRT1, SOAP}     = 2'b11;
            S4  :   SPRAY             = 1'b1;
        
		default:{CLRT1, CLRT2, SOAP, SPRAY} = 4'bxxxx;
        endcase
   
   end: out_logic

    //seq logic
    always_ff @(posedge clk) begin: seq_logic
        if (CLR == 1)
            cs  <=  S0;
        else
            cs  <=  n_s;
    end: seq_logic

endmodule: carwash_fsm