//SW[0:3] data inputs
//HEX0[6:1] output display

module HexDecoder(HEX0, SW);
    input [3:0] SW;
    output [6:0] HEX0;

    hex0 u0(
        .x(SW[3]),   // INPUT C3
        .y(SW[2]),   // INPUT C2
        .z(SW[1]),   // INPUT C1
        .w(SW[0]),   // INPUT C0
        .m(HEX0[0])  // OUTPUT HEX0[0]
        );
	
    hex1 u1(
        .x(SW[3]),   // INPUT C3
        .y(SW[2]),   // INPUT C2
        .z(SW[1]),   // INPUT C1
        .w(SW[0]),   // INPUT C0
        .m(HEX0[1])  // OUTPUT HEX0[1]
        );
	  
    hex2 u2(
        .x(SW[3]),   // INPUT C3
        .y(SW[2]),   // INPUT C2
        .z(SW[1]),   // INPUT C1
        .w(SW[0]),   // INPUT C0
        .m(HEX0[2])  // OUTPUT HEX0[2]
        );

    hex3 u3(
        .x(SW[3]),   // INPUT C3
        .y(SW[2]),   // INPUT C2
        .z(SW[1]),   // INPUT C1
        .w(SW[0]),   // INPUT C0
        .m(HEX0[3])  // OUTPUT HEX0[3]
        );

    hex4 u4(
        .x(SW[3]),   // INPUT C3
        .y(SW[2]),   // INPUT C2
        .z(SW[1]),   // INPUT C1
        .w(SW[0]),   // INPUT C0
        .m(HEX0[4])  // OUTPUT HEX0[4]
        );

    hex5 u5(
        .x(SW[3]),   // INPUT C3
        .y(SW[2]),   // INPUT C2
        .z(SW[1]),   // INPUT C1
        .w(SW[0]),   // INPUT C0
        .m(HEX0[5])  // OUTPUT HEX0[5]
        );

    hex6 u6(
        .x(SW[3]),   // INPUT C3
        .y(SW[2]),   // INPUT C2
        .z(SW[1]),   // INPUT C1
        .w(SW[0]),   // INPUT C0
        .m(HEX0[6])  // OUTPUT HEX0[6]
        );
				
endmodule

module hex0(x, y, z, w, m);
    input x;  // First input
    input y;  // Second input
    input z;  // Third input
    input w;  // Fourth input
    output m; // Output
  
    assign m = (~x & ~y & ~z & w) | (~x & y & ~z & ~w) | (x & y & ~z & w) | (x & ~y & z & w);

endmodule

module hex1(x, y, z, w, m);
    input x;  // First input
    input y;  // Second input
    input z;  // Third input
    input w;  // Fourth input
    output m; // Output
  
    assign m = (~x & y & ~z & w) | (y & z & ~w) | (x & z & w) | (x & y & ~w);

endmodule

module hex2(x, y, z, w, m);
    input x;  // First input
    input y;  // Second input
    input z;  // Third input
    input w;  // Fourth input
    output m; // Output
  
    assign m = (x & y & z) | (x & y & ~w) | (~x & ~y & z & ~w);

endmodule

module hex3(x, y, z, w, m);
    input x;  // First input
    input y;  // Second input
    input z;  // Third input
    input w;  // Fourth input
    output m; // Output
  
    assign m = (~x & ~y & ~z & w) | (y & z & w) | (x & ~y & z & ~w) | (~x & y & ~z & ~w);

endmodule

module hex4(x, y, z, w, m);
    input x;  // First input
    input y;  // Second input
    input z;  // Third input
    input w;  // Fourth input
    output m; // Output
  
    assign m = (~x & w) | (~x & y & ~z) | (~y & ~z & w);

endmodule

module hex5(x, y, z, w, m);
    input x;  // First input
    input y;  // Second input
    input z;  // Third input
    input w;  // Fourth input
    output m; // Output
  
    assign m = (~x & ~y & z) | (~x & ~y & w) | (~x & z & w) |(x & y & ~z & w);

endmodule

module hex6(x, y, z, w, m);
    input x;  // First input
    input y;  // Second input
    input z;  // Third input
    input w;  // Fourth input
    output m; // Output
  
    assign m = (~x & ~y & ~z) | (~x & y & z & w) | (x & y & ~z & ~w);


endmodule
