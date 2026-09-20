// Code your testbench here
// or browse Examples
// freq of 50Mz , 1/50Mz , clk =10ns

module tb_piso();
	reg clk,rst,load;
	reg [3:0] pin;
	wire so;

	piso dut(clk,rst,load,pin,so);

	always begin
		#10 clk=~clk;
	end

	task run_rst();
		begin
		rst=1;
		#12;
		rst=0;
	end
endtask

	task run_input(input reg [3:0] x);
integer i;
        begin
            @(negedge clk);
            load = 1'b1;     // Assert load signal
            pin  = x;
            @(negedge clk);
            load = 1'b0;     // Deassert load, start shifting
            
            // Wait 4 clock cycles to allow full serial output
            repeat(4) @(negedge clk);

end 
endtask

 	initial begin
		clk=0;
		rst=1;
		pin=0;
		
		#10;
		rst=0;

		run_rst();

		//inputs
		run_input(4'b1011);


	#20;
	$finish;
	end

	endmodule

	
