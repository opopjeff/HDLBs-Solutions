module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);

//ring	vibrate_mode	ringer		motor
//0		0				0			0
//0		1				0			0
//1		0				1/0			0/1
//1		1				0			1

	always begin
		if(ring)begin
			if(vibrate_mode)begin
				motor <= 1'b1;
				ringer <= 1'b0;
			end
			else if(!vibrate_mode)begin
				motor <= 1'b1;
				ringer <= 1'b0;
			end
			else begin
				motor <= 1'b0;
				ringer <= 1'b0;
			end
		end
		else begin
			motor <= 1'b0;
			ringer <= 1'b0;
		end
	end

endmodule