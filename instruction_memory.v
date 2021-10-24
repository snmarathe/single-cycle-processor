//Instruction memory
//MIPS is a RISC type architecture, with a fixed instruction size of 32 bits.
//Instruction memory module takes instruction address as input and gives the 32 bit instruction at that address as output.

module instruction_memory (
    input rst,
    input [3:0] instruction_addr,
    output [31:0] instruction
);

reg [31:0] instruction_mem [15:0];

always @ (posedge rst) 
begin
    instruction_mem[0] = 10001100000000010000000000000000;      //lw reg0 reg1 0
    instruction_mem[1] = 32'b0;
    instruction_mem[2] = 32'b0;
    //instruction_mem[3] = ;
    //instruction_mem[4] = ;
    //instruction_mem[5] = ;
    //instruction_mem[6] = ;
    //instruction_mem[7] = ;
    //instruction_mem[8] = ;
    //instruction_mem[9] = ;
    //instruction_mem[10] = ;
    //instruction_mem[11] = ;
    //instruction_mem[12] = ;
    //instruction_mem[13] = ;
    //instruction_mem[14] = ;
    //instruction_mem[15] = ;
end

assign instruction = instruction_mem[instruction_addr];

endmodule