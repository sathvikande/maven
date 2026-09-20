// Code your design here
module double_seq_detctor(
  input clk,rst,x,
  output reg y);
  
  reg [2:0] ps,ns;
  parameter [2:0] s0=3'd0, //noting
  				  s1=3'd1, //1___ match
  					s2=3'd2,//11__match
  					s3=3'd3,//111_match
  					s4=3'd4;//10_ match
  
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
  
  //next state logic
  always@(*) begin
    ns=s0;
    y=1'b0;
    
    case(ps)
      s0: if(x) 
        begin
        ns=s1;
        end
      else 
        ns=s0;
      
      
      
      s1: if(x) 
        begin
          ns=s2;
        end
      else begin
        ns=s4;
      end
      
      s2: if(x)
        begin
          ns=s3;
        end
      else 
        begin
          ns=s4;
        end
      
      
      s3: if(x)
        begin
          ns=s3;
          end
      else begin
        y=1'b1; //1110 detected
        ns=s4;
      end
      
      
      s4: if(x)
        begin
          y=1'b1; //101 detected
          ns=s1;
        end
      else begin
        ns=s0;
      end
      
      default : ns=s0;
      
    endcase
    
  end
  
endmodule 
        
      