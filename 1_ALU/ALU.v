`timescale 1ns / 1ps

module ALU(
  input signed [15:0] x, y,
  input zx, nx, zy, ny,
  input f, no,
  output wire signed [15:0] out,
  output wire zr, ng
  );

  wire signed [15:0] zero_x = zx ? 16'b0 : x;
  wire signed [15:0] processed_x = nx ? ~zero_x : zero_x;

  wire signed [15:0] zero_y = zy ? 16'b0 : y;
  wire signed [15:0] processed_y = ny ? ~zero_y : zero_y;
  
  wire signed [15:0] caluculated = f ? processed_x + processed_y: processed_x & processed_y;
  assign out = no ? ~caluculated : caluculated;

  assign zr = out == 16'b0;
  assign ng = out[15] == 1'b1;

endmodule
