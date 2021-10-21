//Mux to choose between calculated branch address and PC+4
//Inputs are branch, pc_next and select line pc_sel

module pc_branch_mux (
    input [3:0] branch,
    input [3:0] pc_next,
    input branch_sel,
    output [3:0] pc_branch_out
);

assign pc_branch_out = (branch_sel) ? branch : pc_next;

endmodule