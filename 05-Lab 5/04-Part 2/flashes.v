module flashes(SW, CLOCK_50, HEX0, LEDR);	
	input [2:0] SW;	    //SW[1:0] for rate selection, SW[2] for reset_n.
	input CLOCK_50;		
	output [6:0] HEX0;    //Display the result in base 10.
	output [3:0] LEDR;    //Displaying the binary result.
	wire enable;          //Whether to enable the counter.
	reg [27:0] count;     //28 comes from log_2 <199_999_999> = 27.57.

	always @(*)
	begin
		case (SW[1:0])
			2'b00: count[27:0] = 28'd0;
			2'b01: count[27:0] = 28'd49_999_999;
			2'b10: count[27:0] = 28'd99_999_999;
			2'b11: count[27:0] = 28'd199_999_999;
			default: count[27:0] = 28'd0;
		endcase
	end

	RateDivider r0(
		.Clock(CLOCK_50), 
		.reset_n(SW[2]), 
		.enable(enable), 
		.d(count[27:0])
	);
	counter d0(
		.Clock(CLOCK_50), 
		.enable(enable), 
		.reset_n(SW[2]), 
		.q(LEDR[3:0])
	);
	hexDecoder h0(
		.SW(LEDR[3:0]), 
		.HEX(HEX0[6:0])
	);
endmodule

module counter(Clock, enable, reset_n, q);
	input Clock;
	input enable;
	input reset_n;
	output [3:0] q;
	reg [3:0] count;

	always @(posedge Clock, negedge reset_n)
	begin
		if (reset_n == 1'b0)
			count[3:0] <= 4'b0000;
		else if (enable == 1'b1)
			begin
				if (count[3:0] == 4'b1111)
					count[3:0] <= 4'b0000;
				else
					count[3:0] <= count[3:0] + 4'b0001;
			end
	end
	assign q[3:0] = count[3:0];
endmodule

module RateDivider(Clock, reset_n, enable, d);
	input [27:0] d;
	input reset_n;
	input Clock;
	output enable;
	reg [27:0] d_old;
	reg [27:0] count;

	always @(posedge Clock, negedge reset_n)
	begin
		if (reset_n == 1'b0)
			count[27:0] <= d[27:0];
		else if (count[27:0] == 28'd0)
			count[27:0] <= d[27:0];
		else if (d[27:0] != d_old[27:0])
			begin
				count[27:0] <= d[27:0];
				d_old[27:0] <= d[27:0];
			end
		else
			count[27:0] <= count[27:0] - 28'd1;
	end
	assign enable = (count[27:0] == 28'd0) ? 1'b1 : 1'b0;
endmodule

module hexDecoder (SW, HEX);
	input [3:0] SW;
	reg [6:0] result;
	output [6:0] HEX;
	always @(*)
	begin
		case (SW[3:0])
			4'b0000: result[6:0] = 7'b1000000;
			4'b0001: result[6:0] = 7'b1111001;
			4'b0010: result[6:0] = 7'b0100100;
			4'b0011: result[6:0] = 7'b0110000;
			4'b0100: result[6:0] = 7'b0011001;
			4'b0101: result[6:0] = 7'b0010010;
			4'b0110: result[6:0] = 7'b0000010;
			4'b0111: result[6:0] = 7'b1111000;
			4'b1000: result[6:0] = 7'b0000000;
			4'b1001: result[6:0] = 7'b0010000;
			4'b1010: result[6:0] = 7'b0001000;
			4'b1011: result[6:0] = 7'b0000011;
			4'b1100: result[6:0] = 7'b1000110;
			4'b1101: result[6:0] = 7'b0100001;
			4'b1110: result[6:0] = 7'b0000110;
			4'b1111: result[6:0] = 7'b0001110;
			default: result[6:0] = 7'b1000000;
		endcase
	end
	assign HEX[6:0] = result[6:0];
endmodule