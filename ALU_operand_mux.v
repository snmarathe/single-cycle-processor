module ALU_operand_mux (
    input ALU_operand_select,
    input [31:0] read_data2,
    input [31:0] se_immediate,
    output [31:0] out
);

assign out = (ALU_operand_select) ? se_immediate : read_data2;

endmodule