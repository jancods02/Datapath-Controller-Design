
/**TOP-LEVEL DESIGN**/
module MUL_datapath(eqz, lda, ldb, ldp, clrp, decb, data_in, clk);
    input lda, ldb, ldp, clrp, decb, clk;
    input [15:0]data_in;
    output eqz;
    wire [15:0]x, y, z, bout, bus;
    PIPO1 A(x, bus, lda, clk);
    PIPO2 P(y, z, ldp, clrp, clk);
    COUNTER B(Bout, bus, ldb, decb, clk);
    ADD AD(z, x, y);
    EQZ COMP(eqz, bout);
endmodule
