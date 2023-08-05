`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2023 16:03:56
// Design Name: 
// Module Name: fifo_tb
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


module fifo_tb;
reg clk,rst,we,re;
reg [3:0]data;
wire[3:0]read_data;
fifo uut(.clk(clk),.rst(rst),
          .we(we),.re(re),.data(data),.read_data(read_data)
          );
          
initial begin
clk=1;rst=1;we=0;re=0;data=0;

#60 we=1; data='d0; rst=0;
#60 we=1; data='d1; rst=0;
#60 we=1; data='d2; rst=0;
#60 we=1; data='d3; rst=0;
#60 we=1; data='d4; rst=0;
#60 we=1; data='d5; rst=0;
#60 we=1; data='d6; rst=0;
#60 we=1; data='d7; rst=0;

#60 we=0; re=1;
end
always #30 clk=~clk;
endmodule
