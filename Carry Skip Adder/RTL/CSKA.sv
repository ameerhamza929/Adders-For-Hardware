`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2026 04:52:27 PM
// Design Name: 
// Module Name: CSKA
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


module CSKA(
input [3:0]A,
input [3:0]B,
input C_in,
output [3:0]Y,
output C_out
    );
    
    wire G[0:3];
    wire P[0:3];
    wire C[0:4];
    assign C[0] = C_in;
    
    genvar i;
    generate
        for(i = 0; i<4; i = i+1)begin
            GandP gp(
                .a(A[i]),
                .b(B[i]),
                .G(G[i]),
                .P(P[i])
            );
        end
    endgenerate
    
    
    genvar j;
    generate
        for(j=0; j<4; j= j+1)begin
            Adder add(
                .a(A[j]),
                .b(B[j]),
                .c(C[j]),
                .y(Y[j]),
                .cout(C[j+1])
            );
        end
    endgenerate
    
    
    
    assign C_out = (P[0]&P[1]&P[2]&P[3]) ? C_in:C[4];
    
    
    
endmodule
