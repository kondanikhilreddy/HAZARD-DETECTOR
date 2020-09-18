`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2019 15:20:16
// Design Name: 
// Module Name: testbench
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


module testbench(

    );
    //reg clk;
   reg [7:0] A0=0;
    reg [7:0] A1=0;
    reg [7:0] A2=0;
    reg [7:0] A3=0;
    reg [7:0] A4=0;
    reg [7:0] A5=0;
    reg [7:0] A6=0;
    reg [7:0] A7=0;
    wire [7:0] register; // chnaged from reg to wire because of error of continous assignment to non net type..when declared as register.
   main m1(A0,A1,A2,A3,A4,A5,A6,A7,register);
   
   
   initial
   begin
  // clk=0;
   A0= 8'h ca;
   A1= 8'h 93;
   A2= 8'h 6b;
   A3= 8'h d1;
   A4= 8'h 96;
   A5= 8'h ca;
   A6= 8'h 7e;
   A7= 8'h 6f;
   #100;
   end
   
   
/*  reg [7:0] x;
   reg  [7:0] y;
   
   wire [2:0] z1;
   
   check tb (x,y,z1);
   
   initial
   begin
   $monitor($time,"x=%b,y=%b,z=%b",x,y,z1);
   #100  x=8'ha6;y=8'hfe;
   #200  x=8'hb6;y=8'hfb;
   #300  x=8'h4b;y=8'hcc;
   
   end */
   
   
    
endmodule
