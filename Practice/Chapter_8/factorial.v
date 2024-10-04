

module top_module();
    reg [3:0] num1, num2;
    wire [7:0] out;

    main m1(num1, num2, out);

    initial begin
        $monitor("Number1: %d, Number2: %d, Multiplication: %d", num1, num2, out);
    end

    initial begin
    num1 = 4'd3; num2 = 4'd7;
        #5 num1 = 4'd4; num2 = 4'd7;
        #5 num1 = 4'd5; num2 = 4'd7;
        #5 num1 = 4'd6; num2 = 4'd7;

        #20 $finish;
    end

endmodule


module main(
    input [3:0] num1, num2,
    output [7:0] out
);

    assign out = multiply(num1, num2);

    function [7:0] multiply;
        input [3:0] num1, num2;

        begin
            multiply = num1 * num2;
        end

        
    endfunction

endmodule