//Program Counter
//The PC holds the address of the current instruction. It is updated after the execution of each instruction.

module program_counter (
    input clk,
    input rst,
    input [3:0] pc_next,
    output reg [3:0] pc_current
);

always @ (posedge clk or posedge rst)
begin
    if(rst)
        pc_current <= 4'b0;
    else
        pc_current <= pc_next;
end

endmodule