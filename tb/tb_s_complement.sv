// Code your testbench here
// or browse Examples
module tb_s_complement();
	reg clk,rst;
	reg x;
	wire y;


	twos_complement dut(
		clk,rst,x,y);

	always begin
		#5 clk=~clk;
	end
	
	task run_rst();begin
	   rst=1;
	   @(negedge clk)
	   rst=0;
end
   endtask

	task run_input(input reg z);
   begin            @(negedge clk)
		x=z;
end
	endtask

	initial begin
		clk=0;
		rst=1;
		x=0;
		
		#10;
		rst=0;

		run_rst();

		run_input(0);
		run_input(1);
		run_input(0);
		run_input(1);

	#100;
	$finish;
end

endmodule 
         