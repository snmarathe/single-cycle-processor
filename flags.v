//All flags (in blue in the diagram) are generated based on the fields in the 32 bit instruction

module flags (
    input [31:0] instruction,
    output [1:0] ALU_op,
    output reg_write_flag,
    output data_write_flag,
    output data_read_flag,
    output ALU_operand_select,
    output send_to_reg_select,
    output branch_select,
    output jump_select
);



endmodule