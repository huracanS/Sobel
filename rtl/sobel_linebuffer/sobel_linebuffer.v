//owner:ZZW
module sobel_linebuffer( 
	input   wire            clk                 ,
    input   wire            rst_p               ,
    //master interface
    input   wire            m_valid             ,
    output  wire            m_ready             ,
    input   wire    [7:0]   data_m_gray         ,
    input   wire    [23:0]  data_m_rgb          ,
    //slave ready
    input   wire            s_ready             ,   

    //to reg array
    output  wire            count_en            ,
    output  wire            shift_en            ,
    output  wire    [7:0]   line_buf1_out       ,
    output  wire    [7:0]   line_buf0_out       ,
    output  wire    [23:0]  line_buf0_rgb_out   
);

wire fifo_we_line0;
wire fifo_re_line0;
wire fifo_afull_line0;

wire fifo_we_line1;
wire fifo_afull_line1;
wire fifo_re_line1;
assign  m_ready = s_ready;
//------------FIFO linebuf0 sig--------------------------
assign fifo_we_line0 = m_valid & s_ready;
assign fifo_re_line0 = fifo_we_line1;
assign count_en = fifo_we_line0;
//------------FIFO linebuf1 sig--------------------------
assign fifo_we_line1 = fifo_afull_line0 & m_valid & s_ready;
assign fifo_re_line1 = fifo_afull_line1 & m_valid & s_ready;
assign shift_en = fifo_re_line1;

//------------linebuf0------------------
hsyncfifo_ahead2048x8 hsyncfifo_ahead2048x8_line0(
    .rst        (rst_p              ), 
    .clk        (clk                ), 
    .we         (fifo_we_line0      ),  
    .di         (data_m_gray        ),
    .re         (fifo_re_line0      ), 
    .dout       (line_buf0_out      ), 
    .valid      (                   ),  
    .full_flag  (                   ), 
    .empty_flag (                   ), 
    .afull      (fifo_afull_line0   )  //fifo almost full flag 
); 

hsyncfifo_ahead2048x24 hsyncfifo_ahead2048x24_line0(
    .rst        (rst_p              ), 
    .clk        (clk                ), 
    .we         (fifo_we_line0      ),  
    .di         (data_m_rgb         ),
    .re         (fifo_re_line0      ), 
    .dout       (line_buf0_rgb_out  ), 
    .valid      (                   ),  
    .full_flag  (                   ), 
    .empty_flag (                   ), 
    .afull      (fifo_afull_line0   )  //fifo almost full flag 
); 

//------------linebuf1------------------
hsyncfifo_ahead2048x8 hsyncfifo_ahead2048x8_line1(
    .rst        (rst_p              ), 
    .clk        (clk                ),  
    .we         (fifo_we_line1      ),  //write enable,active hight
    .di         (line_buf0_out      ),  //write data
    .re         (fifo_re_line1      ),  //read enable,active hight
    .dout       (line_buf1_out      ),  //read data
    .valid      (                   ),  
    .full_flag  (                   ),  
    .empty_flag (                   ),  
    .afull      (fifo_afull_line1   )  //fifo almost full flag
);


endmodule
