//Sign extend is required for I format instructions
//MSB is the sign bit. If the number is positive, it is extended with 0s, else with 1s
//Thus the MSB is duplicated until the new word length
//Sign extend takes 16 bit number as input and extends it to 32 bit

module sign_extend (
    input [15:0] immediate,
    output [31:0] se_immediate
);

assign se_immediate = (immediate[15]==1'b1) ? {16'b1, immediate} : {16'b0, immediate};

endmodule