`timescale 1ns / 1ps

module ROM32K(
  input [14:0] address,
  output wire signed [15:0] out,
  input CLK
  );

  reg signed [15:0] data [0:32767];
  integer i;
  initial begin
    for (i = 0; i <= 32767; i = i+1) 
      data[i] = 16'b0;
  end

  assign out = data[address];

endmodule
