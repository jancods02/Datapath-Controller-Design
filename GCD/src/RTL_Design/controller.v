/** Controller for generating signals**/

module controller(lda, ldb, sel1, sel2, sin, done, clk, lt, gt, eq, start);
    input clk, lt, gt, eq, start;
    output reg lda, ldb, sel1, sel2, sin, done;
    reg [2:0] state;
    parameter s0 = 3'b000,  s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100, s5 = 3'b101;
    always @(posedge clk) begin
        case(state)
            s0: if(start) state <= s1; else state <= state;
            s1: state <= s2;
            s2: #2 if(eq) state <= s5;
                else if(gt)
                    state <= s4;
                else if(lt)
                    state <= s3;
            s3: #2 if(eq) state <= s5;
                else if(gt)
                    state <= s4;
                else if(lt)
                    state <= s3;
            s4: #2 if(eq) state <= s5;
                else if(gt)
                    state <= s4;
                else if(lt)
                    state <= s3;
            s5: state <= s5;
            default: state <= s0;
        endcase
    end
    always @(state) begin
        case(state)
            s0: begin lda = 1; ldb = 0; sin = 1; done = 0; end
            s1: begin lda = 0; ldb = 1; sin = 1; end
            s2: if(eq) done = 1;
                else if(lt) begin   
                                sel1 = 1; sel2 = 0; sin = 0;
                                #1 lda = 0; ldb = 1;
                end
                else if(gt) begin
                                sel1 = 0; sel2 = 1; sin = 0;
                                #1 lda =1; ldb = 0;
                end
            s3: if(eq) done = 1;
                else if(lt) begin   
                                sel1 = 1; sel2 = 0; sin = 0;
                                #1 lda = 0; ldb = 1;
                end
                else if(gt) begin
                                sel1 = 0; sel2 = 1; sin = 0;
                                #1 lda = 1; ldb = 0;
                end
            s4: if(eq) done = 1;
                else if(lt) begin   
                                sel1 = 1; sel2 = 0; sin = 0;
                                #1 lda = 0; ldb = 1;
                end
                else if(gt) begin
                                sel1 = 0; sel2 = 1; sin = 0;
                                #1 lda = 1; ldb = 0;
                end
            s5: begin
                    done = 1; sel1 = 0; sel2 = 0; lda = 0; ldb = 0;
                end
            default: begin lda = 0; ldb = 0; end
        endcase
        end
endmodule