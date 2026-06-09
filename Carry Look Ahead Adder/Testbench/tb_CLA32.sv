`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2026 04:33:10 PM
// Design Name: 
// Module Name: tb_CLA32
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


module tb_CLA32;


    reg [31:0]A;
    reg [31:0]B;
    reg C_in;
    wire [31:0]Y;
    wire C_out;
    wire OF;
   CLA_32 Claed(
       .A(A),
       .B(B),
       .Cin(C_in),
       .Y(Y),
       .C_out(C_out),
       .OFF(OF)
    );
    
    initial begin
        
        A = 32'd25;
        B = 32'd26;
        C_in = 0;
        #10
        
        A = 32'd4294967295;
        B = 32'd1;
        
        #10
        A = 32'd35;
        B = 32'd105;
        
       
        
          
        
    end


endmodule
