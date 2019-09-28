/*
 * Takes slide input 2's Complements
 * Shows decimal representation on HEX displays
 */

module slide_in(

		input [9:0]  SW,
		input 	     MODE,
   
		output [7:0] HEX5,
		output [7:0] HEX4,
		output [7:0] HEX3,
		output [7:0] HEX2,
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

   reg [3:0] 		     a;
   reg [3:0] 		     b;
   
   
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
	
     end // always @ (x, y)
   
   
   
   
   hex_driver H4 (
		  .NUM (a), //dec x
		  .HEX (HEX4)
		  );
   
   hex_driver H2 (
		  .NUM (b), //dec y
		  .HEX (HEX2)
		  );
   
   
endmodule // slide_in
