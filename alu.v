module alu(input[7:0]a_in,b_in,
           input [3:0]command_in,
		   input oe;sdc 
		   output [15:0]d_out);
		  
		  
parameter  Add = 4'b0000,
           Inc = 4'b0001,
		   Sub = 4'b0010,
		   Dec = 4'b0011,
		   Mul = 4'b0100,
		   Div = 4'b0101,
		   Shl = 4'b0110,
		   Srl = 4'b0111,
		   And = 4'b1000,
		   Or  = 4'b1001,
		   Inv = 4'b1010,
		   Nand= 4'b1011,
		   Nor = 4'b1100,
		   Xor = 4'b1101,
		   Xnor= 4'b1110,
		   Buf = 4'b1111;
reg [15:0]out;
    always@(command_in,a_in,b_in)
	  begin
	    case(command_in)
	       Add     :out=a_in+b_in;
           Inc     :out=a_in+1'b1;
		   Sub     :out=a_in-b_in;
		   Dec     :out=a_in-1'b1;
		   Mul     :out=a_in*b_in;
		   Div     :out=a_in/b_in;
		   Shl     :out=a_in<<b_in;
		   Srl     :out=a_in>>b_in;
		   And     :out=a_in&&b_in;
		   Or      :out=a_in|b_in;
		   Inv     :out=!(a_in);
		   Nand    :out=~(a_in&b_in);
		   Nor     :out=~(a_in|b_in);
		   Xor     :out=a_in^b_in;
		   Xnor    :out=a_in~^b_in;
		   Buf     :out=a_in;
		endcase
	  end
	  
assign d_out =(oe)? out:16'hzzzz;


endmodule
		   
           
