/** TB FOR GCD **/
`timescale 1ns/1ps
module GCD_test;
    reg [15:0]din;
    reg clk, start;
    wire done;
    GCD_data_path DP(gt, lt, eq, sel1, sel2, sin, clk, din, lda, ldb);
    controller CON(lda, ldb, sel1, sel2, sin, done, clk, lt, gt, eq, start);
    initial begin
        clk = 1'b0;
        #3 start = 1'b1;
      #500 $finish;
    end
    always #5 clk = ~clk;
    initial
        begin
            #17 din = 17;
            #10 din = 5;
        end
    initial
        begin
            $monitor($time, "%d %b", DP.sub, done);
        end
endmodule 