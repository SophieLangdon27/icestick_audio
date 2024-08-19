module blink(
	clk,
    led
    );
    
	input	clk; 
	output	reg  	led;

	reg		LEDstatus = 1;
	reg [31:0]	count = 0;

	parameter DIVISOR = 32'd12000000;

	/*
	 *	Blinks LED at approximately 1Hz. The constant kFofE_CLOCK_DIVIDER_FOR_1Hz
	 *	(defined above) is calibrated to yield a blink rate of about 1Hz.
	 */
	always @(posedge clk) begin
		if (count > DIVISOR) begin
			LEDstatus <= ~LEDstatus;
			count <= 0;
		end
		else begin
			count <= count + 1;
		end
	end

	/*
	 *	Assign output led to value in LEDstatus register
	 */
	assign	led = LEDstatus;
endmodule