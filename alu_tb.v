module alu_tb();
     
	reg [7:0]a,b;
	reg [3:0]command;
	reg enable;
	wire [15:0]out;
	
	
	integer m,n,o;

parameter  Add = 4'b0000,
           Inc = 4'b0001,
		   Sub = 4'b0010,
		   Dec = 4'b0011,
		   Mul = 4'b0100,
		   Div = 4'b0101,
		   Shl = 4'b0110,
		   Shr = 4'b0111,
		   And = 4'b1000, ,mwki
		   Or  = 4'b1001,
		   Inv = 4'b1010,
		   Nand= 4'b1011,
		   Nor = 4'b1100,
		   Xor = 4'b1101,
		   Xnor= 4'b1110,
		   Buf = 4'b1111;
		   
		   
 reg [4*8:0]string_cmd;
 
 alu DUT (a,
          b,
		  command,																												
		  enable,
		  out);

task initialize;
    begin
	   {a,b,command,enable} = 0;
	end
endtask
task en_oe(input i);
    begin
	   enable=i;
	end
endtask
task inputs(input [7:0]j,k);
    begin 
	  a=j;
	  b=k;
	end
endtask

task cmd (input [3:0]i);
    begin 
	  command=i;
	end
endtask
task delay();
    begin 
	  #10;
	end
endtask


always@(command)
    begin  
	   case(command)
	   Add :string_cmd = "ADD";
	   Inc :string_cmd = "INC";
	   Sub :string_cmd = "SUB";
	   Dec :string_cmd = "DEC";
	   Mul :string_cmd = "MUL";
	   Div :string_cmd = "DIV";
	   Shl :string_cmd = "SHL";
	   Shr :string_cmd = "SHR";
	   Inv :string_cmd = "INV";
	   And :string_cmd = "AND";
	   Or :string_cmd = "OR";
	   Nand:string_cmd = "NAND";
	   Nor :string_cmd = "NOR";
	   Xor :string_cmd = "XOR";
	   Xnor:string_cmd = "XNOR";
	   Buf :string_cmd = "BUF";
	  endcase
	 end
	 
	 
initial
   begin
      initialize;
	  en_oe(1'b1);
	  for (m=0;m<16;m=m+1)
	    begin
		   for (n=0;n<16;n=n+1)
		     begin
			    inputs(m,n);
				  for(o=0;o<16;o=o+1)
				    begin
					  command=o;
					  delay;
					end
			end
		end
		
		
    en_oe(0);
	inputs(8'd20,8'd10);
	cmd(Add);
	delay;
	en_oe(1);
	inputs(8'd25,8'd17);
	cmd(Add);
	delay;
	$finish;
  end
  
 initial
    $monitor("oe=%b,a=%b,b=%b,command=%b,out=%b",enable,a,b,string_cmd,out);
	
endmodule
	


