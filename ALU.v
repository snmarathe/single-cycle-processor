/* ALU_control[3:0]     operation
    0000                  AND
    0001                  OR
    0010                  add
    0110                  sub
    0111                  set on less than
*/

module ALU (
    input [31:0] operand1,
    input [31:0] operand2,
    input [3:0] ALU_control_signal,
    output reg [31:0] ALU_out,
    output zero
);

assign zero = (ALU_out == 0);

always @ (*)
begin  
    case (ALU_control_signal)
        4'b0000 : ALU_out <= operand1 & operand2;
        4'b0001 : ALU_out <= operand1 | operand2;
        4'b0010 : ALU_out <= operand1 + operand2;
        4'b0110 : ALU_out <= operand1 - operand2;
        default : ALU_out <= operand1;
    endcase   
end

endmodule
