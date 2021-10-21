module jump_mux (
    input [31:0] jump,
    input [31:0] branch_out,
    input jump_select,
    output [31:0] out
);

assign out = (jump_select) ? jump : branch_out;

endmodule