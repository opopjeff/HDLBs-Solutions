module top_module ( input [1:0] A, input [1:0] B, output z ); 
//if A=B z=1
//else z = 0

//assign z = ((!A[1])&(!A[0])&(!B[1])&(!B[0]))|((!A[1])&(A[0])&(!B[1])&(B[0]))|((A[1])&(!A[0])&(B[1])&(!B[0]))|((A[1])&(A[0])&(B[1])&(B[0]));

always begin
	if(A==B)
		z = 1;
	else
		z = 0;
end

endmodule
