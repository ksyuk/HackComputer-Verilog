`timescale 1ns / 1ps

module ALU(
  input signed [15:0] x, y,
  input zx, nx, zy, ny,
  input f, no,
  output reg signed [15:0] out,
  output wire zr, ng
  );

  reg signed [15:0] zero_x;
  always @* begin
    if (zx)
      zero_x = 16'b0;
    else
      zero_x = x;
  end
  
  reg signed [15:0] processed_x;
  always @* begin
    if (nx)
      processed_x = ~zero_x;
    else
      processed_x = zero_x;
  end

  reg signed [15:0] zero_y;
  always @* begin
    if (zy)
      zero_y = 16'b0;
    else
      zero_y = y;
  end

  reg signed [15:0] processed_y;
  always @* begin
    if (ny)
      processed_y = ~zero_y;
    else
      processed_y = zero_y;
  end
  
  reg signed [15:0] caluculated;
  always @* begin
    if (f)
      caluculated = processed_x + processed_y;
    else
      caluculated = processed_x & processed_y;
  end 

  always @* begin
    if (no)
      out = ~caluculated;
    else
      out = caluculated;
  end

  assign zr = out == 16'b0 ? 1 : 0;
  assign ng = out[15] == 1'b1 ? 1 : 0;

endmodule
