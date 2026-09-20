// Code your design here
module twos_complement(
  input clk,rst,
  input x,
  output reg y);
  
  reg ps,ns;
  
  parameter s0=1'b0,s1=1'b1;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          ps <= s0;
        end
      else 
        begin
          ps<=ns;
        end
    end
  
  always@(*) begin
    ns=ps;
    y=1'b0;
    
    case(ps)
      
      //copy the input 
      s0: if(!x)
        begin
          y=1'b0;
          ns=s0;
        end
          else
            begin
              y=1'b1;
              ns=s1;
            end
          
          //complement the input
          s1: if(!x)
            begin
              y=1'b1;
             ns=s1;
            end
          else begin
            y=1'b0;
          ns=s1;
        end
      
      
       
    endcase
    end
    endmodule 