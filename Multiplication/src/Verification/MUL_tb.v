/** TB FOR MUL DATA-PATH CONTROLLER **/
`timescale 1ns/1ps
module MUL_test;
    reg [15:0]din;
    reg clk, start;
    wire done;
    MUL_datapath DP(eqz, lda, ldb, ldp, clrp, decb, din, clk);
    controller CON(lda, ldb, ldp, clrp, decb, done, clk, eqz, start);
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
            $monitor($time, "%d %b", DP.y, done);
        end
endmodule 

