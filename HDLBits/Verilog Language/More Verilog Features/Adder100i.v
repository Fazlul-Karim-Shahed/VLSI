

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    integer i;

    always @(*) begin

        {cout[0], sum[0]} = a[0] + b[0] + cin;

        for ( i=0; i<99 ; i=i+1) begin

            {cout[i+1], sum[i+1]} = a[i+1] + b[i+1] + cout[i];
            
        end
    end



endmodule
