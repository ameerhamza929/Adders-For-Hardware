`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2026 04:15:39 PM
// Design Name: 
// Module Name: CLA_32
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


module CLA_32(
    input [31:0] A,
    input [31:0] B,
    input Cin,
    output [31:0] Y,
    output C_out,
    output OFF
    );
    
    wire carry[0:8];
    wire OF[0:7];
    assign carry[0] = Cin;
    assign C_out = carry[8];
    genvar i;
    generate
        for(i=0; i<8; i = i+1)begin
            CLA cclla(
            .A(A[(i*4)+:4]),
            .B(B[(i*4)+:4]),
            .C_in(carry[i]),
            .Y(Y[(i*4)+:4]),
            .C_out(carry[i+1]),
            .OF(OF[i])
            );
        end
    endgenerate
    
    assign OFF = OF[7];
 
    
endmodule
