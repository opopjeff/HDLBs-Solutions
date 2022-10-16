module Full_adder( 
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

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
	
	Full_adder A(.a(a[0]),.b(b[0]),.cin(cin),.cout(cout[0]),.sum(sum[0]));
	Full_adder B(.a(a[1]),.b(b[1]),.cin(cout[0]),.cout(cout[1]),.sum(sum[1]));
	Full_adder C(.a(a[2]),.b(b[2]),.cin(cout[1]),.cout(cout[2]),.sum(sum[2]));

endmodule