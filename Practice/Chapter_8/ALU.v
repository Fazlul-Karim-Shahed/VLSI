

module top_module();

    reg [3:0] num1, num2;
    reg [2:0] signal;
    wire [4:0] out;
    
    main m1(num1, num2, signal, out);

    initial
        $monitor("Number1: %d, Number2: %d, Signal: %d, Result: %d", num1, num2, signal, out);


    initial begin
        num1 = 4'd10; num2 = 4'd5; signal = 3'd0;

        #10 signal = 3'd1;
        #10 signal = 3'd2;
        #10 signal = 3'd3;
        #10 signal = 3'd4;
        #10 signal = 3'd5;
        #10 signal = 3'd6;
        #10 signal = 3'd7;
        #10 $finish;


    end


endmodule



module main(
    input [3:0] num1, num2,
    input [2:0] signal,
    output reg [4:0] out
);

    always @(*) begin
        alu(num1, num2, signal, out);
    end


    task alu;
        input [3:0] a, b;
        input [2:0] signal;
        output [4:0] out;

        reg [4:0] result;

        begin
            case(signal)

                3'd0: result = a;
                3'd1: result = a + b;
                3'd2: result = a - b;
                3'd3: result = a / b;
                3'd4: result = a % b;
                3'd5: result = a << 1;
                3'd6: result = a >> 1;
                3'd7: result = a > b;
                default: result = 5'd0;

            endcase

            out = result;


        end
        
    endtask




    // assign out = alu(num1, num2, signal);


    // function [4:0] alu;
    //     input [3:0] a, b;
    //     input [2:0] signal;
    //     reg [4:0] result;

    //     begin
    //         case(signal)

    //             3'd0: result = a;
    //             3'd1: result = a + b;
    //             3'd2: result = a - b;
    //             3'd3: result = a / b;
    //             3'd4: result = a % b;
    //             3'd5: result = a << 1;
    //             3'd6: result = a >> 1;
    //             3'd7: result = a > b;
    //             default: result = 5'd0;

    //         endcase

    //         alu = result;


    //     end
        
    // endfunction







endmodule