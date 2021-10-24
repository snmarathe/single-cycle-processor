`include "ALU.v"
`include "ALU_ctrl.v"
`include "branch_addr.v"
`include "data_memory.v"
`include "flags.v"
`include "increment_pc.v"
`include "instruction_memory.v"
`include "jump_addr.v"
`include "mux_32.v"
`include "mux_5.v"
`include "program_counter.v"
`include "registers.v"
`include "sign_extend.v"

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
wire branch_select;
wire [31:0] branch, out_mux_branch;

//jump
wire jump_select;
wire [31:0] jump, next;

//registers & ALU
wire write_reg_mux_select, reg_write_flag, ALU_operand_select, zero;
wire [1:0] ALU_op;
wire [3:0] ALU_control_signal;
wire [4:0] write_reg;
wire [31:0] data, read_data1, read_data2, ALU_mux_out, ALU_out;

//data_memory
wire data_write_flag, data_read_flag, send_to_reg_select;
wire [31:0] read_out;

ALU alu(read_data1, ALU_mux_out, ALU_control_signal, ALU_out, zero);
ALU_ctrl alu_ctrl(ALU_op, instruction[5:0], ALU_control_signal);
branch_addr branch1(se_immediate, pc_next, branch);
data_memory DATA_MEM(clk, rst, data_read_flag, data_write_flag, ALU_out, read_data2, read_out);
increment_pc INC_PC(pc_current, pc_next);
instruction_memory I_MEMORY(pc_current, instruction);
jump_addr jump1(instruction, pc_next, jump);
flags FLAGS(instruction, ALU_op, write_reg_mux_select, reg_write_flag, data_write_flag, data_read_flag, ALU_operand_select, send_to_reg_select, branch_select, jump_select);
program_counter PC(clk, rst, next, pc_current);
registers REGS(clk, rst, instruction[25:21], instruction[20:16], write_reg, reg_write_flag, data, read_data1, read_data2);
sign_extend SE(instruction[15:0]);

//muxes
mux_32 ALU_operand_mux(read_data2, se_immediate, ALU_operand_select, ALU_mux_out);
mux_32 branch_mux(pc_next, branch, branch_select, out_mux_branch);
mux_32 jump_mux(out_mux_branch, jump, jump_select, next);
mux_32 send_to_reg_mux(ALU_out, read_out, send_to_reg_select, data);
mux_5 write_reg_mux(instruction[20:16], instruction[15:11], write_reg_mux_select, write_reg);

endmodule
