`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2026 02:51:48 PM
// Design Name: 
// Module Name: Adder
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

module Adder(
input a,
input b,
input c,
output y,
output co
    );
    
    assign y = a^b^c;
    assign co = (a&b) | (c&(a^b));
    
endmodule

