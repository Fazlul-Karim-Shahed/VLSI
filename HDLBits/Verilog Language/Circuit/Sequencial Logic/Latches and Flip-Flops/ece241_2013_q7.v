

module top_module (
    input clk,
    input j,
    input k,
    output Q);

    reg Qb; 
    wire y1, y2, d;

    always @(*) begin
        Qb = ~Q;
    end

    assign y1 = Qb & j;
    assign y2 = ~k & Q;
    assign d = y1 | y2;

    always @(posedge clk) begin
        Q <= d;
    end

endmodule
