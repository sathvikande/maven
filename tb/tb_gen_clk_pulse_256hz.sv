// Code your testbench here
// or browse Examples
// // 256 Hz clock ,T=1/F and T/2(next step) half period 

    // T = 3.90625 ms

  //  always #1.953125 clk = ~clk;

//use #1100 in the last at $finish
`timescale 1ms/10us

module tb_gen_clk_pulse_256hz();
  reg clk,rst;
  wire see_pulse;
  
  gen_clk_pulse_256hz dut(clk,rst,see_pulse);
  
  always begin
    #1.953125  clk=~clk;
  end
  
  task run_rst();
    begin
    rst=1;
    #12;
    rst=0;
    end
  endtask
  
  initial begin
  clk=0;
    rst=0;
    
    run_rst();
    #1100;
    $finish;
    
  end
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
  
endmodule
    