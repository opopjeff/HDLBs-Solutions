module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
	
	always@(*)begin
		{cout,sum} = a + b + cin;
	end

endmodule