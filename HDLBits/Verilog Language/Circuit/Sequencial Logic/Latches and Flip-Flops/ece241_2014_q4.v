
module top_module (
    input clk,
    input x,
    output z
); 

    reg q1, qb1, q2, qb2, q3, qb3;
    wire d1, d2, d3;

    initial begin
        q1 = 1'b0;
        q2 = 1'b0;
        q3 = 1'b0;
    end

    always @(*) begin
        qb1 <= ~q1;
        qb2 <= ~q2;
        qb3 <= ~q3;
    end

    assign d1 = x ^ q1;
    assign d2 = x & qb2;
    assign d3 = x | qb3;
    assign z = ~(q1 | q2 | q3);

    always @(posedge clk) begin
        q1 <= d1;
        q2 <= d2;
        q3 <= d3;
    end

endmodule
