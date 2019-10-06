/*
 * Takes slide input 2's Complements
 * Shows decimal representation on HEX displays
 */

module slide_in(

		input [9:0]  SW,
	input [1:0]  KEY,
		input 	     MODE,
   
		output [7:0] HEX5,
		output [7:0] HEX4,
		output [7:0] HEX3,
		output [7:0] HEX2,
//		output [7:0] HEX0,
//		output [7:0] HEX1,
		output [3:0] x,
		output [3:0] y
		);

   
   assign x[3] = SW[7];
   assign x[2] = SW[6];
   assign x[1] = SW[5];
   assign x[0] = SW[4];


   assign y[3] = SW[3];
   assign y[2] = SW[2];
   assign y[1] = SW[1];
   assign y[0] = SW[0];
	wire [3:0] SUM;
   reg [3:0] 		     a;
   reg [3:0] 		     b;
	reg[3:0] 				num1;
	reg[3:0] 				num2;
	wire[3:0] 	carry;
	reg[3:0]  	overflow;
	wire[3:0] cout;
   
  always @(x, y)
  begin
		a = x;
		b = y;
	
		if(MODE) begin //2s Complement
		
			if(x[3]) begin
				a = ~x + 1;
			end
			if(y[3]) begin
				b = ~y + 1;
			end
		end // if (MODE)
	// add function
	
		num1 = x;
		num2 = y;

	

		
  end
//  always @ (KEY[0]) 
//	begin
//		if(KEY[0])
//			carry = SW[3:0];
//		else
//			carry = 4'b1010;
//	end

   hex_driver H5 (
		  .SIGN(x[3]),
		  .OFF(~x[3]),
		  .HEX (HEX5)
		  );
   
   hex_driver H3 (
		  .SIGN(y[3]),
		  .OFF(~y[3]),
		  .HEX (HEX3)
		  );
      
   
   hex_driver H4 (
		  .NUM (a), //dec x
		  .HEX (HEX4)
		  );
   
   hex_driver H2 (
		  .NUM (b), //dec y
		  .HEX (HEX2)
		  );
//	  hex_driver H0 (
//	  .NUM(carry), .HEX(HEX0)
//	  );
	  

  /* add_arithmetic U1 (
		   .a(x),
		   .b(y),
		   .HEX0(HEX0),
		   .HEX1(HEX1)
		   );*/
			
			
   
   
			
   
endmodule // slide_in
