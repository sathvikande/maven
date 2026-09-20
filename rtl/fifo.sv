// Code your design here
module fifo(
  input clk,rst,re,we,
  input [7:0] d_in,
  output reg [7:0] d_out,
  output wire empty,full
);

  //reg elements
  reg [7:0] memory [15:0];
  reg [3:0] wp,rp;
  reg [4:0] count;
  
  //flags
  assign empty =(count ==5'd0);
  assign full  =(count ==5'd16);

  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          d_out <= 8'd0;
          wp <= 0;
          rp <= 0;
          count <= 5'd0;
        end
      else 
        begin
          if(we && !full)
            begin
              memory[wp] <= d_in;
              wp <= wp+1;
            end
          if(re && !empty)
            begin
              d_out <= memory[rp];
              rp <= rp+1;
            end
          
      case({(we==1 && !full),(re==1 && !empty)})
            
            2'b10: count <=count+1;
            2'b01: count <= count-1;
            
            default : count <= count;
            
          endcase
          
        end
      
     end
endmodule         
  
          