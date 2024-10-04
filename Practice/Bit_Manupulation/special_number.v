module top_module();

    reg  [15:0] array[5];
    wire [15:0] out;

    main m1(array, out); 

    initial begin
        $monitor("Output: %d", out);
    end

    initial begin
        #0 array[0] = 16'd5; array[1] = 16'd2; array[2] = 16'd7; array[3] = 16'd7; array[4] = 16'd5;
		#100 $finish;
    end

endmodule



module main(
    input [15:0] array[5],
    output reg [15:0] out );

    reg [15:0] res;

    always @(*) begin
        
        integer i;
		res =16'd0;
        for (i=0; i<5;i=i+1) begin
            res = res ^ array[i];
            $display("I = %d, Array-%d, Res = %d ", i,array[i], res);
        end

        out = res;
        
    end


endmodule
