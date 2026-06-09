`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2026 03:48:18 PM
// Design Name: 
// Module Name: CSA_32_tb
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


module CSA_32_tb;
    parameter WIDTH = 32;
    
    reg [WIDTH-1:0]A;
    reg [WIDTH-1:0]B;
    reg C_in;
    wire [WIDTH-1:0]Y;
    wire C_out;
  //  wire OF;
  
    wire [WIDTH-1:0]Y_g;
    wire C_out_g;
    
   CSA_32 Claed(
       .A(A),
       .B(B),
       .Cin(C_in),
       .Y(Y),
       .C_out(C_out)
       //.OF(OF)
    );
    
    assign {C_out_g,Y_g} = A+B+C_in; 
    
    integer i,j;
    initial begin
    
       // $monitor("Time = %0t | A = %0h | B = %0h", $time, a, b);
    
        for(i = 0; i<14096632; i= i+8)begin
            A = i;
            B = i;
            C_in = 1'b0;  
            if(C_out == C_out_g && Y_g == Y)begin
                if( i >= 14096624)
                    $display("At time %0t: All tests are passed with carry = %0b", $time,C_in); 
                end  
            else begin
                $display("At time %0t: Value has been failed at A= %0d and B = %0d, carry = %0b ", $time, A, B, C_in); 
            end     
            #10;
        end
        #10
        
        for(j = 0; j<4096634; j = j+5)begin
            A = j;
            B = j;
            C_in = 1'b1;
           if(C_out == C_out_g && Y_g == Y)begin
                if( j >= 4096629)begin
                      $display("At time %0t: All tests are passed with carry = %0b", $time,C_in); 
               end 
           end  
            else begin
                $display("At time %0t: Value has been failed at A= %0d and B = %0d carry = %0b ", $time, A, B, C_in); 
            end  
            #10;
        end
        
     end
        
        

endmodule
