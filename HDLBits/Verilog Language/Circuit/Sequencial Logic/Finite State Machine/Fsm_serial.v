
module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    
    reg [3:0] state, next_state;

    always @(posedge clk) begin
        if(reset)
            state <= 0;
        else
            state <= next_state;
    end

    always @(*) begin
        case(state)
            0: next_state = in ? 0 : 1;
            1: next_state = 2;
            2: next_state = 3;
            3: next_state = 4;
            4: next_state = 5;
            5: next_state = 6;
            6: next_state = 7;
            7: next_state = 8;
            8: next_state = 9;
            9: next_state = ~in ? 10 : 11;
            10: next_state = ~in ? 10 : 0;
            11: next_state = in ? 0 : 1;
        endcase
    end

    assign done = (state == 11);

endmodule
