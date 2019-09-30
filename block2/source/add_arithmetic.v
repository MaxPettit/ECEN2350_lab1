module add_arithmetic(input [3:0] a, input [3:0] b, output [7:0] HEX0,
		      output [7:0] HEX1);
   
   reg [3:0] 			   carry;
   reg [3:0] x;
	reg[3:0] y;
  always @(x,y)

    begin
	   x = a;
  y = b;
       while(y != 0)
	 begin
	    carry = x & y;
	    
			   x = x ^ y;
	    y = carry << 1;
	 end
    end
   hex_driver H1 (.SIGN(x[3]), .OFF(~x[3]), .HEX(HEX1));
	hex_driver H0 (.NUM(4'b0000), .HEX(HEX0));

		  endmodule
