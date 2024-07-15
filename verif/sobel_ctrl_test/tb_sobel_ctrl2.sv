`timescale 1ns / 100ps
`define SIM
module tb_sobel_ctrl2;
glbl glbl();
// Parameters
parameter CLK_PERIOD    = 13.33;   // 75MHz clock
parameter IMAGE_WIDTH   = 1920;     // 图片宽度
parameter IMAGE_HEIGHT  = 1080;     // 图片高度
parameter DATA_WIDTH    = 8;       // 输入数据宽度
integer  a;
// Input
reg clk;
reg rst_n;
reg [DATA_WIDTH-1:0] data_m_gray;
reg valid_m;

// Output
wire valid_s;
wire ready_m;
wire [17:0] data_s_gxy;
wire        data_s_type;
wire        zero_valid,cov_valid;
wire [7:0]   a11;
wire [7:0]   a12;
wire [7:0]   a13;
wire [7:0]   a21;
wire [7:0]   a22;
wire [7:0]   a23;
wire [7:0]   a31;
wire [7:0]   a32;
wire [7:0]   a33;
// 实例化待测试模块
sobel_ctrl uut(
    .clk                 (clk        ),
    .rst_n               (rst_n      ),
    .data_m_gray         (data_m_gray), 
    .valid_m             (valid_m    ),  
    .ready_m             (ready_m    ),  
    .ready_s             (1'b1       ), 
    .valid_s             (valid_s    ), 
    .zero_valid          (zero_valid ),
    .cov_valid           (cov_valid  ),
    .a11                 (a11        ),
    .a12                 (a12        ),
    .a13                 (a13        ),
    .a21                 (a21        ),
    .a22                 (a22        ),
    .a23                 (a23        ),
    .a31                 (a31        ),
    .a32                 (a32        ),
    .a33                 (a33        )
);

reg [7:0] data_buffer;
integer   file_in,file_out;
reg [31:0] i,j;
reg tmp;
initial begin
    // 读取二进制文件
    file_in = $fopen("../csc_test/img_o_gray.bin", "rb"); //读取RGB图形(bin格式)
    file_out= $fopen("sobel_ctrl_o.bin","wb");
    if (file_in == 0 || file_out == 0) begin
        $display("Error: Unable to open file.");
        $finish;
    end
    else begin
        $display("OK:file read success");
    end

    // 初始化信号
    clk              = 0;
    rst_n            = 0;
    valid_m          = 0;
    data_m_gray      = 'd0;
    i                = 0;
    j                = 0;
    $display("OK:initiate OK");
    // 仿真开始
    #100; // 等待一段时间
    rst_n            = 1; // 释放复位

    // 模拟输入过程
    repeat(2)begin
        forever begin
            @(posedge clk)begin
                tmp = $random;
                if(valid_m == 0) begin
                    if(tmp)begin
                        valid_m         <= 1'b1;
                        a = $fread(data_buffer,file_in); 
                        i <= i + 1'b1;
                        data_m_gray      <= data_buffer;                   
                    end
                end             
                else if(valid_m && ready_m) begin //握手成功，按照概率，切换下一个数据和拉高valid
                    if(i==1920*1080)begin
                        valid_m         <= 1'b0;
                        break;
                    end
                    if(tmp)begin
                        valid_m         <= 1'b1;
                        a = $fread(data_buffer,file_in); 
                        i <= i + 1'b1;
                        data_m_gray      <= data_buffer;
                    end
                    else begin
                        valid_m         <= 1'b0;
                        data_m_gray     <= 'd0 ; 
                    end
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
    if(j == 1920*1080)begin
        $display("j value is: %d", j);
        $finish;
    end
    if(valid_s & cov_valid)begin
        $fwrite(file_out, "%c", a22 );
        j <= j+ 1'b1;
        $display("j value is: %d", j);
    end
    else if(valid_s & zero_valid)begin
        $fwrite(file_out, "%c", 8'd0);
        j <= j+ 1'b1;
        $display("j value is: %d", j);
    end
end
// 时钟生成
always #(CLK_PERIOD/2) clk = ~clk;

endmodule