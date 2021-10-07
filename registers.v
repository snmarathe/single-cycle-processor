//General purpose registers
//MIPS has 32 32-bit registers
//Only load and store instructions can access memory in MIPS, so all other operations have to read and write to registers
//Inputs are clk, rst, read registers (1&2), write register, register write flag and any data to be written
//Output is read data (from operand registers) which is sent to ALU for further operations

module registers (
    input wire clk,
    input wire rst,
    input wire [4:0] read_reg1,
    input wire [4:0] read_reg2,
    input wire [4:0] write_reg,
    input wire write_flag,
    input wire [31:0] data,
    output reg [31:0] read_data1,
    output reg [31:0] read_data2
);

//32 32-bit registers
reg [31:0] regs [31:0];
integer c;

always @ (posedge clk or posedge rst)
begin
    if (rst)
    begin
        for (c = 0; c < 32; c = c+1)
        begin
            regs[c] = 32'b0;
        end
    end

    else if (write_flag)
    begin
        regs[write_reg] <= data;
    end

    read_data1 <= regs[read_reg1];
    read_data2 <= regs[read_reg2];
end

endmodule
