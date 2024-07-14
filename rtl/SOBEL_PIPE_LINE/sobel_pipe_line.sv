module sobel_pipe_line(
    input logic clk,
    input logic rstn,

    input logic [7:0] threshold,
    
    //Input:
    input  logic [23:0] input_data, // 输入FIFO的数据信号
    input  logic        input_valid,   // 输入FIFO的数据有效信号
    output logic        input_ready,  // 输入FIFO的准备接收数据信号

    //Out:输出生成的边缘检测图形RGB.
    input  logic        output_ready,  // 输出FIFO的准备接收信号
    output logic        output_valid, // 输出FIFO的数据有效信号
    output logic [23:0] output_data // 输出FIFO的数据信号
);

//-----------------------PIPE0-----------------------------------
//第0级流水线:避免输入是wire模式;时序优化,空一级.
logic [23:0] pipe0_data; // 输入SKID_BUFFER的数据信号
logic pipe0_valid;   // 输入SKID_BUFFER的数据有效信号
logic pipe0_ready;  // 输入SKID_BUFFER的准备接收数据信号
skid_buffer #(
    .WIDTH ( 24 ))
 u_skid_buffer0 (
    .clk                     ( clk                      ),
    .rst_n                   ( rstn                    ),
    //与前一级
    .input_valid             ( input_valid             ),// i 
    .input_data              ( input_data              ),// i
    .input_ready             ( input_ready             ),// o

    //与后一级
    .output_ready            ( pipe0_ready             ),// i
    .output_valid            ( pipe0_valid             ),// o
    .output_data             ( pipe0_data              ) // o
);
//----------------------------------------------------------------

//-----------------------PIPE1-----------------------------------
//第1级流水线:处理绝对值计算.
logic [23:0] pipe1_data_temp; // 输入SKID_BUFFER的数据信号
logic [23:0] pipe1_data; // 输入SKID_BUFFER的数据信号
logic pipe1_valid;   // 输入SKID_BUFFER的数据有效信号
logic pipe1_ready;  // 输入SKID_BUFFER的准备接收数据信号
skid_buffer #(
    .WIDTH ( 24 ))
 u_skid_buffer1 (
    .clk                     ( clk                      ),
    .rst_n                   ( rstn                    ),
    //与前一级
    .input_valid             ( pipe0_valid             ),// i 
    .input_data              ( pipe0_data              ),// i
    .input_ready             ( pipe0_ready             ),// o

    //与后一级
    .output_ready            ( pipe1_ready             ),// i
    .output_valid            ( pipe1_valid             ),// o
    .output_data             ( pipe1_data_temp              ) // o
);
logic [8:0] gx;//x卷积
logic [8:0] gy;//y方向卷积
assign {gx,gy} = {pipe1_data_temp[17:9],pipe1_data_temp[8:0]};

logic [7:0] gxy;
always @(*) begin
    case({gx[8],gy[8]})
        2'b00: begin
            gxy = gx[7:0] + gy[7:0];
        end

        2'b01: begin
            gxy = (gx[7:0]) + (~gy[7:0] + 1'b1);
        end

        2'b10: begin
            gxy = (~gx[7:0] + 1'b1) + (gy[7:0]);
        end

        2'b11: begin
            gxy = (~gx[7:0] + 1'b1) + (~gy[7:0] + 1'b1);
        end
    endcase 
end

assign pipe1_data = {16'h0,gxy};

//第2级流水线:处理加法运算.
logic [23:0] pipe2_data_temp; // 输入SKID_BUFFER的数据信号
logic [23:0] pipe2_data; // 输入SKID_BUFFER的数据信号
logic pipe2_valid;   // 输入SKID_BUFFER的数据有效信号
logic pipe2_ready;  // 输入SKID_BUFFER的准备接收数据信号
skid_buffer #(
    .WIDTH ( 24 ))
 u_skid_buffer2 (
    .clk                     ( clk                      ),
    .rst_n                   ( rstn                    ),
    //与前一级
    .input_valid             ( pipe1_valid             ),// i 
    .input_data              ( pipe1_data              ),// i
    .input_ready             ( pipe1_ready             ),// o

    //与后一级
    .output_ready            ( pipe2_ready             ),// i
    .output_valid            ( pipe2_valid             ),// o
    .output_data             ( pipe2_data_temp              ) // o
);

assign pipe2_data = pipe2_data_temp[7:0] > threshold ? 24'h00000000:24'hffff_ffff;

//--------------------------------------------------------------
//第3级流水线:寄存器输出.
skid_buffer #(
    .WIDTH ( 24 ))
 u_skid_buffer3 (
    .clk                     ( clk                           ),
    .rst_n                   ( rstn                         ),
    //与前一级
    .input_valid             ( pipe2_valid                   ),// i 
    .input_data              ( pipe2_data                    ),// i
    .input_ready             ( pipe2_ready                   ),// o

    //与后一级
    .output_ready            ( input_ready             ),// i
    .output_valid            ( output_valid             ),// o
    .output_data             ( output_data          ) // o
);


endmodule