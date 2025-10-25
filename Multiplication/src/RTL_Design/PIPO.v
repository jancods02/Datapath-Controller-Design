/*** DATA-PATH COMPONENTS **/

module PIPO1(dout, din, ld, clk);
    input [15:0]din;
    input ld, clk;
    output reg [15:0]dout;
    always @(posedge clk) begin
        if(ld)
            dout <= din;
    end
endmodule

module PIPO2(dout, din, ld, clr, clk);
    input [15:0]din;
    input ld, clr, clk;
    output reg [15:0]dout;
    always @(posedge clk) begin
        if(clr)
            dout <= 16'b0;
        else if(ld)
            dout <= din;
    end
endmodule

module EQZ(eqz, data);
    input [15:0]data;
    output eqz;
    assign eqz = (data == 0);
endmodule
