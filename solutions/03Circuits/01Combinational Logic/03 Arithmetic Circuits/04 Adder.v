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
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
	wire o1,o2,o3;
	Full_adder A(.a(x[0]),.b(y[0]),.cin(0),.cout(o1),.sum(sum[0]));
	Full_adder B(.a(x[1]),.b(y[1]),.cin(o1),.cout(o2),.sum(sum[1]));
	Full_adder C(.a(x[2]),.b(y[2]),.cin(o2),.cout(o3),.sum(sum[2]));
	Full_adder D(.a(x[3]),.b(y[3]),.cin(o3),.cout(sum[4]),.sum(sum[3]));

endmodule