module top_module( 
    input a, b, cin,
    output cout, sum );

//Create a full adder. 
//A full adder adds three bits (including carry-in) and produces a sum and carry-out.
//a		b		cin		cout	sum
//0		0		0		0		0
//0		0		1		0		1
//0		1		0		0		1
//0		1		1		1		0
//1		0		0		0		1
//1		0		1		1		0
//1		1		0		1		0
//1		1		1		1		1

//sum = a^b^cin
//cout = cin(a+b)+ab
wire s1,o1,o2,o3;
xor(s1,a,b);
xor(sum,s1,cin);

or(o1,a,b);
and(o2,a,b);
and(o3,o1,cin);
or(cout,o3,o2);
endmodule