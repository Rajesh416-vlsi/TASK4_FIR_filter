module FIR_Filter (
    input clk,
    input rst,
    input signed [7:0] d_in,
    output reg signed [15:0] y_out
);

    
    parameter signed [7:0] h0 = 8'd1;
    parameter signed [7:0] h1 = 8'd2;
    parameter signed [7:0] h2 = 8'd3;
    parameter signed [7:0] h3 = 8'd4;

    
    reg signed [7:0] shift_reg [0:3];

    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 4; i = i + 1)
                shift_reg[i] <= 0;
            y_out <= 0;
        end else begin
           
            shift_reg[3] <= shift_reg[2];
            shift_reg[2] <= shift_reg[1];
            shift_reg[1] <= shift_reg[0];
            shift_reg[0] <= d_in;

            
            y_out <= (h0 * shift_reg[0]) +
                     (h1 * shift_reg[1]) +
                     (h2 * shift_reg[2]) +
                     (h3 * shift_reg[3]);
        end
    end
endmodule
