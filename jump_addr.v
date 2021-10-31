//jump address
//left shift 26 bit immediate field and concatenate with upper 4 bits of PC+4

module jump_addr (
    input [31:0] instruction,
    input [31:0] pc_next,
    output [31:0] jump
);

assign jump = {pc_next[31:28], instruction[25:0], 2'b0};

endmodule
