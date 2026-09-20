// Code your testbench here
// or browse Examples
module tb_bi_counter();
  reg clk,present_n,down,load;
  reg [7:0] D;
  wire [7:0] Q;
  
  bi_counter dut(
    clk,present_n,down,load,D,Q);
  
  always begin
    #5 clk=~clk;
  end
  
  task run_inputs(input reg n,d,l);
    begin
      @(negedge clk);
      present_n=n;
      down=d;
      load=l;
    end
      endtask
  
  task run_D(input reg [7:0] Z);
    begin
      @(negedge clk)
	D=Z;
    end
  endtask
  
  initial begin
    clk=0;
    present_n=0;
    down=0;
    load=0;
    D=0;
    
    #10;
        present_n = 1;
    
    //gen random values
      run_D($random);
     run_inputs(1,0,1);

    // Count down

    run_inputs(1,1,0);

    // Count up

    run_inputs(1,0,0);
  
    
    #100;
  $finish;
    
  end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule 