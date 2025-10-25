/*** Data path top level module of GCD ***/

module GCD_data_path(gt, lt, eq, sel1, sel2, sin, clk, din, lda, ldb);
    input lda, ldb, clk, sel1, sel2, sin;
    input [15:0]din;
    output lt, gt, eq;
    wire [15:0]a, b, bus, sub, x, y;
    PIPO A(a, din, lda, clk);
    PIPO B(b, din, ldb, clk);
    MUX A1(x, a, b, sel1);
    MUX B1(y, a, b, sel2);
    MUX Load(bus, sub, din, sin);
    SUB S1(sub, x, y);
    COMPARATOR COMP(gt, lt, eq, a, b);
endmodule