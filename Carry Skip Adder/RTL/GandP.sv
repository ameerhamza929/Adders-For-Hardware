`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2026 05:00:56 PM
// Design Name: 
// Module Name: GandP
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


module GandP(
input a,
input b,
output G,
output P
    );
    
    assign G = a&b;
    assign P = a^b;
    
endmodule