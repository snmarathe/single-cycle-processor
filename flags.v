/*
All flags (in blue in the diagram) are generated based on the opcode field in the 32 bit instruction
R format    000000
lw          100011
sw          101011
beq         000100
j           000010

Instruction     ALU_op
lw, sw          00
beq             01
R format        10
*/

module flags (
    input [31:0] instruction,
    output [1:0] ALU_op,
    output write_reg_mux_select,
    output reg_write_flag,
    output data_write_flag,
    output data_read_flag,
    output ALU_operand_select,
    output send_to_reg_select,
    output branch_select,
    output jump_select
);

wire [5:0] opcode;
assign opcode = instruction[31:26];     //6 bit opcode field

assign write_reg_mux_select = (opcode == 6'b000000);        //R format
assign reg_write_flag = (opcode == 6'b000000 || opcode == 6'b100011);   //R format OR lw
assign data_write_flag = (opcode == 6'b101011);     //sw
assign data_read_flag = (opcode == 6'b100011);      //lw
assign ALU_operand_select = (opcode == 6'b101011 || opcode == 6'b100011);    //lw OR sw
assign send_to_reg_select = (opcode == 6'b100011);      //lw
assign branch_select = (opcode == 6'b000100);       //beq
assign jump_select = (opcode == 6'b000010);     //j
assign ALU_op[1] = (opcode == 6'b000000);
assign ALU_op[0] = (opcode == 6'b000100);       //ALU_op[1:0]

endmodule
