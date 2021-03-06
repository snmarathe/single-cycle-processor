//In MIPS architecture, instruction memory is aligned. Apart from branch/jump instructions, 
//PC is incremented by 4 bytes after each instruction

module increment_pc(
    input [3:0] pc_current,
    output [31:0] pc_next
);

wire [31:0] pc_32;
assign pc_32 = {26'b0, pc_current, 2'b0};     //zero extend
assign pc_next = pc_32 + 4;

endmodule
