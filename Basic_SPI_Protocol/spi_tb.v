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
///////////////////////////////////////////////////////////////////////////////


module tb_spi_state;

reg clk;
reg reset;
reg [15:0]datain;

wire spi_cs_l;
wire spi_sclk;
wire spi_data;
wire [4:0]counter;

spi_state dut(.clk(clk),.reset(reset),.counter(counter),.datain(datain),.spi_cs_l(spi_cs_l),.spi_sclk(spi_sclk),.spi_data(spi_data));

initial begin
clk=0;reset=1;datain=0;
end

always #5 clk=~clk;

initial begin
#10 reset=0;

#10 datain=16'b0101010101010101;
#335 datain =16'b1011111101010101;
end
endmodule
