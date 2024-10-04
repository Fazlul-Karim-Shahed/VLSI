module top_module();

    reg [7:0] array[4];

    main m1(array);

    initial begin
        #0 array[0] = 16'd3; array[1] = 16'd2;  array[2] = 15'd4; array[3] = 16'd5;
        #100 $finish;
    end

endmodule

module main(
    input [7:0] array[4]
);
    always @(*) begin
        integer i;
        for (i = 0; i < 4; i = i + 1) begin
            $display("Element - %d: %d ", i, array[i]);
        end
    end
endmodule
