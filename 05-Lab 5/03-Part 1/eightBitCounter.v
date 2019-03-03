module eightBitCounter(KEY, SW, HEX0, HEX1, LEDR);
	input [0:0] KEY;   //Clock.
	input [1:0] SW;    //SW[0] for Clear_b, SW[1] for Enable.
	output [6:0] HEX0; 
	output [6:0] HEX1; 
	output [7:0] LEDR;
	wire [6:0] T;
	
	assign T[0] = SW[1] & LEDR[0];
	assign T[1] = T[0] & LEDR[1];
	assign T[2] = T[1] & LEDR[2];
	assign T[3] = T[2] & LEDR[3];
	assign T[4] = T[3] & LEDR[4];
	assign T[5] = T[4] & LEDR[5];
	assign T[6] = T[5] & LEDR[6];
	
	tTypeFlipFlop TFF0(.Clk(KEY[0]), .T(SW[0]), .Q(LEDR[0]), .Clear_n(SW[0]));
	tTypeFlipFlop TFF1(.Clk(KEY[0]), .T(T[0]), .Q(LEDR[1]), .Clear_n(SW[0]));
	tTypeFlipFlop TFF2(.Clk(KEY[0]), .T(T[1]), .Q(LEDR[2]), .Clear_n(SW[0]));
	tTypeFlipFlop TFF3(.Clk(KEY[0]), .T(T[2]), .Q(LEDR[3]), .Clear_n(SW[0]));
	tTypeFlipFlop TFF4(.Clk(KEY[0]), .T(T[3]), .Q(LEDR[4]), .Clear_n(SW[0]));
	tTypeFlipFlop TFF5(.Clk(KEY[0]), .T(T[4]), .Q(LEDR[5]), .Clear_n(SW[0]));
	tTypeFlipFlop TFF6(.Clk(KEY[0]), .T(T[5]), .Q(LEDR[6]), .Clear_n(SW[0]));
	tTypeFlipFlop TFF7(.Clk(KEY[0]), .T(T[6]), .Q(LEDR[7]), .Clear_n(SW[0]));

	hexDecoder hex0(.SW(LEDR[3:0]), .HEX(HEX0[6:0]));
	hexDecoder hex1(.SW(LEDR[7:4]), .HEX(HEX1[6:0]));
endmodule

module tTypeFlipFlop(Clk, T, Clear_n, Q);
	input Clk;
	input T;
	input Clear_n;
	output reg Q;

	always @(posedge Clk, negedge Clear_n)
 	begin
		if (Clear_n == 1'b0)
			Q <= 1'b0;
		else if  (T == 1'b1)
			Q <= !Q;
	end
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
