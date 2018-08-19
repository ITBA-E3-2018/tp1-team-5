module decoder(inp1, inp2, out1, out2, out3, out4);
	//input ports
	input inp1;
	input inp2;

	//output ports
	output out1;
	output out2;
	output out3;
	output out4;

	wire a;
	wire b;
	wire c;


	//Out1 es 1, solo si ambos inputs son 0
	or(a, inp1, inp2);
	not(out1, a);

	//Out2 es 1, solo si inp1 es 1 y inp2 es 0
	not(b, inp2);
	and(out2, b,inp1);

	//Out3 es 1, solo si inp1 es 0 y inp2 es 1
	not(c, inp1);
	and(out3, c,inp2);

	//Out4 es 1, solo si inp1 es 1 y inp2 es 1
	and(out4, inp1,inp2);	

endmodule


