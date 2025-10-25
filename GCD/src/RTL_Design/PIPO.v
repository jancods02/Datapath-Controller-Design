/** PIPO Register**/
module PIPO(dout, din, load, clk);
    output reg [15:0]dout;
    output load, clk;
    input [15:0]din;
    always @(posedge clk)
        if(load)
            dout <= din;
endmodule