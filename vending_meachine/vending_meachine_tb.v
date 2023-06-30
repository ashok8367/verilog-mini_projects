module vending_meachine_tb;

reg [1:0]in;
reg clk,rst;
wire [1:0]out,change;


vending_meachine dut( .in(in),
                     .clk(clk),
                     .rst(rst),
                     .out(out),
                     .change(change)
                     );




initial begin

clk = 1; rst = 1; in =1;

#10 rst = 0; in =1;

#10 rst = 0; in =1 ;

#10 rst = 0; in =0;






end


always  #5 clk=~clk;

endmodule
