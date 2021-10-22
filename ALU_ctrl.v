/*
ALU_op      Instruction     Operation  
00          lw, sw          add
01          beq             sub
10          all R format    according to funct

funct       Operation       ALU_control
100000      add             0010
100010      sub             0110
100100      AND             0000
100101      OR              0001
*/

module ALU_ctrl (
    input [1:0] ALU_op,
    input [5:0] funct,
    output reg [3:0] ALU_control
);

always @ (*)
begin
    if(ALU_op == 2'b00){
        ALU_control <= 4'b0010;
    }
    else if(ALU_op == 2'b01){
        ALU_control <= 4'b0110;
    }
    else{
        case(funct)
        begin
            6'b100000: ALU_control <= 4'b0010;
            6'b100010: ALU_control <= 4'b0010;
            6'b100100: ALU_control <= 4'b0010;
            6'b100101: ALU_control <= 4'b0010;
            default:   ALU_control <= 4'b0000;
        endcase 
    }
end   

endmodule