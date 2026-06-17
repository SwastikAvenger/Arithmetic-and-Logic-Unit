//Design of an Arithmetic Logic Unit
//Arithmetic Operations :- Add, Sub, Div, Mul, INC, DEC
//Logical Operations :- SHL, SHR, AND, OR, NOT, XOR, XNOR, NOR, BUF(buffer)
//Inputs :- Input 1(8bit), Input 2(8bit), Input Select(4bit)
//Outputs :- Output 1(16bit), Zero Flag, Carry Flag

`timescale 1ns/1ps
module Lab2_ALU(  
	input wire [7:0] i_a,		//input data
	input wire [7:0] i_b,		//input data
	input wire [3:0] i_sel,		//select line
	input wire cs,				//chip select
	output wire [15:0] o_data,  //output data
	output wire zero,			//zero flag
	output wire carry			//carry flag
);
	reg [15:0] o_data_temp;		
	reg zero_temp;
	reg carry_temp;
	
	parameter add = 4'b0000;
	parameter sub = 4'b0001;
	parameter mul = 4'b0010;
	parameter div = 4'b0011;
	parameter inc = 4'b0100;
	parameter dec = 4'b0101;
	parameter shr = 4'b0110;
	parameter shl = 4'b0111;
	
	parameter l_and = 4'b1000;
	parameter l_or = 4'b1001;
	parameter l_not = 4'b1010;
	parameter b_nor = 4'b1011;
	parameter b_xnor = 4'b1100;
	parameter b_xor = 4'b1101;
	parameter l_buf = 4'b1110;
	
	
	always@(*)begin
		if(cs)begin
			case(i_sel)
			
				//Arithmetic Operations
				
				add : begin 
					{carry_temp, o_data_temp} = i_a + i_b;
					zero_temp = (o_data_temp == 16'b0);
					end
					
				sub : begin 
					o_data_temp =(i_a - i_b);
					carry_temp = (i_a < i_b);
					zero_temp = (o_data_temp == 16'b0);
					end
					
				mul : begin 
					(*use_dsp = "yes"*) o_data_temp = i_a * i_b;
					carry_temp = (o_data_temp > 16'hFFFF);
					zero_temp = (o_data_temp == 16'b0);
					end
					
				div : begin 
					if(i_b != 0)begin
						o_data_temp = i_a / i_b;		//this will infer a large no. of LUT. Synthesis might fail
						zero_temp = (o_data_temp == 16'b0);
						carry_temp = 1'b0;
					  end
					  else begin
						o_data_temp = 16'hFFFF;			//division error
						carry_temp = 1'b1;				//division error
						zero_temp = 1'b1;				//division error
					  end
					end
					
				inc : begin 
					o_data_temp = i_a + 1'b1;
					carry_temp = (o_data_temp > 16'hFFFF);
					zero_temp = 1'b0;
					end
					
				dec : begin 
					o_data_temp = i_a - 1'b1;
					carry_temp = (o_data_temp < 16'b0);
					zero_temp = (o_data_temp == 16'b0);
					end
					
				shl : begin 
					o_data_temp = i_a << i_b;
					carry_temp = (o_data_temp > 16'hFFFF);
					zero_temp = (o_data_temp == 16'b0);
					end
					
				shr : begin 
					o_data_temp = i_a >> i_b;
					carry_temp = 1'b0;  
					zero_temp = (o_data_temp == 16'b0);
					end
				
				//Logical Operations
				
				l_and : begin
						o_data_temp =  {8'b0, i_a && i_b};		//logical AND, padding upper 8 bits with zero
						carry_temp = 1'b0;
						zero_temp = (o_data_temp == 16'b0);
						end
				
				l_or : begin
					   o_data_temp =  {8'b0, i_a || i_b};		//logical OR, padding upper 8 bits with zero
					   carry_temp = 1'b0;
					   zero_temp = (o_data_temp == 16'b0);
					   end
					   
				l_not : begin
						o_data_temp = {8'b0, !(i_a)};
						carry_temp = 1'b0;
						zero_temp = (o_data_temp == 16'b0);
						end
						
				b_nor : begin
						o_data_temp = {8'b0, ~(i_a | i_b)};
						carry_temp = 1'b0;
						zero_temp = (o_data_temp == 16'b0);
						end
						
				b_xnor : begin
						 o_data_temp = {8'b0, ~(i_a ^ i_b)};
						 carry_temp = 1'b0;
						 zero_temp = (o_data_temp == 16'b0);
						 end
				
				b_xor : begin
						 o_data_temp = {8'b0, (i_a ^ i_b)};
						 carry_temp = 1'b0;
						 zero_temp = (o_data_temp == 16'b0);
						 end 
				
				l_buf : begin
						 o_data_temp = {8'b0, i_a};
						 carry_temp = 1'b0;
						 zero_temp = (o_data_temp == 16'b0);
						end
			endcase
		end
	end
	assign o_data = o_data_temp;
	assign zero   = zero_temp;
	assign carry  = carry_temp;

endmodule  
