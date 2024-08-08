module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    
    reg [31:0] prev;
    
    always @(posedge clk) begin
       
      	prev <= in;
        

        if(reset) begin
            out <= 32'b0;
        end

        else begin
            
            integer i;
            for(i=0; i<32; i = i + 1) begin
                if(prev[i] & ~in[i]) begin
                    out[i] <= 1;
                end

                else begin
                    out[i] <= out[i];
                end
            end
        end
        
        
    end

endmodule
