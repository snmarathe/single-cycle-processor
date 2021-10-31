//Instruction memory
//MIPS is a RISC type architecture, with a fixed instruction size of 32 bits.
//Instruction memory module takes instruction address as input and gives the 32 bit instruction at that address as output.

module instruction_memory (
    input rst,
    input [3:0] instruction_addr,
    output [31:0] instruction
);

reg [31:0] instruction_mem [15:0];

/*
    instruction_mem[0] = 32'b100011_00000_00001_0000000000000000;       //lw r0 r1 0
    instruction_mem[1] = 32'b100011_00000_00010_0000000000000100;       //lw r0 r2 4
    instruction_mem[2] = 32'b000100_00001_00000_0000000000000001;       //beq r1 r0 1
    instruction_mem[3] = 32'b000000_00001_00010_00000_00000_100000;     //R r1 r2 r0 0 add
    instruction_mem[4] = 32'b101011_00100_00000_0000000000001000;       //sw r4 r0 8
    instruction_mem[5] = 32'b000000_00000_00010_00011_00000_100100;     //R r0 r2 r3 0 AND
    instruction_mem[6] = 32'b000010_00000_00000_0000000000000011;       //j 3
*/
/*
    instruction_mem[0] = 32'b100011_00000_00010_0000000000000000;       //lw r0 r2 0
    instruction_mem[1] = 32'b000010_00000_00000_0000000000000011;       //j 3
    instruction_mem[2] = 32'b100011_00000_00001_0000000000000000;       //lw r0 r3 0
    instruction_mem[3] = 32'b100011_00000_00001_0000000000000100;       //lw r0 r1 4
*/
always @ (posedge rst) 
begin
    instruction_mem[0] = 32'b100011_00000_00001_0000000000000000;       //lw r0 r1 0
    instruction_mem[1] = 32'b100011_00000_00010_0000000000000100;       //lw r0 r2 4
    instruction_mem[2] = 32'b000100_00001_00000_0000000000000001;       //beq r1 r0 1
    instruction_mem[3] = 32'b000000_00001_00010_00000_00000_100000;     //R r1 r2 r0 0 add
    instruction_mem[4] = 32'b101011_00100_00000_0000000000001000;       //sw r4 r0 8
    instruction_mem[5] = 32'b000000_00000_00010_00011_00000_100100;     //R r0 r2 r3 0 AND
    instruction_mem[6] = 32'b100011_00100_00000_0000000000000000;       //lw r4 r0 0
    instruction_mem[7] = 32'b000010_00000_00000_0000000000000011;       //j 3
end

assign instruction = instruction_mem[instruction_addr];

endmodule