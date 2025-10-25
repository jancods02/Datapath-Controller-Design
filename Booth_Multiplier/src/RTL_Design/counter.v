/** 5 bit counter **/

module conuter(dout, decr, ldcnt, clk);
    input decr, clk;
    output [4:0] dout;
    always @(posedge clk)
        begin
            if(ldcnt) dout <= 5'b10000;
            else if(decr) dout <= dout - 1;
        end
endmodule