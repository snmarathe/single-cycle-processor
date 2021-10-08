//Data memory for load store operations
//Can read data from a given address or write to it
//Inputs are clk, rst, memory address, read flag, write flag, data to be written if any
//Output is data read from memory if any

module data_memory (
    input clk,
    input rst,
    input read_flag,
    input write_flag,
    input [4:0] data_addr,
    input [31:0] val,
    output reg [31:0] read_out
);

reg [31:0] data_mem [31:0];
integer c;

always @ (posedge clk or posedge rst)
begin
    if (rst)
    begin
        for (c = 0; c < 32; c = c+1)
        begin
            data_mem[c] = 32'b0;
        end
    end

    else if (write_flag)
    begin
        data_mem[data_addr] <= val;
    end

    else if (read_flag)
    begin
        read_out <= data_mem[data_addr];
    end

endmodule