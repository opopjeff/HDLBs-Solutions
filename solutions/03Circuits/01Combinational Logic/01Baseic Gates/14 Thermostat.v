module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 

	always begin
		if(mode) begin//heating mode
			if(too_cold)begin
				heater <= 1;
				aircon <= 0;
				fan <= 1;
			end
			else begin
				heater <= 0;
				aircon <= 0;
				if(fan_on)
					fan <= 1;
				else
					fan <=0;
			end
		end
		else if(!mode)begin//cooling
			if(too_hot)begin
				heater <= 0;
				aircon <= 1;
				fan <= 1;
			end
			else begin
				heater <= 0;
				aircon <= 0;
				if(fan_on)
					fan <= 1;
				else
					fan <=0;
			end
		end
	end
	

endmodule