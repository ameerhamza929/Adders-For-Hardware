`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2026 04:16:00 PM
// Design Name: 
// Module Name: CSA_32_NU
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


module CSA_32_NU #(
parameter WIDTH1 = 4,
parameter WIDTH2 = 5,
parameter WIDTH3 = 6,
parameter WIDTH4 = 17)(
    input [31:0] A,
    input [31:0] B,
    input Cin,
    output [31:0] Y,
    output C_out
    );
    
    wire C4;
    wire C9;
    wire C15;
   
   CSA #(
   .WIDTH(4)
   )ccla(
        .A(A[0+:4]),
        .B(B[0+:4]),
        .C_in(Cin),
        .Y(Y[0+:4]),
        .C_out(C4)
   ); 
   
   CSA #(
   .WIDTH(5)
   )cclaa(
        .A(A[(4)+:5]),
        .B(B[4+:5]),
        .C_in(C4),
        .Y(Y[4+:5]),
        .C_out(C9)
   );
   
   CSA #(
   .WIDTH(6)
   )cclaaa(
        .A(A[9+:6]),
        .B(B[9+:6]),
        .C_in(C9),
        .Y(Y[9+:6]),
        .C_out(C15)
   );
   
   CSA #(
   .WIDTH(17)
   )cclaaaa(
        .A(A[15+:17]),
        .B(B[15+:17]),
        .C_in(C15),
        .Y(Y[15+:17]),
        .C_out(C_out)
   );         
    
endmodule
