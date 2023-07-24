`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2023 22:46:41
// Design Name: 
// Module Name: fsm_tb
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

module parity_checker_tb;

reg [3:0]in;
reg clk,rst;
wire pec;


parity_checker dut(  .in(in),
                     .clk(clk),
                     .rst(rst),
                     .pec(pec)
                     
                     );




initial begin

clk = 1; rst = 1; in =4'b0000;

#10 rst = 0; in =4'b1111;
#10 rst = 0; in =4'b1000;

;

end


always  #5 clk=~clk;

endmodule
