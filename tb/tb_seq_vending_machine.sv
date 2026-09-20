// Code your testbench here
// or browse Examples
module tb_seq_vending_machine();
reg clk,rst,i,j;
wire x,y;

seq_vending_machine dut(
	clk,rst,i,j,x,y);

always begin
	#5 clk = ~clk;
end

task rst_run();
	begin
	rst=1;
	#12;
	rst=0;
end
endtask

task run_input(input reg z,s);
	begin
	@(negedge clk)
	i=z;
	j=s;

end
endtask

initial begin
	clk=0;
	rst=1;
	i=0;
j=0;

	#10;
	rst=0;

	rst_run();

	run_input(0,x);
	run_input(1,0);
	run_input(1,1);
	
	#20;
	$finish;

end

endmodule 