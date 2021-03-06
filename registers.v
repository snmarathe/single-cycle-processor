//General purpose registers
//MIPS has 32 32-bit registers
//Only load and store instructions can access memory in MIPS,
//all R format instructions read and write to registers

module registers (
    input clk,
    input rst,
    input [4:0] read_reg1,
    input [4:0] read_reg2,
    input [4:0] write_reg,
    input reg_write_flag,
    input [31:0] data,
    output [31:0] read_data1,
    output [31:0] read_data2
);

//32 32-bit registers
reg [31:0] regs [31:0];
integer c;

assign read_data1 = regs[read_reg1];
assign read_data2 = regs[read_reg2];
    
always @ (posedge clk or posedge rst)
begin
    if (rst)
    begin
        for (c = 0; c < 32; c = c+1)
        begin
            regs[c] = 32'b0;
        end
    end

    else if (reg_write_flag)
    begin
        regs[write_reg] <= data;
    end

    else regs[write_reg] <= regs[write_reg];
end

always @ (*) $display("time = %t,\tregs[0]=%b\n\t\t\t\tregs[1]=%b\n\t\t\t\tregs[2]=%b\n\t\t\t\tregs[3]=%b",$time,regs[0],regs[1],regs[2],regs[3]);
endmodule
