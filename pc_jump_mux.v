//Mux to choose between calculated jump address and output of PC_branch_mux

module pc_jump_mux (
    input [31:0] jump,
    input [31:0] pc_branch_out,
    input jump_sel,
    output [31:0] out
);

assign out = (jump_sel) ? jump : pc_branch_out;

endmodule