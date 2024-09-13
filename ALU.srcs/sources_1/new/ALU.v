`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2024 02:38:57 PM
// Design Name: 
// Module Name: ALU
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


module ALU
#(parameter WIDTH = 4 , FULL_ADDER = 1)
(
input [WIDTH - 1 : 0] A , B ,
input Cin , red_op_A ,red_op_B ,bypass_A , bypass_B ,
input [2 : 0] opcode ,
output reg [WIDTH : 0] out ,
output reg odd_parity , invalid 
);
   always @(*)
   begin
   invalid = 1'b0 ;
   odd_parity = 1'b0 ;
   out = 5'bxxxxx ;
     casex({bypass_A ,bypass_B , opcode})
     5'b1xxxx : begin 
     
               out = A ;
               odd_parity = 1'b0 ;
               
               end
               
     
     5'b01xxx : begin 
                 out = B ;
                 odd_parity = 1'b0 ;
                 
                 end
     
     5'b00000 : begin
     
               odd_parity = 1'b0 ;
                if(red_op_A)
                out = &A ;
                else if(red_op_B)
                out = &B ;
                else out = A & B ;
                
                end
                
     5'b00001 : begin
     
               odd_parity = 1'b0 ;
                if(red_op_A)
                out = ^A ;
                else if(red_op_B)
                out = ^B ;
                else out = A ^ B ;
                           
                end
                
     5'b00010 : begin
                 if(FULL_ADDER)
                 out = A + B + Cin;   
                 else 
                 out = A + B ;
                 odd_parity = ~(^out) ;
                                
                end
                
     5'b00011 : begin
     
                 out = A * B ;
                 odd_parity = ~(^out) ;
                 
                end 
                
     5'b00100 : begin 
     
                 if(A > B)
                 out = A - B ;
                 else
                 out = B - A ;
                 odd_parity = ~(^out) ; 
                 
                 end
    
     5'b00101 : begin
     
                 if(B == 0)
                 out = A ;
                 else
                 out = A / B ;
                 odd_parity = ~(^out) ;
                      
                end
     default : begin
               invalid = 1'b1 ;
               odd_parity = 1'b0 ;
               out = 5'bxxxxx ;
               end 
                
     endcase
   end
endmodule
