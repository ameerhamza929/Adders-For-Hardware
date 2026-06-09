`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2026 06:15:22 PM
// Design Name: 
// Module Name: Koggstone_8bit
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


module Koggstone_8bit(
input [7:0] A,
input [7:0] B,
input cin,
output [7:0]S,
output C_out
    );
    
    wire [7:0] G,P;
    
    assign G = A&B;
    assign P = A^B;
    
    ////////////////Step 1 ///////////////////////////
    
    wire G10,G21,G32, G43, G54, G65, G76;
    wire P10,P21,P32, P43, P54, P65, P76;
    
    assign G10 = G[1] | (P[1] & G[0]);
    assign G21 = G[2] | (P[2] & G[1]);
    assign G32 = G[3] | (P[3] & G[2]);
    assign G43 = G[4] | (P[4] & G[3]);
    assign G54 = G[5] | (P[5] & G[4]);
    assign G65 = G[6] | (P[6] & G[5]);
    assign G76 = G[7] | (P[7] & G[6]);

    assign P10 = P[1] & P[0];
    assign P21 = P[2] & P[1];
    assign P32 = P[3] & P[2];
    assign P43 = P[4] & P[3];
    assign P54 = P[5] & P[4];
    assign P65 = P[6] & P[5];
    assign P76 = P[7] & P[6];
    
    
    //////////////////////////Step2/////////////////////
    
    wire G20, G31, G42, G53, G64, G75;
    wire P20, P31, P42, P53, P64, P75;
    
    assign G20 = G21 | (P21 & G[0]);
    assign G31 = G32 | (P32 & G10);
    assign G42 = G43 | (P43 & G21);
    assign G53 = G54 | (P54 & G32);
    assign G64 = G65 | (P65 & G43);
    assign G75 = G76 | (P76 & G54);
    
    assign P20 = P21  &  P[0];
    assign P31 = P32  &  P10;
    assign P42 = P43  &  P21;
    assign P53 = P54  &  P32;
    assign P64 = P65  &  P43;
    assign P75 = P76  &  P54;
    
    
    
    /////////////////////Step 5///////////////////////
    
    wire G74, G63, G52, G41;
    wire P74, P63, P52, P41;
    
    assign G74 = G75 | (P75 & G31);
    assign G63 = G64 | (P64 & G20);
    assign G52 = G53 | (P53 & G10);
    assign G41 = G42 | (P42 & G[0]);
    
    assign P74 = (P75 & P31);
    assign P63 = (P64 & P20);
    assign P52 = (P53 & P10);
    assign P41 = (P42 & P[0]);
    
    
    
    ////////////carry/////////////////////
    

    wire C0, C1, C2, C3, C4, C5, C6, C7, C8;

    assign C0 = cin;
    assign C1 = G[0] | (P[0] & cin);
    assign C2 = G10  | (P10 & cin);
    assign C3 = G20  | (P20 & cin);
    assign C4 = G31  | (P31 & cin);
    assign C5 = G41  | (P41 & cin);
    assign C6 = G52  | (P52 & cin);
    assign C7 = G63  | (P63 & cin);
    assign C8 = G74  | (P74 & cin);

    assign C_out = C8;

    //////////////////Sum/////////////////////

    assign S[0] = P[0] ^ C0;
    assign S[1] = P[1] ^ C1;
    assign S[2] = P[2] ^ C2;
    assign S[3] = P[3] ^ C3;
    assign S[4] = P[4] ^ C4;
    assign S[5] = P[5] ^ C5;
    assign S[6] = P[6] ^ C6;
    assign S[7] = P[7] ^ C7;

    
    
        
    
    
endmodule
