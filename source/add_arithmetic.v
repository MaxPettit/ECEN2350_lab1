 module fullAdder(cinF,xF,yF,sF,coutF);

		input cinF,xF,yF;
		output reg sF;
		output reg coutF;
		
		always@(cinF,xF,yF)
			begin
				coutF=(xF&yF)|(yF&cinF)|(xF&cinF);
				sF=(xF)^(yF)^(cinF);
			end

endmodule


module rippleCarryAdder(cin,x,y,s,cout);

	parameter n=4;
	input cin;
	input [n-1:0]x;
	input [n-1:0]y;
	output [n-1:0]s;
	output cout;
	wire [n:0]cW;
	wire [n-1:0]sW;
	
	genvar i;
	
	generate
		for (i=0; i<n; i=i+1)
			begin:
				adderLoop
				fullAdder stage(cW[i],x[i],y[i],sW[i],cW[i+1]);
			end
	endgenerate
	
	assign cW[0]=cin;
//	assign cout=cW[n];
	assign s=sW;
	
	assign cout = (((s^x) & (s^y)) >> 3);

endmodule