`timescale 1ns / 1ps

module CPU(
  input [15:0] instruction,
  input signed [15:0] inM,
  input reset,
  output signed [15:0] outM,
  output [14:0] addressM,
  output writeM,
  output [14:0] pc,
  input CLK
  );

  
  // PC
  wire PCload = instruction[15] &&
   ((instruction[2] && ng) | (instruction[1] && zr) | (instruction[0] && !zr && !ng));
  PC PC(.in(Aout), .load(PCload), .reset(reset), .out(pc), .CLK(CLK));
  

  // DRegister
  wire Dload = instruction[15] && instruction[4];
  wire signed [15:0] Dout;
  Register D_Register(.in(ALUout), .load(Dload), .out(Dout), .CLK(CLK));


  // ARegister
  wire [15:0] Ain = instruction[15] ? ALUout : instruction;
  wire Aload = (!instruction[15]) | (instruction[15] && instruction[5]);
  wire signed [15:0] Aout;
  Register A_Register(.in(Ain), .load(Aload), .out(Aout), .CLK(CLK));


  // ALU
  wire [15:0] ALUin = instruction[12] ? inM : Aout;
  wire signed [15:0] ALUout;
  wire zr, ng;
  ALU ALU(
    .x(Dout), .y(ALUin),
    .zx(instruction[11]), .nx(instruction[10]), 
    .zy(instruction[9]), .ny(instruction[8]), 
    .f(instruction[7]), .no(instruction[6]), 
    .out(ALUout), 
    .zr(zr), .ng(ng));


  assign outM = ALUout;
  assign addressM = Aout;
  assign writeM = instruction[15] && instruction[3];

endmodule
