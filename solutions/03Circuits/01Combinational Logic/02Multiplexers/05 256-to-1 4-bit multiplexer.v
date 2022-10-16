module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );

	integer i;
	always@(*)begin
		for(i=0;i<4;i=i+1)begin
			out[i] <= in[(sel<<2) + i];
		end
	end
	
endmodule