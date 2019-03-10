module sequence_detector(SW, KEY, LEDR);
	input [1:0] SW;    //SW[0]: reset signal; SW[1]: input signal (w).
	input [3:0] KEY;   // KEY[0]: KEY[0]
	output [9:0] LEDR; // LEDR[2:0]: Current State; LEDR[9]: Output.
	reg [2:0] y_Q, Y_D; 

	localparam A = 3'b000, 
				  B = 3'b001, 
				  C = 3'b010, 
				  D = 3'b011, 
				  E = 3'b100, 
				  F = 3'b101, 
				  G = 3'b110;
	assign LEDR[2:0] = y_Q;

	always @(*)
	begin 
		case (y_Q)
			A: Y_D = SW[1] ? B : A;
			B: Y_D = SW[1] ? C : A;
			C: Y_D = SW[1] ? D : E;
			D: Y_D = SW[1] ? F : E;
			E: Y_D = SW[1] ? G : A;
			F: Y_D = SW[1] ? F : E;
			G: Y_D = SW[1] ? C : A;
			default: Y_D = A;
       endcase
	end

	always @(negedge KEY[0], negedge SW[0])
   begin
		if (SW[0] == 1'b0)
			y_Q <= A;
		else
			y_Q <= Y_D;
	end
	assign LEDR[9] = ((y_Q == F) || (y_Q == G)); 
endmodule
