/** Comparator **/

module COMPARATOR(greater, less, equal, in1, in2);
    input [15:0]in1, in2;
    output greater, less, equal;
    assign less = in1 < in2;
    assign greater = in1 > in2;
    assign equal = in1 == in2;
endmodule