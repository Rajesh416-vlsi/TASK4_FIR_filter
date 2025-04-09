module tb_fir_filter;

    reg clk, rst;
    reg signed [7:0] d_in;
    wire signed [15:0] y_out;
    FIR_Filter uut (clk,rst,d_in,y_out);
    always #5 clk = ~clk;
    initial begin
        $display("Time\tInput\tOutput");
        $monitor("%g\t%d\t%d", $time, d_in, y_out);
        clk = 0;
        rst = 1;
        d_in = 0;
        #10 rst = 0;
        #10 d_in = 8'd1;
        #10 d_in = 8'd2;
        #10 d_in = 8'd3;
        #10 d_in = 8'd4;
        #10 d_in = 8'd0;
        #10 d_in = 8'd0;
        #10 d_in = 8'd0;
        #10 $finish;
    end

endmodule
