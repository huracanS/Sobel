`timescale 1ns / 100ps

module tb_sobel_ctrl;

// Parameters
parameter CLK_PERIOD    = 10;   // 100MHz clock
parameter IMAGE_WIDTH   = 1920; // 图片宽度
parameter IMAGE_HEIGHT  = 1080; // 图片高度
parameter OUTPUT_FIFO_DATA_WIDTH = 24; // 输出数据宽度
integer  a;
// Inputs
reg clk;
reg rst_n;
reg [7:0] input_fifo_data_yuv;
reg input_fifo_valid_yuv;
reg output_fifo_ready;

// Outputs
wire input_fifo_ready_yuv;
wire output_fifo_valid;
wire [OUTPUT_FIFO_DATA_WIDTH-1:0] output_fifo_data_yuv;

// 实例化被测试模块
sobel_ctrl uut (
    .clk  (clk),
    .rst_n(rst_n),
    .input_fifo_data_yuv(input_fifo_data_yuv),
    .input_fifo_valid_yuv(input_fifo_valid_yuv),
    .input_fifo_ready_yuv(input_fifo_ready_yuv),
    .output_fifo_ready(output_fifo_ready),
    .output_fifo_valid(output_fifo_valid),
    .output_fifo_data_yuv(output_fifo_data_yuv)
);

glbl glbl();

// 存储从文件中读取的数据和输出数据
reg [7:0] data_buffer;
// 用于保存输出的文件句柄
integer  file_in,file_out;
reg [31:0] i;
reg tmp;

initial begin
    // 读取二进制文件
    file_in = $fopen("output.bin", "rb"); //读取RGB图形(bin格式)
    file_out= $fopen("img_o_s_conv.bin","wb");
    if (file_in == 0 || file_out == 0) begin
        $display("Error: Unable to open file.");
        $finish;
    end

    // 初始化信号
    clk                       <= 0;
    rst_n                     <= 0;
    input_fifo_valid_yuv      <= 0;
    input_fifo_data_yuv       <= data_buffer;
    i                         <= 0;
    output_fifo_ready         <= 1'b1;
    
    // 仿真开始
    #100; // 等待一段时间
    rst_n            <= 1; // 释放复位

    // 模拟输入过程
    forever begin
        @(posedge clk)begin
            tmp = $random;
            if(input_fifo_valid_yuv == 0) begin
                if(tmp)begin
                    input_fifo_valid_yuv         <= 1'b1;
                    a = $fread(data_buffer,file_in); 
                    i <= i + 1'b1;
                    input_fifo_data_yuv       <= data_buffer;                   
                end
            end             
            else if(input_fifo_valid_yuv && input_fifo_ready_yuv) begin //握手成功，按照概率，切换下一个数据和拉高valid
                if(i==1920*1080)begin
                    input_fifo_valid_yuv         <= 1'b0;
                    break;
                end
                if(tmp)begin
                    input_fifo_valid_yuv         <= 1'b1;
                    a = $fread(data_buffer,file_in); 
                    i <= i + 1'b1;
                    input_fifo_data_yuv       <= data_buffer;
                end
                else begin
                    input_fifo_valid_yuv         <= 1'b0;
                    input_fifo_data_yuv      <= 'd0 ; 
                end
            end
     
        end
    end

    repeat(2000)begin
        @(posedge clk)begin
            tmp<=tmp;
        end
    end
    $finish;
end

always @(posedge clk) begin
    if(output_fifo_valid)begin
        $fwrite(file_out, "%c", output_fifo_data_yuv);
    end
end

// 时钟生成
always #(CLK_PERIOD / 2) clk = ~clk;

endmodule