/** control path unit **/

module controller(lda, clra, sfta, ldq, clrq, sftq, ldm, clrff, addsub, start, decr, ldcnt, done, clk, q0, qm1);
    input clk, q0, qm1, start;
    output reg lda, clra, sfta, ldq, clrq, sftq, ldm, clrff, addsub, decr, ldcnt, done;
    reg [2:0] state;
    parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011,s4 = 3'b100, s5 = 3'b101, s6 = 3'b110, s7 = 3'b111;
    always @(posedge clk)
        begin
            case(state)
                s0: if(start) state <= s1;
                s1: state <= s2;
                s2: if({q0, qm1} == 2'b01) state <= s3;
                    else if({q0, qm1} == 2'b10) state <= s4;
                    else state <= s5;
                s3: state <= s5;
                s4: state <= s5;
                s5: if(({q0, qm1} == 2'b01) && !eqz) state <= s3;
                    else if(({q0, qm1} == 2'b10) && !eqz) state <= s4;
                    else if(eqz) state <= s6;
                s6: state <= s6;
                default: state <= s0;
            endcase
        end
    always @(state)
        begin
            case(state)
                s0: begin
                    clra = 0; lda = 0; sfta = 0; clrq = 0; ldq = 0; sftq = 0; 
                    ldm = 0; clrff = 0; done = 0;
                end
                s1: begin
                    clra = 1; clrff = 1; ldcnt = 1; ldm = 1;
                end
                s2 begin
                    clra = 0; clrff = 0; ldcnt = 0; ldm = 0; ldq = 1;
                end
                s3: begin
                    lda = 1; addsub = 1; ldq = 0; sfta = 0; sftq = 0; decr = 0; 
                end
                s4: begin
                    lda = 1; addsub = 0; ldq = 0; sfta = 0; sftq = 0; decr = 0; 
                end
                s5: begin
                    sfta = 1; sftq = 1; lda = 0; ldq = 0; decr = 1;
                end
                s6: done = 1;
                default: begin
                    clra = 0; sfta = 0; ldq = 0; sftq = 0;
                end
        end
endmodule
