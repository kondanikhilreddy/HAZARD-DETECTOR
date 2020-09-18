`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2019 09:33:29
// Design Name: 
// Module Name: check
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


module check(
    input   [7:0] x,
    input  [7:0] y,
    output reg [2:0] z
    );
    //clk required??
    //input clk;
    
    
    //splitting 8 bit input
    //reg [2:0] z=3'b000;
    wire [1:0] op1=x[7:6];
    wire [2:0] r1=x[5:3];
    wire [2:0] r2=x[2:0];
    
    wire [1:0] op2=y[7:6];
    wire [2:0] r3=y[5:3];
    wire [2:0] r4=y[2:0];
    
    //comparing registers
    //load=01 store=10 add=11
    //raw z[2]=1;
    //war z[1]=1;
    //waw z[0]=1;
    //1.load 2.store
    always @ (*)
    begin
    //raw
    case({op1,op2})
    
        4'b0110:   z[2]=(r1 == r3)?  1:0;
        4'b1001:   z[2]=(r2 == r4)?  1:0;
        4'b0111:   z[2]=((r1 == r3)||(r1==r4))?  1:0;
        4'b1101:   z[2]=(r1==r4)?  1:0;
        4'b1011:   z[2]=(r2==r4)?  1:0;
        4'b1110:   z[2]=(r1==r3)?  1:0;
        4'b1111:   z[2]=((r1 == r3)||(r1==r4))?  1:0;
        4'b0101:   z[2]=(r1==r4)?  1:0;
        4'b1010:   z[2]=(r2 == r3)?  1:0;
    endcase
    //war
    case({op1,op2})
    
        4'b0110:   z[1]=(r2 == r4)?  1:0;
        4'b1001:   z[1]=(r1 == r3)?  1:0;
        4'b0111:   z[1]=(r2 == r3)?  1:0;
        4'b1101:   z[1]=((r1==r3)||(r2 == r3))?  1:0;
        4'b1011:   z[1]=(r1==r3)?  1:0;
        4'b1110:   z[1]=((r1 == r4)||(r2==r4))?  1:0;
        4'b1111:   z[1]=((r1 == r3)||(r2==r3))?  1:0;
        4'b0101:   z[1]=(r2 == r3)?  1:0;
        4'b1010:   z[1]=(r1==r4)?  1:0;
    endcase
    //waw
    case({op1,op2})
    
        4'b0110:   z[0]=(r1 == r4)?  1:0;
        4'b1001:   z[0]=(r2 == r3)?  1:0;
        4'b0111:   z[0]=(r1 == r3)?  1:0;
        4'b1101:   z[0]=(r1==r3)?  1:0;
        4'b1011:   z[0]=(r2==r3)?  1:0;
        4'b1110:   z[0]=(r1 == r4)?  1:0;
        4'b1111:   z[0]=(r1 == r3)?  1:0;
        4'b0101:   z[0]=(r1 == r3)?  1:0;
        4'b1010:   z[0]=(r2==r4)?  1:0;
    endcase
    end
    
    
endmodule
