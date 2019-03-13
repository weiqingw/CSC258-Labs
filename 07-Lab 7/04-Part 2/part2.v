module part2(
		CLOCK_50,		//On Board 50 MHz
		KEY,
		SW,
		VGA_CLK,		//VGA Clock
		VGA_HS,			//VGA H_SYNC
		VGA_VS,			//VGA V_SYNC
		VGA_BLANK_N,	//VGA BLANK
		VGA_SYNC_N,		//VGA SYNC
		VGA_R,			//VGA Red[9:0]
		VGA_G,			//VGA Green[9:0]
		VGA_B			//VGA Blue[9:0]
		);
	input			CLOCK_50;		//	50 MHz
	input	[9:0]	SW;
	input	[3:0]	KEY;
	output			VGA_CLK;		//	VGA Clock
	output			VGA_HS;			//	VGA H_SYNC
	output			VGA_VS;			//	VGA V_SYNC
	output			VGA_BLANK_N;	//	VGA BLANK
	output			VGA_SYNC_N;		//	VGA SYNC
	output	[9:0]	VGA_R;			//	VGA Red[9:0]
	output	[9:0]	VGA_G;			//	VGA Green[9:0]
	output	[9:0]	VGA_B;			//	VGA Blue[9:0]
	
	wire [2:0] colour;
	wire [7:0] x;
	wire [6:0] y;
	wire writeEn, ld_x, ld_y, ld_color;
	wire resetn;
	assign resetn = KEY[0];

	vga_adapter VGA(
			.resetn(resetn),
			.clock(CLOCK_50),
			.colour(colour),
			.x(x),
			.y(y),
			.plot(writeEn),
			.VGA_R(VGA_R),
			.VGA_G(VGA_G),
			.VGA_B(VGA_B),
			.VGA_HS(VGA_HS),
			.VGA_VS(VGA_VS),
			.VGA_BLANK(VGA_BLANK_N),
			.VGA_SYNC(VGA_SYNC_N),
			.VGA_CLK(VGA_CLK));
		defparam VGA.RESOLUTION = "160x120";
		defparam VGA.MONOCHROME = "FALSE";
		defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
		defparam VGA.BACKGROUND_IMAGE = "black.mif";
			
	datapath d0(
		.clk(CLOCK_50),
		.color_in(SW[9:7]),
		.resetn(resetn),
		.ld_x(ld_x),
		.ld_y(ld_y),
		.ld_color(ld_color),
		.coordinate(SW[6:0]),
		.x_out(x),
		.y_out(y),
		.color_out(colour)
	);

    control c0(
		.clk(CLOCK_50),
		.resetn(resetn),
		.load(!(KEY[3])),
		.go(!(KEY[1])),
		.ld_x(ld_x),
		.ld_y(ld_y),
		.ld_color(ld_color),
		.writeEn(writeEn)	
	);
endmodule


module combination(
	input clk, resetn, load, go,
	input [2:0] color_in,
	input [6:0] coordinate,
	output [7:0] x_out,
	output [6:0] y_out,
	output [2:0] color_out
	);

	wire ld_x, ld_y, ld_color, writeEn;

	control c0(
		.clk(clk),
		.resetn(resetn),
		.load(load),
		.go(go),
		.ld_x(ld_x),
		.ld_y(ld_y),
		.ld_color(ld_color),
		.writeEn(writeEn)	
	);

	datapath d0(
		.clk(clk),
		.color_in(color_in[2:0]),
		.resetn(resetn),
		.ld_x(ld_x),
		.ld_y(ld_y),
		.ld_color(ld_color),
		.coordinate(coordinate[6:0]),
		.x_out(x_out),
		.y_out(x_out),
		.color_out(color_out)
	);
    
endmodule

module control(
	input clk, resetn, load, go,
	output reg ld_x, ld_y, ld_color, writeEn);

	reg [2:0] current_state, next_state;

	localparam  LOAD_X = 3'b000,
				LOAD_X_WAIT = 3'b001,
				LOAD_Y_C = 3'b010,
				LOAD_Y_C_WAIT = 3'b011,
				PLOT = 3'b100;
	//reset
	always @(posedge clk) begin
		if (!resetn)
			current_state <= LOAD_X;
		else
			current_state <= next_state;
	end
	//state table
	always @(*) 
	begin: state_table
		case (current_state)
			LOAD_X: next_state = load ? LOAD_X_WAIT : LOAD_X;
			LOAD_X_WAIT: next_state = load ? LOAD_X_WAIT : LOAD_Y_C;
			LOAD_Y_C: next_state = go ? LOAD_Y_C_WAIT : LOAD_Y_C;
			LOAD_Y_C_WAIT: next_state = go ? LOAD_Y_C_WAIT : PLOT;
			PLOT: next_state = load ? LOAD_X : PLOT;
			default: next_state = LOAD_X;
		endcase
	end

	always @(*)
	begin
		ld_x = 1'b0;
		ld_y = 1'b0;
		ld_color = 1'b0;
		writeEn = 0;
		case (current_state)
			LOAD_X: ld_x = 1;
			LOAD_X_WAIT: ld_x = 1;
			LOAD_Y_C: 
				begin
					ld_x = 0;
					ld_y = 1;
					ld_color = 1;
				end
			LOAD_Y_C_WAIT: 
				begin
					ld_x = 0;
					ld_y = 1;
					ld_color = 1;
				end
			PLOT: writeEn = 1;
		endcase
	end
endmodule

module datapath(
	input clk, resetn, ld_x, ld_y, ld_color,
	input [2:0] color_in,
	input [6:0] coordinate, 
	output [7:0] x_out, 
	output [6:0] y_out, 
	output [2:0] color_out
	);

	reg [7:0] x;
	reg [6:0] y;
	reg [2:0] color;
	reg [3:0] counter;

	//reset or load
	always @(posedge clk) begin
		if (!resetn) begin
			x <= 8'b0;
			y <= 7'b0;
			color <= 3'b0;
		end
		else begin
			if (ld_x)
				x <= {1'b0, coordinate};
			if (ld_y)
				y <= coordinate;
			if (ld_color)
				color <= color_in;
		end
	end
	//counter
	always @(posedge clk) begin
		if (!resetn)
			counter <= 4'b0000;
		else
			if (counter == 1111)
				counter <= 4'b0000;
			else
				counter <= counter + 1'b1;
	end

	assign x_out = x + counter[1:0];
	assign y_out = y + counter[3:2];
	assign color_out = color;
endmodule
