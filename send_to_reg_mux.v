//Mux for register write data to be sent from ALU or from data memory

module send_to_reg_mux (
    input send_to_reg_select,
    input [31:0] ALU_out,
    input [31:0] read_out,
    output [31:0] out
);

assign out = (send_to_reg_select) ? read_out : ALU_out;

endmodule