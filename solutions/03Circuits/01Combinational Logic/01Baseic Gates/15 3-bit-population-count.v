module top_module( 
    input [2:0] in,
    output [1:0] out );
	initial out <= 0;
	
integer i;
always@(*)begin
	out = 2'b00;
	for(i=0;i<3;i=i+1)
		out = out + in[i];
end

endmodule