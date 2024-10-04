module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire cout;
    wire [31:0] s;
    
    add16 add16_1(a[15:0], b[15:0], 0, sum[15:0], cout);
    add16 add16_2(a[31:16], b[31:16], 0, s[15:0],);
    add16 add16_3(a[31:16], b[31:16], 1, s[31:16],);
    
    assign sum[31:16] = (cout == 1'b1) ? s[31:16] : s[15:0];
    

endmodule
