module tb_dual_port_ram_64x32;

  reg clk, rst, we, re;
  reg [5:0] waddr, raddr;
  reg [31:0] data_in;
  wire [31:0] data_out;

  integer k;
  reg [31:0] random_data;

  dual_port_ram_64x32 dut (
    .rst(rst),
    .clk(clk),
    .we(we),
    .re(re),
    .waddr(waddr),
    .raddr(raddr),
    .data_in(data_in),
    .data_out(data_out)
  );

  always #5 clk = ~clk;

  task write_data(input [5:0] addr, input [31:0] data);
    begin
      @(negedge clk);
      waddr   = addr;
      data_in = data;
      we      = 1'b1;

      @(posedge clk);
      #1;
      we = 1'b0;
    end
  endtask

  task read_data(input [5:0] addr);
    begin
      @(negedge clk);
      raddr = addr;
      re    = 1'b1;

      @(posedge clk);
      #1;

      if (data_out == random_data)
        $display("PASS: addr=%d data=%h", addr, data_out);
      else
        $display("FAIL: addr=%d expected=%h got=%h",
                 addr, random_data, data_out);

      re = 1'b0;
    end
  endtask

  initial begin

    clk = 0;
    rst = 1;
    we = 0;
    re = 0;
    waddr = 0;
    raddr = 0;
    data_in = 0;
    random_data = 0;

    #12;
    rst = 0;

    for(k = 0; k < 64; k = k + 1)
    begin
      random_data = $random;

      write_data(k, random_data);
      read_data(k);
    end

    #20;
    $finish;

  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end



endmodule