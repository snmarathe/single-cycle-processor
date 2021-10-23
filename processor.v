`include "instruction_memory.v"
`include "program_counter.v"
`include "increment_pc.v"
`include "registers.v"
`include "data_memory.v"
`include "ALU.v"
`include "ALU_ctrl.v"
`include "ALU_operand_mux.v"
`include "send_to_reg_mux.v"
`include "sign_extend.v"
`include "branch_addr.v"
`include "branch_mux.v"
`include "jump_addr.v"
`include "jump_mux.v"
`include "flags.v"

module processor(
    input clk, rst
);

//program_counter
wire [3:0] pc_current;
wire [31:0] pc_next;

//instruction
wire [31:0] instruction;

//sign_extend
wire [31:0] se_immediate;

//branch
wire [31:0] branch, pc_mux_branch;
wire branch_select;

//jump
wire [31:0] jump, next;
wire jump_select;

//registers & ALU
wire [31:0] data, read_data1, read_data2, ALU_mux, ALU_out;
wire reg_write_flag, ALU_operand_select, zero;
wire [1:0] ALU_op;
wire [3:0] ALU_control;

//data_memory
wire data_write_flag, data_read_flag, send_to_reg_select;
wire [31:0] read_out;





endmodule
