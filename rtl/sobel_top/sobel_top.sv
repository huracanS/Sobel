`define SIM
module sobel_top(
    input   logic           clk,
    input   logic           rst_n,
    
    //输入阈值
    input   logic   [8:0]   threshold,//比较阈值
    input   logic           sobel_en ,
    //Master Interface
    input   logic   [23:0]  data_m          ,    
    input   logic           valid_m         ,    
    output  logic           ready_m         ,    
    
    //Slvae Interface       
    input  logic            ready_s         ,   
    output logic            valid_s         ,  
`ifdef SIM
    output logic    [23:0]  dbg_bypass_rgb  ,
`endif 
    output logic    [23:0]  data_s 
);
logic   [7:0]   a11;
logic   [7:0]   a12;
logic   [7:0]   a13;
logic   [7:0]   a21;
logic   [7:0]   a22;
logic   [7:0]   a23;
logic   [7:0]   a31;
logic   [7:0]   a32;
logic   [7:0]   a33;
logic           ready_mid1,ready_mid2;
logic           valid_mid1,valid_mid2;
logic           zero_valid;
logic           cov_valid;
logic   [7:0]   data_gray;
logic   [23:0]  data_rgb;
logic   [23:0]  ctrl_o_rgb;        
//************************RGB2YUV****************************************************//
isp_csc u_isp_csc(
	.clk             (clk        ),
	.rst_n           (rst_n      ),
    .data_m_rgb      (data_m     ),     
    .valid_m         (valid_m    ),    
    .ready_m         (ready_m    ),       
    .ready_s         (ready_mid1 ),   
    .valid_s         (valid_mid1 ),   
    .data_s_gray     (data_gray  ),
    .data_s_rgb      (data_rgb   )
);


//************************sobel_ctrl(slide winodw)**********************************//
sobel_ctrl u_sobel_ctrl(
    .clk                 (clk          ),
    .rst_n               (rst_n        ),
    .data_m_gray         (data_gray    ), 
    .data_m_rgb          (data_rgb     ),
    .valid_m             (valid_mid1   ),  
    .ready_m             (ready_mid1   ),  
    .ready_s             (ready_mid2   ), 
    .valid_s             (valid_mid2   ), 
    .zero_valid          (zero_valid   ),
    .cov_valid           (cov_valid    ),
    .a11                 (a11          ),
    .a12                 (a12          ),
    .a13                 (a13          ),
    .a21                 (a21          ),
    .a22                 (a22          ),
    .a23                 (a23          ),
    .a31                 (a31          ),
    .a32                 (a32          ),
    .a33                 (a33          ),
    .data_s_rgb          (ctrl_o_rgb   )
);

//*****************SOBEL_Pipeline**********************************//
sobel_pipe_line u_sobel_pipe_line(
    .clk         (clk        ),
    .rst_n       (rst_n      ),
    .threshold   (threshold  ),
    .sobel_en    (sobel_en   ),
    .data_m_rgb  (ctrl_o_rgb ),
    .a11         (a11        ),
    .a12         (a12        ),
    .a13         (a13        ),
    .a21         (a21        ),
    .a22         (a22        ),
    .a23         (a23        ),
    .a31         (a31        ),
    .a32         (a32        ),
    .a33         (a33        ),
    .zero_valid  (zero_valid ),
    .valid_m     (valid_mid2 ),  
    .ready_m     (ready_mid2 ),  
`ifdef SIM
    .dbg_bypass_rgb(dbg_bypass_rgb),
`endif 
    .data_s      (data_s     ),
    .ready_s     (ready_s    ), 
    .valid_s     (valid_s    ) 
);

endmodule