module write_reg_mux (
    input [4:0] R_format,
    input [4:0] I_format,
    input write_reg_mux_select,
    output [4:0] write_reg
);

assign write_reg = (write_reg_mux_select) ? R_format : I_format;

endmodule