`timescale 1ns / 1ps

module tb_sobel_top();

    // Define parameters
    parameter CLK_PERIOD = 10; // Clock period in ns
    
    // Declare signals
    logic clk;
    logic rst_n;
    logic [7:0] threshold;
    logic [23:0] data_m_rgb;
    logic valid_m;
    logic ready_m;
    logic ready_s;
    logic valid_s;
    logic [23:0] data_s_sobel;
    
    // Instantiate the sobel_top module
    sobel_top uut (
        .clk(clk),
        .rst_n(rst_n),
        .threshold(threshold),
        .data_m_rgb(data_m_rgb),
        .valid_m(valid_m),
        .ready_m(ready_m),
        .ready_s(ready_s),
        .valid_s(valid_s),
        .data_s_sobel(data_s_sobel)
    );
    
    glbl glbl();
    
    // Clock generation
    always #(CLK_PERIOD/2) clk = ~clk;
    
    // Initial reset and stimulus
    initial begin
        clk = 0;
        rst_n = 0;
        threshold = 8'd30;
        data_m_rgb = 24'b0;
        valid_m = 0;
        
        // Release reset after some time
        #20 rst_n = 1;
        
        // Send some data
        #30 data_m_rgb = 24'b101010101010101010101010;
        valid_m = 1;
        
        // Simulate for some time
        #100;
        
        // End simulation
        $finish;
    end
    
    // Monitor
    always @(posedge clk) begin
        $display("Time = %0t ns: valid_m = %b, ready_s = %b, valid_s = %b, data_s_sobel = %h", $time, valid_m, ready_s, valid_s, data_s_sobel);
    end

endmodule
