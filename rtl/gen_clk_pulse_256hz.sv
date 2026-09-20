// Code your design here
`timescale 1ms/10us
module gen_clk_pulse_256hz(
  input clk,rst,
  output reg see_pulse
);
  
  reg [7:0] count;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst) begin
        count <= 8'd0;
        see_pulse <= 1'b0;
      end
      else if (count == 8'd255)begin
        
        count <= 8'd0;
        see_pulse <= 1'b1;
      end
      
      else begin
        count <= count +1;
        see_pulse <=1'b0;
    end
    end
endmodule 
        