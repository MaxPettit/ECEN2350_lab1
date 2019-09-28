module birthdays(

		 input [1:0]  KEY,
   
		 output [7:0] HEX0,
		 output [7:0] HEX1,
		 output [7:0] HEX2,
		 output [7:0] HEX3,
		 output [7:0] HEX4,
		 output [7:0] HEX5
	      	 );
   
   reg [3:0] 		      a0;
   reg [3:0] 		      a1; 
   reg [3:0] 		      a2;
   reg [3:0] 		      a3; 
   reg [3:0] 		      a4;
   reg [3:0] 		      a5; 
   reg 			      k;

	initial begin
      a0 = 4'b0000;
	   a1 = 4'b0000;
	   a2 = 4'b0110;
	   a3 = 4'b0001;
	   a4 = 4'b0001;
	   a5 = 4'b0001;
	end
   
   always @(posedge KEY[1])
     begin
	  
	if(~KEY[1]) begin
	   k = ~k;
	   
	end
	

	if(k) begin
	   a0 <= 4'b0000;
	   a1 <= 4'b0000;
	   a2 <= 4'b0110;
	   a3 <= 4'b0001;
	   a4 <= 4'b0001;
	   a5 <= 4'b0001;
	end
	else begin
	   a0 <= 4'b0000;
	   a1 <= 4'b0000;
	   a2 <= 4'b0001;
	   a3 <= 4'b0010;
	   a4 <= 4'b0100;
	   a5 <= 4'b0000;
	end

     end

   hex_driver X0 (
		  .NUM (a0),
		  .HEX(HEX0)
		  );
   hex_driver X1 (
		  .NUM (a1),
		  .HEX(HEX1)
		  );
   hex_driver X2 (
		  .NUM (a2),
		  .HEX(HEX2)
		  );
   hex_driver X3 (
		  .NUM (a3),
		  .HEX(HEX3)
		  );
   hex_driver X4 (
		  .NUM (a4),
		  .HEX(HEX4)
		  );
   hex_driver X5 (
		  .NUM (a5),
		  .HEX(HEX5)
		  );
   
endmodule // birthdays
