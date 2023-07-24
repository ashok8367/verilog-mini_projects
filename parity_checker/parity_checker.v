`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2023 00:55:43
// Design Name: 
// Module Name: carry
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



module parity_checker(input clk, input rst, input [3:0]in, output reg pec);



    // Define current state and next state variables
    reg [3:0] ps_state;
    reg [3:0] ns_state;

    // Define register to count '1's
    

    // Define constants for state encodings
    parameter S0 = 4'b0000;
    parameter S1 = 4'b0001;
    parameter S2 = 4'b0010;
    parameter S3 = 4'b0011;
    parameter S4 = 4'b0100;
    parameter S5 = 4'b0101;
    parameter S6 = 4'b0110;
    parameter S7 = 4'b0111;
    parameter S8 = 4'b1000;
    parameter S9 = 4'b1001;
    parameter S10 =4'b1010;
    parameter S11 =4'b1011;
    parameter S12 =4'b1100;
    parameter S13 =4'b1101;
    parameter S14 =4'b1110;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ps_state <= S0;
            ns_state <= S0;
        end 
        else
         begin
           ps_state=ns_state;
           case (ps_state)
           
           S0:
          begin
           ns_state <= in[0] ? S2 : S1;
          end
            
           S1:
          begin
           ns_state <= in[1] ? S4 : S3;
          end
        
          S2:
          begin
           ns_state <= in[1] ? S6 : S5;
          end

        
         S3:
          begin
           ns_state <= in[2] ? S8 : S7;
          end
        
         S4:
          begin
           ns_state <= in[2] ? S10 : S9;
          end
        
         S5:
          begin
           ns_state <= in[2] ? S12 : S11;
          end
        
          S6:
          begin
           ns_state <= in[2] ? S14 : S13;
          end
        
        
       S7:
          begin
           ns_state <= in[3] ? S0 : S0;
             pec <= in[3] ? 1:0;
          end
        
         S8:
          begin
           ns_state <= in[3] ? S0 : S0;
           pec <= in[3] ? 0:1;
          end
        
        
        S9:
          begin
           ns_state <= in[3] ? S0 : S0;
           pec <= in[3] ? 0:1;
          end
        
        S10:
          begin
           ns_state <= in[3] ? S0 : S0;
           pec <= in[3] ? 1:0;
          end
        
         S11:
          begin
           ns_state <= in[3] ? S0 : S0;
           pec <= in[3] ? 0:1;
          end
        
       S12:
          begin
           ns_state <= in[3] ? S0 : S0;
           pec <= in[3] ? 1:0;
          end
        
         S13:
          begin
           ns_state <= in[3] ? S0 : S0;
           pec <= in[3] ? 1:0;
          end
        
          S14:
          begin
           ns_state <= in[3] ? S0 : S0;
           pec <= in[3] ? 0:1;
          end
          
          default:begin
              ps_state <=S0;
              ns_state <= S0;
              pec <= 0;
             
            end
        endcase
        end
    end

   

endmodule



