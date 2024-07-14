`timescale 1ns / 100ps

module tb_isp_csc_total;

// Parameters
parameter CLK_PERIOD    = 13.33;   // 75MHz clock
parameter IMAGE_WIDTH   = 1920;     // 图片宽度
parameter IMAGE_HEIGHT  = 1080;     // 图片高度
parameter DATA_WIDTH    = 24;       // 输入数据宽度

// Input
reg clk;
reg rst_n;
reg [DATA_WIDTH-1:0] data_m_rgb;
reg valid_m;

// Output
wire valid_s;
wire ready_m;
wire [7:0] data_s_gray;

// 实例化待测试模块
isp_csc uut (
    .clk        (clk        ),
    .rst_n      (rst_n      ),
    .data_m_rgb (data_m_rgb ),
    .valid_m    (valid_m    ),
    .ready_m    (ready_m    ),
    .ready_s    (1'b1       ),
    .valid_s    (valid_s    ),
    .data_s_gray(data_s_gray)
);

// 存储从文件中读取的数据和输出数据
reg [DATA_WIDTH-1:0] image_data[IMAGE_HEIGHT*IMAGE_WIDTH-1:0];
reg [23:0] yuv_data[IMAGE_HEIGHT*IMAGE_WIDTH-1:0];
reg [23:0] data_buffer;
// 用于保存输出的文件句柄
integer  file_in,file_out;
reg tmp;
initial begin
    // 初始化信号
    clk              <= 0;
    rst_n            <= 0;
    valid_m          <= 1'b1;
    data_m_rgb       <= $fread(data_buffer,file_in); //预取第一个数据
    // 读取二进制文件
    file_in = $fopen("img.bin", "rb"); //读取RGB图形(bin格式)
    file_out= $fopen("img_o_gray.bin","rb");
    if (file_in == 0 || file_out == 0) begin
        $display("Error: Unable to open file.");
        $finish;
    end
    
    // 仿真开始
    #100; // 等待一段时间
    rst_n            <= 1; // 释放复位

    // 模拟输入过程
    forever begin
        @(posedge clk)begin
            if($feof(file_in))begin
                break;
            end

            tmp = $random;
            if(valid_m && ready_m) begin //握手成功，按照概率，切换下一个数据和拉高valid
                if(tmp)begin
                    valid_m         <= 1'b1;
                    data_m_rgb      <= $fread(data_buffer,file_in); 
                end
                else begin
                    valid_m         <= 1'b0;
                    data_m_rgb      <= 'd0 ; 
                end
            end
            else if(valid_m == 0) begin
                if(tmp)begin
                    valid_m         <= 1'b1;
                    data_m_rgb      <= $fread(data_buffer,file_in);                     
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
    if(valid_s)begin
        $fwrite(file_out, "%c", data_s_gray);
    end
end
// 时钟生成
always #(CLK_PERIOD/2) clk = ~clk;

endmodule