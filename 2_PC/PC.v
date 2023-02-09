`timescale 1ns / 1ps

module PC(
  input [15:0] in,
  input load, inc, reset,
  output [15:0] out,
  input CLK
  );
   
  reg [15:0] out = 16'b0;
  always @(posedge CLK) begin
    if (reset)
      out <= 16'b0;
    else if (load)
      out <= in;
    else if (inc)
      out <= out + 16'b1;
  end

endmodule
