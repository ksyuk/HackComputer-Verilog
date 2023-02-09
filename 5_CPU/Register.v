`timescale 1ns / 1ps

module Register(
  input signed [15:0] in,
  input load,
  output [15:0] out,
  input CLK
  );

  reg signed [15:0] out = 16'b0;
  always @(posedge CLK) begin
    if (load)
      out <= in;
  end
  
endmodule
