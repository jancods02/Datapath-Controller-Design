/** Shift register **/

module shiftreg(dout, din, sin, clk, ld, clr, sft);
    input sin, clk, ld, clr, sft;
    input [15:0] din;
    output reg [15:0] dout;
    always @(posedge clk)
        begin
            if(clr) dout <= 0 ;
            else if(ld)
                dout <= din;
            else if(sft)
                dout <= {sin, dout[15:1]};
        end
endmodule