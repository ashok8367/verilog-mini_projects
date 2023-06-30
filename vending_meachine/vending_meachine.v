 module vending_meachine( input clk,
                          input rst,
                          input [1:0]in,
                          output reg[1:0]out,
                          output reg[1:0]change
                          );
            
            
 parameter s_0=2'b00;
 parameter s_1=2'b01;
 parameter s_2=2'b10;
 

 

 
 reg [1:0]ps_state;
 reg [1:0]ns_state;
 
   always @(posedge clk) begin
    if (rst)
     begin
      ps_state = s_0;
      ns_state = s_0;
      out = 0;
      change = 0;
    end
    else 
       begin
       ps_state=ns_state;
       case (ps_state)
        s_0: begin
          if (in == 0)
           begin
           ns_state = s_0;
            out = 0;
            change = 0;
          end 
          
          else if(in == 1)
            begin
            
            ns_state =s_1;
            out = 0;
            change = 0;
          end
          
           else 
            begin
            
            ns_state =s_2;
            out = 0;
            change = 0;
          end
        end
        
        s_1: begin
            if(in ==0)
            begin
            ns_state = s_0;
            out = 0;
            change = 1;
          end
          
          else if(in == 1)
           begin
            ns_state = s_2;
            out=0;
            change=0;          
          end
          
          else 
            begin
            
            ns_state =s_2;
            out = 1;
            change = 0;
          end
        end
        
          s_2: begin
            if(in == 0)
            begin
            ns_state = s_0;
            out = 0;
            change = 2;
          end
          
          else if(in == 1)
           begin
            ns_state = s_0;
            out = 1;
            change = 0;          
          end
          
          else 
            begin
            
            ns_state = s_0;
            out = 1;
            change = 1;
          end
        end
        

          default:begin
              ps_state =s_0;
              ns_state = s_0;
              out = 0;
              change = 0;
            end
      endcase
    end
  end
endmodule
