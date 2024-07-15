`timescale 1ns / 1ns
`define SIM
module tb_sobel_top2;
glbl glbl();
// Parameters
parameter CLK_PERIOD    = 13.33;   // 75MHz clock
parameter IMAGE_WIDTH   = 1920;     // 图片宽度
parameter IMAGE_HEIGHT  = 1080;     // 图片高度
integer  a;

// Input
reg clk;
reg rst_n;
reg [23:0] data_m;
reg valid_m;
// Output
wire valid_s;
wire ready_m;
wire [23:0] data_s;
wire [23:0] dbg_bypass_rgb;
sobel_top uut(
    .clk             (clk      ),
    .rst_n           (rst_n    ),
    .threshold       (9'd350   ),
    .sobel_en        (1'b1     ),
    .data_m          (data_m   ),    
    .valid_m         (valid_m  ),    
    .ready_m         (ready_m  ),        
    .ready_s         (1'b1     ),   
    .valid_s         (valid_s  ),   
    .data_s          (data_s   ),
    .dbg_bypass_rgb  (dbg_bypass_rgb)
);

reg [23:0] data_buffer;
integer   file_in,file_out,file_out_rgb;
reg [31:0] i,j;
reg tmp;
initial begin
    // 读取二进制文件
    file_in     = $fopen("../csc_test/img_i.bin", "rb"); //读取RGB图形(bin格式)
    file_out    = $fopen("sobel_o.bin","wb");
    file_out_rgb= $fopen("sobel_o_rgb.bin","wb");
    if (file_in == 0 || file_out == 0 || file_out_rgb == 0) begin
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
    data_m           = 'd0;
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
                        data_m      <= data_buffer;                   
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
                        data_m      <= data_buffer;
                    end
                    else begin
                        valid_m         <= 1'b0;
                        data_m     <= 'd0 ; 
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
    if(valid_s)begin
        if(data_s == 'd0)begin
            $fwrite(file_out, "%c", 8'h00 );
            j <= j+ 1'b1;
            $display("j value is: %d", j);            
        end
        else begin
            $fwrite(file_out, "%c", 8'hff );
            j <= j+ 1'b1;
            $display("j value is: %d", j);            
        end

        $fwrite(file_out_rgb, "%c%c%c", dbg_bypass_rgb[23:16],dbg_bypass_rgb[15:8],dbg_bypass_rgb[7:0] );

    end
end
// 时钟生成
always #(CLK_PERIOD/2) clk = ~clk;

endmodule