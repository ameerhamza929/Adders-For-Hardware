`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2026 03:10:08 PM
// Design Name: 
// Module Name: CLA
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


module CLA(
    input [3:0]A,
    input [3:0]B,
    input C_in,
    output logic [3:0]Y,
    output logic C_out,
    output OF
    );
    
    wire G[0:3];
    wire P[0:3];
    wire C[0:4];
    assign C[0] = C_in;
    assign C_out = C[4];
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
    
    assign C[1] = G[0]|(P[0]&C[0]);
    assign C[2] = G[1]|(P[1]&G[0])|(P[1]&P[0]&C[0]);
    assign C[3] = G[2]|(P[2]&G[1])|(P[2]&P[1]&G[0])|(P[2]&P[1]&P[0]&C[0]);
    assign C[4] = G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0])|(P[3]&P[2]&P[1]&P[0]&C[0]);
    
    genvar j;
    generate
        for(j=0; j<4; j= j+1)begin
            Adder add(
                .a(A[j]),
                .b(B[j]),
                .c(C[j]),
                .y(Y[j])
            );
        end
    endgenerate
    
    assign OF = C[4]^C[3];
    
endmodule
