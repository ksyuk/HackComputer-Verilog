`timescale 1ns / 1ps

module Memory(
  input signed [15:0] in,
  input [14:0] address,
  input load,
  output wire signed [15:0] out,
  input CLK
  );

  wire ramLoad = address <= 14'd16383 ? load : 0;
  wire signed [15:0] ramOut;
  RAM16K ram(
    .in(in),
    .address(address[13:0]),
    .load(ramLoad),
    .out(ramOut),
    .CLK(CLK)
  );

  assign out = address <= 14'd16383 ? ramOut : 16'b0;

endmodule
