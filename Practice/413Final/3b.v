
module state_machine(
    input x,
    input clk,
    input reset,
    input [1:0] state,
    output [1:0] next_state,
    output reg y);

    parameter A = 0, B = 1, C = 2, D = 3;

    always @(posedge clk) begin
        state <= next_state;
    end

    always @(*) begin
        case (state)
            A: x ? next_state = B : A;
            B: x ? next_state = D : A;
            C: x ? next_state = C : A;
            D: x ? next_state = C : A;
            default: next_state = A;
        endcase
    end

    always @(*) begin
        case (state)
            A: y = x ? 0 : 0;
            B: y = x ? 0 : 1;
            C: y = x ? 0 : 1;
            D: y = x ? 0 : 1;
            default: y = 0;
        endcase
    end

endmodule

