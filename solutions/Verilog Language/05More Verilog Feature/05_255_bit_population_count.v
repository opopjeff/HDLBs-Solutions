/*
	A "population count" circuit counts the number of '1's in an input vector. Build a population count circuit for a 255-bit input vector.
*/
module top_module( 
    input [254:0] in,
    output [7:0] out );
	
	initial out <= 0;
	
	genvar i;
	generate for(i = 0;i < 255 ; i = i + 1)
		begin:V1
			if(in[i])
				assign out = out + 1;
			else
				assign out = out;
		end
	endgenerate

endmodule