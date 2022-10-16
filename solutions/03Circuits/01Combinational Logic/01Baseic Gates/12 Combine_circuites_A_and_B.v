module top_module (input x, input y, output z);
	wire z1,z2,z3,z4,o1,o2;
	assign z1 = (x^y)&x;
	assign z2 = (x&y)|(!x&!y);
	assign z3 = (x^y)&x;
	assign z4 = (x&y)|(!x&!y);
	or(o1,z1,z2);
	and(o2,z3,z4);
	xor(z,o1,o2);
endmodule