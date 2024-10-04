module top_module();

    reg [31:0] data_in [0:31]; // Array to hold up to 32 integers
    reg [31:0] n;
    wire [31:0] xor_out;

    // Instantiate the xor_calculator module
    xor_calculator #(32, 32) uut (
        .data_in(data_in),
        .n(n),
        .xor_out(xor_out)
    );

    initial begin
        // Initialize inputs
        n = 4; // Number of integers
        data_in[0] = 1;
        data_in[1] = 2;
        data_in[2] = 3;
        data_in[3] = 4;

        // Display result
        #10;
        $display("XOR result: %d", xor_out);

        // Add further test cases if needed
        n = 5;
        data_in[0] = 1; // 0 => 1
        data_in[1] = 2; // 1 => 0
        data_in[2] = 3; // 0 => 3
        data_in[3] = 1; // 
        data_in[4] = 2;
        #10;
        $display("XOR result: %d", xor_out);

        // Finish simulation
        $finish;
    end

endmodule

module xor_calculator #(parameter WIDTH = 32, DEPTH = 32) (
    input  wire [WIDTH-1:0] data_in [0:DEPTH-1],
    input  wire [WIDTH-1:0] n,
    output reg [WIDTH-1:0] xor_out
);

    integer i;

    always @(*) begin
        xor_out = 0;
        for (i = 0; i < n; i = i + 1) begin
            xor_out = xor_out ^ data_in[i];
        end
    end

endmodule
