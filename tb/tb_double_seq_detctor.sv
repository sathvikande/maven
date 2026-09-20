// Code your testbench here
// or browse Examples
module tb_double_seq_detctor();
  reg clk,rst,x;
  wire y;
  
  double_seq_detctor dut(clk,rst,x,y);
  
  always begin
    #5 clk= ~clk;
  end
  
  task run_rst();
    rst=1;
    #12;
    rst=0;
  endtask
  
  task input_run(input reg z);
    @(negedge clk)
    begin
    x=z;
    end
  endtask
  
  initial begin
    clk=0;
    rst=0;
    x=0;

    
   
    
    run_rst();
    
    //1110
    input_run(1);
    input_run(1);
    input_run(1);
    input_run(0);
    
    //101
    input_run(1);
    input_run(0);
    input_run(1);
    
    #20;
    $finish;
  end
    
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
endmodule 
  
  