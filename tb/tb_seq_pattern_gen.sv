module tb_seq_pattern_gen;
  reg clk,rst;
  wire [7:0] y;
  
  seq_pattern_gen dut(
    clk,rst,y);
  
    always begin
      #5 clk = ~clk;
    end
    
  task run_rst();
    rst=1;
    #15;
    rst=0;
   
  endtask
  
  initial begin
  clk=0;
    rst=0;
    
    run_rst();
    #100;
    $finish;
    
  end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule