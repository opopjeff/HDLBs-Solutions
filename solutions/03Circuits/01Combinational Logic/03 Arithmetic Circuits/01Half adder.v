module top_module( 
    input a, b,
    output cout, sum );
//Create a half adder. 
//A half adder adds two bits (with no carry-in) and produces a sum and carry-out.

//a		b	cout	sum
//0		0	0		0
//0		1	0		1
//1		0	0		1
//1		1	1		0
//cout = a*b;
//sum = a^b;
and(cout,a,b);
xor(sum,a,b);
endmodule
