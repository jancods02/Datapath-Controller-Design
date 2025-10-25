/** MUX to select input**/
module MUX(dout, in1, in2, select);
    output [15:0]dout;
    input [15:0]in1, in2;
    input select;
    assign dout = select ? in2 : in1;
endmodule