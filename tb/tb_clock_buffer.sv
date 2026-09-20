// Code your testbench here
// or browse Examples
module tb_clock_buffer();
  reg clk_in;
  wire clk_out;
  
  clock_buffer dut(
    clk_in,clk_out);
  
  always #5 clk_in=~clk_in;
    
   initial begin
     clk_in=0;
     
     #100;
     $finish;
  end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule 