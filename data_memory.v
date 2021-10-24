//Data memory for load store operations
//Reads/writes data from/to a given address

module data_memory (
    input clk,
    input rst,
    input data_read_flag,
    input data_write_flag,
    input [31:0] data_addr,
    input [31:0] val,
    output [31:0] read_out
);

reg [31:0] data_mem [31:0];     //32 32-bit registers
integer c;

    assign read_out = (data_read_flag) ? data_mem[data_addr[6:2]] : 32'bx;   //asynchronous data_read_flag

always @ (posedge clk or posedge rst)
begin
    if (rst)
    begin
        for (c = 0; c < 32; c = c+1)
        begin
            data_mem[c] = 32'b0;
        end
    end

    else if (data_write_flag)
    begin
        data_mem[data_addr[6:2]] <= val;
    end
    
    else data_mem[data_addr[6:2]] <= data_mem[data_addr[6:2]];
end

endmodule
