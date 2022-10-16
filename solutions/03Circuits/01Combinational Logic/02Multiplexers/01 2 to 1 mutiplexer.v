module top_module( 
    input a, b, sel,
    output out ); 
//Create a one-bit wide, 2-to-1 multiplexer. When sel=0, choose a. When sel=1, choose b.
//sel 	a 		b 		out
//0		0		0		0
//0		0		1		0
//0		1		0		1
//0		1		1		1
//1		0		0		0
//1		0		1		1
//1		1		0		0
//1		1		1		1
//out = !sel*a + sel*b
wire o1,o2,o3;
not(o1,sel);
and(o2,o1,a);
and(o3,sel,b);
or(out,o3,o2);

endmodule