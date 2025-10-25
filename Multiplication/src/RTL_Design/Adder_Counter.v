/*** ADDER and COUNTER**/

module ADD(out, in1, in2);
    input [15:0]in1, in2;
    output reg [15:0]out;
    always @(*)
        out = in1 + in2;
endmodule

module COUNTER(dout, din, ld, dec, clk);
    input [15:0]din;
    input ld, dec, clk;
    output reg [15:0]dout;
    always @(posedge clk)
        if(ld)
            dout <= din;
        else if(dec)
            dout <= dout - 1;
endmodule