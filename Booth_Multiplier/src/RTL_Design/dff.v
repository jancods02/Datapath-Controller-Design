/** D- FLIP FLOP **/

module dff(d, q, clk, clr);
    input d, clk, clr;
    output reg q;
    always @(posedge clk)
        if(clr) q <= 0;
        else q <= d;
endmodule