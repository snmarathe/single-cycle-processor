//Program Counter
//The PC holds the address of the current instruction. It is updated after the execution of each instruction.
//The PC module takes clk, rst and next address as input and updates the output.

module program_counter (
    input wire clk,
    input wire rst,
    input wire [3:0] next,
    output reg [3:0] pc
);

always @ (posedge clk or posedge rst)
begin
    if(rst)
        pc <= 4'b0;
    else
        pc <= next;
end

endmodule