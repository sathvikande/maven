// Code your testbench here

module tb_pulse_gen();
  reg clk,rst;
  wire pulse;
  
  pulse_gen dut(clk,rst,pulse);
  
  always begin
    #5  clk=~clk;
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
    #200;
    $finish;
    
  end
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
  
endmodule
    