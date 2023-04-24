// Testbench para modulo microc
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulación y la precision de la unidad
module microc_tb;
//declaracion de señales
reg clk, reset;
reg s_inc, s_skip, s_inm, we;
reg [2:0] ALUOp;
wire [5:0] Opcode;
wire carry, zero;
integer contador;
//instancia del modulo a testear
microc microc1(Opcode, zero, carry, clk, reset, s_skip, s_inc, s_inm, we, ALUOp);

always
begin

  clk = 1; 
  #10; 
  clk = 0; 
  #10;

end

initial
begin

  reset = 1;
  #5;
  reset = 0;

end

initial
begin
  $dumpfile("microc.vcd");
  $dumpvars;

  //li 3 R4
  #10
  s_inm = 1;
  s_skip = 0;
  s_inc = 1;
  we = 1;
  ALUOp = 3'b0;
  contador = 0;
  #10
  //li 2 R1
  #10
  s_inm = 1;
  s_skip = 0;
  s_inc = 1;
  we = 1;
  ALUOp = 3'b0;
  contador = 1;
  #10
  //li 7 R7
  #10
  s_inm = 1;
  s_skip = 0;
  s_inc = 1;
  we = 1;
  ALUOp = 3'b0;
  contador = 1;
  #10

  // skipne
  #10
  s_inm = 0;
  s_skip = 1;
  s_inc = 1;
  we = 0;
  ALUOp = 3'b011;
  contador = 2;
  #10

  // skipgt
  #10
  s_inm = 0;
  s_skip = 1;
  s_inc = 1;
  we = 0;
  ALUOp = 3'b011;
  contador = 3;
  #10

 //add R4=R1+R4, (R4 = 5)
  #10
  s_inm = 0;
  s_skip = 0;
  s_inc = 1; //0=direccion
  we = 1;
  ALUOp = 3'b010;
  contador = 4;
  #10

  //jr check
  #10
  s_inm = 0;
  s_skip = 0;
  s_inc = 0;
  we = 0;
  ALUOp = 3'b0;
  contador = 5;
  #10

  // skipne
  #10
  s_inm = 0;
  s_skip = 1;
  s_inc = 1;
  we = 0;
  ALUOp = 3'b011;
  contador = 6;
  #10

  // skipgt
  #10
  s_inm = 0;
  s_skip = 1;
  s_inc = 1;
  we = 0;
  ALUOp = 3'b011;
  contador = 7;
  #10

 //add R4=R1+R4, (R4 = 5)
  #10
  s_inm = 0;
  s_skip = 0;
  s_inc = 1; //0=direccion
  we = 1;
  ALUOp = 3'b010;
  contador = 8;
  #10

  //jr check
  #10
  s_inm = 0;
  s_skip = 0;
  s_inc = 0;
  we = 0;
  ALUOp = 3'b0;
  contador = 9;
  #10

 // skipne
  #10
  s_inm = 0;
  s_skip = 0;
  s_inc = 1;
  we = 0;
  ALUOp = 3'b011;
  contador = 10;
  #10

  // jr end, (pasa a end)
  #10
  s_inm = 0;
  s_skip = 0;
  s_inc = 0;
  we = 0;
  ALUOp = 3'b0;
  contador = 11;
  #10

  // jr end
  #10
  s_inm = 0;
  s_skip = 0;
  s_inc = 0;
  we = 0;
  ALUOp = 3'b0;
  contador = 12;
  #10

  // jr end
  #10
  s_inm = 0;
  s_skip = 0;
  s_inc = 0;
  we = 0;
  ALUOp = 3'b0;
  contador = 12;
  #10

  //fin simulacion
  $finish;
end

endmodule