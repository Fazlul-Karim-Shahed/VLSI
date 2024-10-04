
//1101 detect. N+1 state. So total 5 states.


module top_module();
    reg in, clk, rst;
    reg out;
    
    sqDetector sqDetector1(in, clk, rst, out);
    
    initial
        $monitor("IN: %b, RST: %b, OUT:  %b", in, rst, out);
    
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    initial begin
       #0 in = 1'b0; rst = 1'b0;
       #10 in = 1'b0; rst = 1'b0;
       #10 in = 1'b1; rst = 1'b0;
       #10 in = 1'b0; rst = 1'b0;
       #10 in = 1'b1; rst = 1'b0;
       #10 in = 1'b1; rst = 1'b1; 
       #10 in = 1'b0; rst = 1'b0;
       #10 in = 1'b1; rst = 1'b0;
       #10 in = 1'b1; rst = 1'b0;
       #10 in = 1'b0; rst = 1'b0;
       #10 in = 1'b1; rst = 1'b0;
       #10 in = 1'b1; rst = 1'b0;
       #10 in = 1'b0; rst = 1'b0;
       #10 in = 1'b1; rst = 1'b0;
       #10 $finish; 
    end
    
endmodule


module sqDetector(
    input in, clk, rst,
    output out
);
    
    parameter A=0,B=1,C=3,D=4,E=5;
    reg [2:0] state, next_state;
    
    always @(posedge clk, posedge rst) begin
        if(rst)
            state <= A;
        else
            state <= next_state;
    end
    
    always @(*) begin
        // $display("State: %d", state);
        case(state)
            A: next_state = in ? B : A;
            B: next_state = in ? C : A;
            C: next_state = in ? B : D;
            D: next_state = in ? E : A;
            E: next_state = in ? B : A;
            default: next_state = A;
        endcase
    end
    
    assign out = (next_state == E);
            
    
endmodule