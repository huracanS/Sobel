module sobel_ctrl(
    input logic clk,
    input logic rst_n,

    //Input:
    input  logic [7:0]  input_fifo_data_yuv , 
    input  logic        input_fifo_valid_yuv,  
    output logic        input_fifo_ready_yuv,  

    //Out:输出生成的边缘检测图形RGB.
    input  logic        output_fifo_ready   , 
    output logic        output_fifo_valid   , 
    output logic [23:0] output_fifo_data_yuv 
);

//信号定义
logic    [7:0]              a11,a12,a13,
                            a21,a22,a23,
                            a31,a32,a33;
logic                        shift_en;
logic                        count_en;
logic    [7:0]               linebuf0_out,
                            linebuf1_out;
logic    [11:0]              a22_x;      
logic    [11:0]              a22_y;      
logic                        pos_valid;  
logic                        data_valid;
assign                      output_fifo_valid = data_valid;
assign                      fifo_not_full    = output_fifo_ready; 

//提取出Y通道值作为Sobel的计算输入.
logic [7:0] data_y;
assign data_y = input_fifo_data_yuv;

//FIFO卷积计算单元.

//**************regarray*******************//
//得到卷积数据.
sobel_regarray  u_sobel_regarray (
    .clk                     ( clk              ),
    .rst_n                   ( rst_n            ),
    .shift_en                ( shift_en         ),
    .row1_din                ( linebuf1_out     ),
    .row2_din                ( linebuf0_out     ),
    .row3_din                ( data_y           ),

    .a11                     ( a11        ),
    .a12                     ( a12        ),
    .a13                     ( a13        ),
    .a21                     ( a21        ),
    .a22                     ( a22        ),
    .a23                     ( a23        ),
    .a31                     ( a31        ),
    .a32                     ( a32        ),
    .a33                     ( a33        )
);    

//*************pos_cal*********************//
//计算卷积的中心位置.
sobel_position_calculate  u_sobel_position_calculate (
    .clk                     ( clk         ),
    .rst_n                   ( rst_n       ),
    .count_en                ( count_en    ),

    .a22_x                   ( a22_x       ),
    .a22_y                   ( a22_y       ),
    .pos_valid               ( pos_valid   )
);

//*************interpolation****************//
//计算值.
sobel_interpolation  u_sobel_interpolation (
    .clk                     ( clk          ),
    .rst_n                   ( rst_n        ),
    .shift_en                ( shift_en     ),
    .pos_valid               ( pos_valid    ),
    .a22_x                   ( a22_x        ),
    .a22_y                   ( a22_y        ),
    .a11                     ( a11          ),
    .a12                     ( a12          ),
    .a13                     ( a13          ),
    .a21                     ( a21          ),
    .a22                     ( a22          ),
    .a23                     ( a23          ),
    .a31                     ( a31          ),
    .a32                     ( a32          ),
    .a33                     ( a33          ),

    .data_out                ( output_fifo_data_yuv    ),
    .data_valid              ( data_valid   )
);

//***************linebuffer*******************//
sobel_linebuffer u_sobel_linebuffer( 
	.clk(clk),
    .rst_p(!rst_n),
    .fifo_nempty(input_fifo_valid_yuv),
    .fifo_re(input_fifo_ready_yuv),
    .fifo_din(data_y),
    .demosaic_position_caculate_en(count_en),
    .ready(fifo_not_full),
    .we(shift_en),
    .fifo_data_in(),//
    .fifo_data_line0(linebuf0_out),
    .fifo_data_line1(linebuf1_out)
);

endmodule