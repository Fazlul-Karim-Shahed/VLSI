

module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    
    wire m, d, qn;
    
    assign m = E ? w : Q;
    assign d = L ? R : m;
    
    always @(posedge clk) begin
       Q <= d; 
    end
    

endmodule
