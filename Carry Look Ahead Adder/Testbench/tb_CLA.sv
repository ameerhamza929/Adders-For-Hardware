`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2026 03:41:27 PM
// Design Name: 
// Module Name: tb_CLA
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


module tb_CLA;

    
    reg [3:0]A;
    reg [3:0]B;
    reg C_in;
    wire [3:0]Y;
    wire C_out;
    wire OF;
   CLA Claed(
       .A(A),
       .B(B),
       .C_in(C_in),
       .Y(Y),
       .C_out(C_out),
       .OF(OF)
    );
    
    initial begin
        
        A = 4'b0000;
        B = 4'b0000;
        C_in = 0;
        #10
        
        A = 4'b1001;
        B = 4'b0011;
        
        #10
        A = 4'b1110;
        B = 4'b0111;
        
        #10
        
        A = 4'b1111;
        B = 4'b1111;    
        
    end

endmodule
