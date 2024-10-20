module top_module (
    input clk,
    input x,
    output z
);

    wire d1,d2,d3;
    reg q1,q2,q3;

    initial begin
       q1 = 0;
       q3 = 0;
       q2 = 0;
    end

    assign d1 = x ^ q1;
    assign d2 = x & ~q2;
    assign d3 = x | ~q3;
    assign z = ~(q1 | q2 | q3);

    always @(posedge clk) begin
       q1 <= d1;
       q2 <= d2;
       q3 <= d3;
    end

endmodule
