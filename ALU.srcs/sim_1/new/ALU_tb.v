`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2024 03:59:34 PM
// Design Name: 
// Module Name: ALU_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_tb(

    );
    
    localparam WIDTH = 4 ; 
    localparam FULL_ADDER = 1;
reg [WIDTH - 1 : 0] A , B ;
reg Cin , red_op_A ,red_op_B ,bypass_A , bypass_B ;
reg [2 : 0] opcode ;
wire [WIDTH : 0] out ;
wire odd_parity , invalid ;


ALU #(.WIDTH(WIDTH) , .FULL_ADDER(FULL_ADDER) ) UUT
(.A(A),
.B(B) ,
.Cin(Cin),
.red_op_A(red_op_A),
.red_op_B(red_op_B) ,
.bypass_A(bypass_A) ,
.bypass_B(bypass_B) ,
.opcode(opcode) ,
.out(out) ,
.odd_parity(odd_parity) ,
.invalid(invalid)
);

always 
begin
A = $urandom_range(0 , 15);
B = $urandom_range(0 , 15);
Cin = $urandom_range(0 , 1) ;
red_op_A = $urandom_range(0 , 1) ;
red_op_B = $urandom_range(0 , 1) ;
bypass_A = $urandom_range(0 , 1) ;
bypass_B = $urandom_range(0 , 1);
opcode = $urandom_range(0 , 7) ;
#10;

end

endmodule
