//Left shift (2) sign extended immediate value and add to PC+4
//Inputs are se_immediate and pc_next

module branch_addr (
    input [31:0] se_immediate,
    input [31:0] pc_next,
    output [31:0] branch
);

wire [31:0] left_shift;

assign left_shift = {se_immediate[29:0], 2'b0};
assign branch = left_shift + pc_next;

endmodule