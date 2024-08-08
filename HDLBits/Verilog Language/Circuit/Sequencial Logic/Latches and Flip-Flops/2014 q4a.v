
module top_module (
    input clk,
    input w, R, E, L,
    output Q
);


wire x, d;

assign x = E ? w : Q;
assign d = L ? R : x;

always @(posedge clk) begin
    Q <= d;
end

endmodule
