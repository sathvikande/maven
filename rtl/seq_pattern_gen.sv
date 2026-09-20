module seq_pattern_gen(
  input clk,rst,
  output reg [7:0] y
);

  reg [2:0] count;

  always @(posedge clk or posedge rst)
  begin
    if(rst)
      count <= 3'd0;
    else if(count == 3'd5)
      count <= 3'd1;
    else
      count <= count + 1'b1;
  end

  always @(*)
  begin
    case(count)
      3'd1: y = 8'd82;
      3'd2: y = 8'd86;
      3'd3: y = 8'd90;
      3'd4: y = 8'd94;
      3'd5: y = 8'd98;
      default: y = 8'd82;
    endcase
  end

endmodule
      
      
      /*module seq_pattern_gen(
  input clk,rst,
  output reg [7:0] y);
  
  reg [2:0] ps,ns;
  
  parameter [3:0] s0=4'd1,s1=4'd2,s2=4'd3,s3=4'd4,s4=4'd5;
  
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
      ps <= s0;
      else 
        ps <=ns;
    end
  
  
  always@(*) begin
    case(ps)
     s0 :ns = s1;
     s1 :ns = s2;
     s2 :ns = s3;
     s3 :ns = s4;
     s4 :ns = s0;
    endcase
  end
  
  always@(*)
    begin
     
    
    case(ps)
    s0:y=8'd82;
    s1:y=8'd86;
    s2:y=8'd90;
    s3:y=8'd94;
    s4:y=8'd98;
      
    default :y =8'd82;
    endcase

    end
endmodule */