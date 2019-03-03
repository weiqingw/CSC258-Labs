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
