/** Subtractor for repeated subtraction**/

module SUB(out, in1, in0);
    output reg [15:0]out;
    input [15:0]in1, in0;
    always @(*)
        out = in1 - in0;
endmodule