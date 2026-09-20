// Code your design here
module pulse_gen(
  input clk,rst,
  output reg pulse);
  
  reg [3:0] count;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)begin
        count <= 4'd0;
        pulse <= 1'b0;
      end
      else if(count == 4'd9) begin
        count <=4'd0;
        pulse <= 1'b1;
      end
      else
        begin
          count <= count +1;
          pulse <= 1'b0;
        end
    end
      endmodule 