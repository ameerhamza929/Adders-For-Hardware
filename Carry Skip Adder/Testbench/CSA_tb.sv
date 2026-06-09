`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 



module CSA_tb;


    reg [3:0]A;
    reg [3:0]B;
    reg C_in;
    wire [3:0]Y;
    wire C_out;
  //  wire OF;
  
    reg [3:0]A_g;
    reg [3:0]B_g;
    reg C_in_g;
    wire [3:0]Y_g;
    wire C_out_g;
    
   CSA Claed(
       .A(A),
       .B(B),
       .C_in(C_in),
       .Y(Y),
       .C_out(C_out)
       //.OF(OF)
    );
    
    assign {C_out_g,Y_g} = A+B+C_in; 
    
    integer i,j;
    initial begin
    
       // $monitor("Time = %0t | A = %0h | B = %0h", $time, a, b);
    
        for(i = 0; i<16; i++)begin
            A = i;
            B = i;
            C_in = 1'b0;  
            if(C_out == C_out_g && Y_g == Y)begin
                $display("At time %0t: Value has been passed at A= %0d and B = %0d ,carry = %0b", $time, A, B,C_in); 
            end  
            else begin
                $display("At time %0t: Value has been failed at A= %0d and B = %0d, carry = %0b ", $time, A, B, C_in); 
            end     
            #10;
        end
        #10
        
        for(j = 0; j<16; j++)begin
            A = j;
            B = j;
            C_in = 1'b1;
            if(C_out == C_out_g && Y_g == Y)begin
                $display("At time %0t: Value has been passed at A= %0d and B = %0d with carry = %0b ", $time, A, B, C_in); 
            end  
            else begin
                $display("At time %0t: Value has been failed at A= %0d and B = %0d carry = %0b ", $time, A, B, C_in); 
            end  
            #10;
        end
        
        
    
    
    end
    
    
    


endmodule
