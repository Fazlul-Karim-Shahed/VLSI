
module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    reg state, next_state;
    parameter ON = 1'b0, OFF = 1'b1;

    always @(posedge clk, posedge areset) begin
        if (areset) begin
            state <= OFF;
        end

        else begin
            state <= next_state;
        end
    end


    always @(*) begin

        case (state)
            OFF: next_state = j ? ON : OFF;
            ON: next_state = k ? OFF : ON;
            default: next_state = OFF;
        endcase
    end

    assign out = (state == ON);

endmodule
