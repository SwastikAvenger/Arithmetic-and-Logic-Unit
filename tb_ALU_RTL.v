`timescale 1ns / 1ps
module tb_Lab2_ALU();
    reg [7:0] i_a;
    reg [7:0] i_b;
    reg [3:0] i_sel;
    reg cs;
    wire [15:0] o_data;
    wire zero;
    wire carry;
    
    //UUT instantiation
    Lab2_ALU uut(
        .i_a(i_a),
        .i_b(i_b),
        .i_sel(i_sel),
        .cs(cs),
        .o_data(o_data),
        .zero(zero),
        .carry(carry)
    );
    
    initial begin
        cs = 1'b0;                      //initialize chip select to zero
        i_a = 8'b11001101;      //205
        i_b = 8'b10110010;      //178
    end
    
    //Stimulus
    integer i;
    initial begin
        $monitor("Time=%0t | CS=%b | i_sel=%b | i_a=%d | i_b=%d | o_data=%d | zero=%b | carry=%b",  $time, cs, i_sel, i_a, i_b, o_data, zero, carry);
        #80; cs = 1'b0;     //Chip Select Low - all functions disabled
        for(i=0;i<16;i=i+1)begin
            i_sel = i;
            #5;
        end
        
        #160; cs = 1'b1;    //Chip Select High - all functions enabled
        for(i=0;i<16;i=i+1)begin
            i_sel = i;
            #5;
        end
    end 
endmodule
