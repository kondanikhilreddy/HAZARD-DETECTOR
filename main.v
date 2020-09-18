`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2019 14:11:12
// Design Name: 
// Module Name: main
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


module main(
    input clk,
    input [7:0] A,
    input data_in,
    input rst,
    output reg [7:0]led
    
    );
    reg [7:0] array [7:0];
    reg [25:0] debounce;
    reg flag_input_over;
    reg flag_display;
    
    integer address=0;
    reg [7:0] ins1;
    reg [7:0] ins2;
    reg [2:0] out;
    integer k1=0;
    integer k2=1;
    wire redclk;
    
    check c1 (.x(ins1),.y(ins2),.z(out));
    freq_div f1 (.clk_in(clk),.clk_reduced(redclk));
    always@(posedge clk)
        if(rst)
        begin
            array[0]<=0; array[1]<=0; array[2]<=0;array[3]<=0;
            array[4]<=0; array[5]<=0; array[6]<=0;array[7]<=0;  
            address=0;
            flag_input_over=0;flag_display=0;
            k1=0;k2=0;
            led<=0;           
        end
   //debounce
    always@(posedge clk)
    
        if(debounce==26'b11_1111_1111_1111_1111_1111_1111)
            if(data_in && (address<8))
                begin
                    array[address]<=A;
                    address<=address+1;
                    debounce<=0;
                end
            else if(data_in && (address==8))
               begin
                    address<=address;
                    debounce<=debounce;
                    flag_input_over<=1;
                end 
            else 
                begin
                    debounce<=debounce;
                    
                end
        else 
            begin
                debounce<=debounce+1;
                flag_input_over<=0;
            end
    
    
    always @(posedge clk)
    begin
        if(flag_input_over)
         begin
            if(k1<8)
                begin
                if(k2<8)
                    begin
                        if(!flag_display)
                            begin
                                ins1<=array[k1];
                                ins2<=array[k2];
                                flag_display<=1;
                            end
                        k2<=k2+1;
                    end
                end
                else
                    begin
                        k1<=k1+1;
                        k2<=k1+1;
                    end
         end   
    end
   //output
    //waw=11 war=01 raw=10
    always@(posedge redclk)
    begin
        if(flag_display)
        begin
            if(out[2])
                begin
                    led<={2'b10,k1,k2};
                    out[2]<=0;
                end
            else if(out[1])
                begin
                    led<={2'b01,k1,k2};
                    out[1]<=0;
                end
            else if(out[0])
                begin
                    led<={2'b11,k1,k2};
                    out[0]<=0;
                end
            else
                begin
                    flag_display<=0;
                end
        end
    end
    
    
endmodule
