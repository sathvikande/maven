// Code your design here
module bi_counter(
  input clk,present_n,down,load,
  input [7:0] D,
  output reg [7:0] Q);
   
  always@(posedge clk or negedge present_n)
    begin
      if(!present_n)
        Q<=8'hFF;
      else if (load)
        Q<=D;
      else if (down)
        Q<=Q -1'b1;
      else 
        Q<=Q+1'b1;
    end
endmodule 