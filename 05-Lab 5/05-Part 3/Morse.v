module Morse(LEDR, SW, KEY, CLOCK_50);
	input [2:0] SW;
	input [1:0] KEY;
	input CLOCK_50;
	output [0:0] LEDR;
	reg [13:0] Pattern;
	wire flash;
	
	always @(*)
	begin
		case(SW[2:0])
			3'b000: Pattern[13:0] = 14'b10101000000000;
			3'b001: Pattern[13:0] = 14'b11100000000000;
			3'b010: Pattern[13:0] = 14'b10101110000000;
			3'b011: Pattern[13:0] = 14'b10101011100000;
			3'b100: Pattern[13:0] = 14'b10111011100000;
			3'b101: Pattern[13:0] = 14'b11101010111000;
			3'b110: Pattern[13:0] = 14'b11101011101110;
			3'b111: Pattern[13:0] = 14'b11101110101000;
			default: Pattern[13:0] = 14'b00000000000000;
		endcase
	end
	
	RateDivider b2(
		.enable(flash), 
		.loadValue(KEY[1]), 
		.Clock(CLOCK_50)
	);

	ShiftRegister b3(
		.LEDR(LEDR[0]),
		.enable(flash),
		.Clock(CLOCK_50),
		.reset_n(KEY[0]),
		.loadValue(KEY[1]),
		.pattern(Pattern)
	);
endmodule

module RateDivider(enable, loadValue, Clock);
	input loadValue, Clock;
	output enable;
	reg [24:0] count;
	
	always @(posedge Clock)
	begin
		if (loadValue == 1'b0)
			count <= 25'd24_999_999;
		else
			begin
				if (count == 9'd0)
					count <= 25'd24_999_999;
				else
					count <= count - 25'd1;
			end
	end
	assign enable = (count == 25'd0) ? 1 : 0;
endmodule

module ShiftRegister(LEDR, enable, Clock, reset_n, loadValue, pattern);
	input enable, Clock, reset_n, loadValue;
	input [13:0] pattern;
	output reg LEDR;
	reg [13:0] Pattern;
	
	always @(posedge Clock, negedge reset_n)
	begin
		if (reset_n == 1'b0)
			begin
				LEDR <= 1'b0;
				Pattern <= 14'b0;
			end
		else if (loadValue == 1'b0)
			begin
				LEDR <= 1'b0;
				Pattern <= pattern;
			end
		else if (enable == 1)
			begin
				LEDR <= Pattern[13];
				Pattern[13:0] = {Pattern[12:0], 1'b0};
			end
	end
endmodule