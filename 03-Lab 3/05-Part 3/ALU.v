module ALU(SW, KEY, LEDR, HEX0, HEX2, HEX4, HEX5);
	input [7:0] SW;
	input [2:0] KEY;
	output [6:0] HEX0;
	output [6:0] HEX2;
	output [6:0] HEX4;
	output [6:0] HEX5;
	output [7:0] LEDR;

	wire [4:0] addAToB;
	fourBitAdder FA1(.SW({1'b0, SW[7:4], SW[3:0]}), .LEDR(addAToB[4:0]));

	wire [4:0] addOneToA;
	fourBitAdder FA2(.SW({1'b0, SW[7:4], 4'b0001}), .LEDR(addOneToA[4:0]));

	reg [7:0] ALUout;
	always @(*)
	begin
		case (KEY[2:0])
			3'b000: ALUout[7:0] = {3'b000, addOneToA[4:0]};
			3'b001: ALUout[7:0] = {3'b000, addAToB[4:0]};
			3'b010: ALUout[7:0] = {3'b000, SW[7:4] + SW[3:0]};
			3'b011: ALUout[7:0] = {SW[7:4] | SW[3:0] ? 4'b0001 : 4'b0000, 
				SW[7:4] ^ SW[3:0] ? 4'b0001 : 4'b0000};
			3'b100: ALUout[7:0] = {7'b0000000, (|SW[7:0])};
			3'b101: ALUout[7:0] = SW[7:0];
			default: ALUout[7:0] = 8'b0000_0000;
		endcase
	end
	
	assign LEDR[7:0] = ALUout[7:0];
	hexDecoder hex0(.SW(SW[3:0]), .HEX(HEX0[6:0]));    //B
	hexDecoder hex2(.SW(SW[7:4]), .HEX(HEX2[6:0]));    //A

	hexDecoder hex4(.SW(ALUout[3:0]), .HEX(HEX4[6:0]));    //ALUout[3:0]
	hexDecoder hex5(.SW(ALUout[7:4]), .HEX(HEX5[6:0]));    //ALUout[7:4]
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

module fourBitAdder(SW, LEDR);
	input [8:0] SW;    
	output [4:0] LEDR; 
	wire [2:0] cable;

	fullAdder FA1(
		.a(SW[4]), 
		.b(SW[0]), 
		.cin(SW[8]), 
		.s(LEDR[0]),
		.cout(cable[0])
	);

	fullAdder FA2(
		.a(SW[5]), 
		.b(SW[1]), 
		.cin(cable[0]), 
		.s(LEDR[1]), 
		.cout(cable[1])
	);

	fullAdder FA3(
		.a(SW[6]), 
		.b(SW[2]), 
		.cin(cable[1]), 
		.s(LEDR[2]), 
		.cout(cable[2])
	);

	fullAdder FA4(
		.a(SW[7]), 
		.b(SW[3]), 
		.cin(cable[2]), 
		.s(LEDR[3]), 
		.cout(LEDR[4])
	);
endmodule

module fullAdder(a, b, cin, s, cout);
	input a;
	input b;
	input cin;
	output s;
	output cout;
	
	assign s = a^b^cin;
	assign cout = (a & b) | (cin & (a^b));

endmodule
