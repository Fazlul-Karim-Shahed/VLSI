
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah );
    
    parameter LEFT=0, RIGHT=1, AAH_L=2, AAH_R=3;
    reg [1:0] state, next_state;
    
    always @(posedge clk, posedge areset) begin
        if(areset)
            state <= LEFT;
        else
            state <= next_state;
    end
    
    always @(*) begin
       case(state)
            LEFT: next_state = ~ground ? AAH_L : bump_left ? RIGHT : LEFT;
            RIGHT: next_state = ~ground ? AAH_R : bump_right ? LEFT : RIGHT;
            AAH_L: next_state = ground ? LEFT : AAH_L;
            AAH_R: next_state = ground ? RIGHT : AAH_R;
            default: next_state = state == LEFT ? RIGHT : LEFT;
        endcase 
    end


    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == AAH_L) || (state == AAH_R);

endmodule
