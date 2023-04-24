module microc(output wire [5:0] Opcode, output wire zero, carry, input wire clk, reset, s_skip, s_inc, s_inm, we, input wire [2:0] ALUOp);

wire [3:0] RA1, RA2, WA3;
wire [7:0] RD1, RD2, WD3, salida_alu, Inm;
wire [9:0] new_pc, current_pc, salida_mux_inc, salida_mux_skip, offset;
wire [15:0] instruccion;

assign RA1=instruccion[11:8];
assign RA2=instruccion[7:4];
assign WA3=instruccion[3:0];
assign offset=instruccion[9:0];
assign Inm=instruccion[11:4];
assign Opcode=instruccion[15:10];

sum sumador(new_pc, current_pc, salida_mux_inc);
mux2 #(10) mux_inc(salida_mux_inc, offset, salida_mux_skip, s_inc);
mux2 #(10) mux_skip(salida_mux_skip, 10'b1, 10'b10, s_skip); 
regfile banco_registros(RD1, RD2, clk, we, RA1, RA2, WA3, WD3);
alu aluA(salida_alu, zero, carry, RD1, RD2, ALUOp);
mux2 mux_inm(WD3, salida_alu, Inm, s_inm);
registro #(10) pc(current_pc, clk, reset, new_pc);
memprog memoria_programa(instruccion, clk, current_pc);

endmodule
