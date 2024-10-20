

module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    reg [3:0] state, next_state;
    
    always @(posedge clk) begin
        if(reset)
            state <= 4'd1;
        else
            state <= next_state;
    end
    
    always @(*) begin
        case(state)
            4'd0: next_state = in ? 4'd0 : 4'd1;
            4'd1: next_state = in ? 4'd2 : 4'd1;
            4'd2: next_state = in ? 4'd3 : 4'd1;
            4'd3: next_state = in ? 4'd4 : 4'd1;
            4'd4: next_state = in ? 4'd5 : 4'd1;
            4'd5: next_state = in ? 4'd6 : 4'd1;
            4'd6: next_state = in ? 4'd7 : 4'd9;
            4'd9: next_state = in ? 4'd2 : 4'd1;
            4'd7: next_state = in ? 4'd10 : 4'd8;
            4'd10: next_state = in ? 4'd10 : 4'd1;
            4'd8: next_state = in ? 4'd2 : 4'd1;
        endcase
    end
    
    assign disc = (state == 4'd9);
    assign flag = (state == 4'd8);
    assign err = (state == 4'd10);
            
        

endmodule
