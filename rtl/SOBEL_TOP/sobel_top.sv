module sobel_top(
    input logic clk,
    input logic rst_n,
    
    //输入阈值
    input logic [7:0]   threshold,//比较阈值

    //Master Interface
    input  logic [23:0] data_m_rgb      ,    
    input  logic        valid_m         ,    
    output logic        ready_m         ,    
    
    //Slvae Interface       
    input  logic        ready_s         ,   
    output logic        valid_s         ,   
    output logic [23:0] data_s_sobel 
);

//************************RGB转YUV**********************************//
logic                   ready_csc       ;   
logic                   valid_csc       ;    
logic [7 :0]            data_csc_gray   ;  
isp_csc u_isp_csc (
    .clk                   (clk          ),
    .rst_n                 (rst_n        ),
    .data_m_rgb            (data_m_rgb   ),
    .valid_m               (valid_m      ),
    .ready_m               (ready_m      ),
    .ready_s               (ready_csc    ),
    .valid_s               (valid_csc    ),
    .data_s_gray           (data_csc_gray)
);           

//************************卷积运算**********************************//
logic                   ready_sobel_ctrl   ;   
logic                   valid_sobel_ctrl   ;    
logic [23 :0]           data_sobel_ctrl_convolution   ; 
sobel_ctrl u_sobel_ctrl (
    .clk                   (clk                        ),
    .rst_n                 (rst_n                      ),
    .input_fifo_data_yuv   (data_csc_gray              ),
    .input_fifo_valid_yuv  (valid_csc                  ),
    .input_fifo_ready_yuv  (ready_csc                  ),
    .output_fifo_ready     (ready_sobel_ctrl           ),
    .output_fifo_valid     (valid_sobel_ctrl           ),
    .output_fifo_data_yuv  (data_sobel_ctrl_convolution)
);

//*****************SOBEL_Pipeline**********************************//
//得到边缘数据.
sobel_pipe_line u_sobel_pipe_line(
    .clk                      ( clk                          ),
    .rstn                     ( rst_n                         ),
                     
    .threshold                (threshold                     ),
               
    //Input:           
    .input_data                ( data_sobel_ctrl_convolution  ), 
    .input_valid               ( valid_sobel_ctrl             ), 
    .input_ready               ( ready_sobel_ctrl             ), 
           
    //Out:输出生成的边缘检测图形RGB.           
    .output_ready              ( ready_s                      ), 
    .output_valid              ( valid_s                      ), 
    .output_data               ( data_s_sobel                 )
);

endmodule