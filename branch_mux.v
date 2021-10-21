module branch_mux (
    input [31:0] branch,
    input [31:0] pc_next,
    input branch_select,
    output [31:0] out
);

assign out = (branch_select) ? branch : pc_next;

endmodule