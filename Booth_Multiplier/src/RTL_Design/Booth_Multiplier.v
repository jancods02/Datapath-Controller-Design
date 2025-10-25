/** 16-BIT BOOTH MULTIPLIER DATA PATH DESIGN **/

module booth(lda, ld1, ldm, clra, clrq, clrff, sfta, sftq, addsub, decr, ldcnt, din, clk, qm1, eqz);
    input lda, ld1, ldm, clra, clrq, clrff, sfta, sftq, addsub, clk;
    input [15:0] din;
    output qm1, eqz;
    wire [15:0] a, m, q, z;
    wire [4:0] count;
    assign eqz = ~count;
    shiftreg AR(a, z, a[15], clk, lda, clra, sfta);
    shiftreg AR(q, din, a[0], clk, ldq, clrq, sftq);
    dff qm1(q[0], qm1, clk, clrff);
    PIPO mr(din, m, clk, ldm);
    ALU as(z, a, m, addsub);
    counter cn(count, decr, ldcnt, clk);
endmodule