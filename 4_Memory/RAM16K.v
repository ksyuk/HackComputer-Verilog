`timescale 1ns / 1ps

module RAM16K(
  input signed [15:0] in,
  input [13:0] address,
  input load,
  output wire signed [15:0] out,
  input CLK
  );

  reg signed [15:0] data [0:16383];
  initial begin
    integer i;
    for (i = 0; i <= 16383; i = i+1) 
      data[i] = 16'b0;
  end
  
  assign out = data[address];

  always @(posedge CLK) begin
    if (load)
      data[address] <= in;
  end
endmodule
