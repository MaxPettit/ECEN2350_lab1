/* Usage:
 * Input 4 bit number for hex to diplay 
 * 	if no num specified, display will be off
 * Input 1 bit for decimal, 1 to display
 * Input 01 bit for sign, 00 for positive
 *   if sign (-), number input ignored
 *   if binary 2, hex will be blank
 */

module hex_driver(
		  
		  input [3:0]  NUM,
		  input        DEC,
		  input        SIGN,
		  input 			OFF,
		  input 			of,
	      
		  output reg [7:0] HEX
		  
		  );
		  
		

   always @(NUM, DEC, SIGN)
     begin
	  
	if(~SIGN)
	 begin
	  HEX = 8'b11111111;
	 end
	case(NUM)
	  4'b0000: //dec 0
	    HEX = 8'b11000000;
	  4'b0001: //dec 1
	    HEX = 8'b11111001;
	  4'b0010: //dec 2
	    HEX = 8'b10100100;
	  4'b0011: //dec 3
	    HEX = 8'b10110000;
	  4'b0100: //dec 4
	    HEX = 8'b10011001;
	  4'b0101: //dec 5
	    HEX = 8'b10010010;
	  4'b0110: //dec 6
	    HEX = 8'b10000010;
	  4'b0111: //dec 7
	    HEX = 8'b11111000;
//	  4'b1000: //dec 8
//	    HEX = 8'b10000000;
//	  4'b1001: //dec 9
//	    HEX = 8'b10010000;
//	  4'b1010: //hex A
//	    HEX = 8'b10001000;
//	  4'b1011: //hex B
//	    HEX = 8'b10000011;
//	  4'b1100: //hex C
//	    HEX = 8'b11000110;
//	  4'b1101: //hex D
//	    HEX = 8'b10100001;
//	  4'b1110: //hex E
//	    HEX = 8'b10000110;
		4'b1000: //dec -8
	    HEX = 8'b10000000;
	  4'b1001: //dec -7
	    HEX = 8'b11111000;
	  4'b1010: //hex -6
	    HEX = 8'b10000010;
	  4'b1011: //hex -5
	    HEX = 8'b10010010;
	  4'b1100: //hex -4
	    HEX = 8'b10011001;
	  4'b1101: //hex -3
	    HEX = 8'b10110000;
	  4'b1110: //hex -2
	    HEX = 8'b10100100;
	  4'b1111: //hex -1
	    HEX = 8'b11111001;
	  default:
	HEX =8'b10001110;
	endcase // case (NUM)
	if(of)begin
		HEX = 8'b10001110;
	end
	
	
	 if(SIGN)
	 begin
	  HEX = 8'b10111111;
	 end
	
	if(OFF)
	 begin
	  HEX = 8'b11111111;
	 end
	
	if(DEC)
	 begin
	  HEX = HEX & 8'b01111111;
	 end
	 
	 if(of && (OFF || SIGN))begin
		HEX = 8'b11000000;
	end
	
     end
   endmodule
   
