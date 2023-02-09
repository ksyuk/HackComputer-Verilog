`timescale 1ns / 1ps

module Computer(
  input reset,
  input CLK
  );
  
  wire [15:0] instruction;
  wire [15:0] inM;
  wire [15:0] outM;
  wire writeM;
  wire [14:0] addressM;
  wire [14:0] pc;
  
  ROM32K InstructionMemory(.address(pc), .out(instruction));
  Memory DataMemory(.in(outM), .address(addressM), .load(writeM), .out(inM), .CLK(CLK));
  CPU CPUunit(
    .instruction(instruction), 
    .inM(inM), 
    .reset(reset), 
    .outM(outM), 
    .addressM(addressM), 
    .writeM(writeM), 
    .pc(pc), 
    .CLK(CLK));

endmodule
