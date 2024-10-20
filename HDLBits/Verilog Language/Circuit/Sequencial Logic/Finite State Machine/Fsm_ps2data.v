
module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output done);

    parameter S0=0, S1=1, S2=2, S3=3;
    reg [1:0] state, next_state;
    
    // State flip-flops (sequential)
    always @(posedge clk) begin
        if(reset)
            state <= S0;
        else
            state <= next_state;
    end
    
    // State transition logic (combinational)
    always @(*) begin
        case(state)
            S0: next_state = in[3] ? S1 : S0;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = in[3] ? S1 : S0;
            default: next_state = S0;
        endcase
    end

    always @(posedge clk) begin
        if(reset)
            out_bytes <= 24'b0;
        else
            out_bytes <= {out_bytes[15:0], in[7:0]};
    end

 
    // Output logic
    assign done = (state == S3);


endmodule
