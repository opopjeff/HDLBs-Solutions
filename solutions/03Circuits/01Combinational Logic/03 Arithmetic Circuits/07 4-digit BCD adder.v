module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
	wire o1,o2,o3;
	
	bcd_fadd A(.a(a[3:0]),.b(b[3:0]),.cin(cin),.cout(o1),.sum(sum[3:0]));
	bcd_fadd B(.a(a[7:4]),.b(b[7:4]),.cin(o1),.cout(o2),.sum(sum[7:4]));
	bcd_fadd C(.a(a[11:8]),.b(b[11:8]),.cin(o2),.cout(o3),.sum(sum[11:8]));
	bcd_fadd D(.a(a[15:12]),.b(b[15:12]),.cin(o3),.cout(cout),.sum(sum[15:12]));

endmodule