`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2026 02:48:45 PM
// Design Name: 
// Module Name: CSA
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


module CSA #(
parameter WIDTH = 4)(
    input [WIDTH-1:0]A,
    input [WIDTH-1:0]B,
    input C_in,
    output logic [WIDTH-1:0]Y,
    output logic C_out
    //output OF
    );
    
    logic [WIDTH-1:0]Y1;
    logic [WIDTH-1:0]Y2;
    wire C[0:WIDTH];
    assign C[0] = 1'b0;
    
    wire C2[0:WIDTH];
    assign C2[0] = 1'b1;
    
    
    genvar j;
    generate
        for(j=0; j<WIDTH; j= j+1)begin
            Adder add(
                .a(A[j]),
                .b(B[j]),
                .c(C[j]),
                .y(Y1[j]),
                .co(C[j+1])
            );
        end
    endgenerate
    
    
    genvar i;
    generate
        for(i=0; i<WIDTH; i= i+1)begin
            Adder add(
                .a(A[i]),
                .b(B[i]),
                .c(C2[i]),
                .y(Y2[i]),
                .co(C2[i+1])
            );
        end
    endgenerate
    
    assign Y = (C_in) ? Y2:Y1;
    assign C_out = (C_in) ? C2[WIDTH]:C[WIDTH];
    
    
    
    
    endmodule
    
    
