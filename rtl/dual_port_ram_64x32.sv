// Code your design here
module dual_port_ram_64x32(
  input rst,clk,we,re,
  input [6:0] waddr,raddr,
  input [31:0] data_in,
  output reg [31:0] data_out
);
  
  reg [31:0] memory [63:0];
  integer m;
  
  //write operation
  always@(posedge clk or posedge rst)
    begin
      if (rst) begin
        for(m=0;m<64;m=m+1)
          memory[m] <=0;
      end
      else if(we) begin
         memory[waddr] <=data_in;
    end
    end
  
  //read operation
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
        data_out <= 0;
        end
      else if(re)
        begin
          data_out <= memory[raddr];
        end
        end
      
endmodule
  