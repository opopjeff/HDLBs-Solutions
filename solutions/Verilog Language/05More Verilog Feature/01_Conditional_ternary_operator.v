/*
Fuction : Given four unsigned numbers, find the minimum. 
*/
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
	
	reg [7:0] result1,result2;
	assign result1 = (a > b)?b:a;
	assign result2 = (c > d)?d:c;
	assign min = (result1>result2)?result2:result1;

    // assign intermediate_result1 = compare? true: false;

endmodule