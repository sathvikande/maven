module tb_fifo;

  reg clk, rst, re, we;
  reg [7:0] d_in;
  wire [7:0] d_out;
  wire empty, full;

  fifo dut(
    clk, rst, re, we, d_in, d_out, empty, full
  );

  always begin
    #5 clk = ~clk;
  end

  task run_rst();
    begin
      rst = 1'b1;
      #15;
      rst = 1'b0;
    end
  endtask

  task write_data(input reg [7:0] c);
    begin
      @(negedge clk);
      d_in = c;
      we = 1'b1;

      @(negedge clk);
      we = 1'b0;
    end
  endtask

  task read_data();
    begin
      @(negedge clk);
      re = 1'b1;

      @(negedge clk);
      re = 1'b0;
    end
  endtask

  initial begin

    clk = 0;
    rst = 0;
    re = 0;
    we = 0;
    d_in = 0;

    run_rst();

    // Write 3 values
    write_data(8'd11);
    write_data(8'd15);
    write_data(8'd1);

    // Read 3 values
    read_data();
    read_data();
    read_data();

    #10;
    $finish;

  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule