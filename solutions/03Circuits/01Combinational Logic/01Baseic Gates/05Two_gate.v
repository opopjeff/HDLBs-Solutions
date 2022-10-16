module top_module (
    input in1,
    input in2,
    output out);
wire o1;
or(o1,in2);
and(out.o1,in1);
endmodule
