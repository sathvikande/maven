// Code your design here

module piso(
  input clk,rst,load,
  input [3:0] pin,
  output wire so );
  
  reg [3:0] shift_reg;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst) begin
      shift_reg <= 4'd0;
      end
      else if(load) begin
        shift_reg <= pin;
      end
      else begin
        shift_reg <= {1'b0,shift_reg[3:1]};
      end      
    end 
   assign so = shift_reg[0];
endmodule 
                                     
      