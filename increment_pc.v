//In MIPS architecture, instruction memory is aligned. So excluding branch instructions, PC would normally be incremented 
//by 4 bytes as each instruction is 4 bytes long.
//This module takes the current PC value as input and increments it by 4

module increment_pc(
    input [3:0] pc_current,
    output [31:0] pc_next
);

wire [31:0] pc_32;
assign pc_32 = {28'b0, pc_current};
assign pc_next = pc_32 + 4;

endmodule