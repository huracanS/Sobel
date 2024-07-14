//owner:ZZW
module sobel_linebuffer( 
	input wire clk,
    input wire rst_p,
    
    // 前一级fifo
    input  wire fifo_nempty,
    output wire fifo_re,
    input  wire [7:0] fifo_din,
    
    // demosaic_position_caculate
    output wire demosaic_position_caculate_en,
    
    //后一级fifo 
    input wire ready,
    
    //to demosaic_regarray
    output wire we,
    output wire [7:0] fifo_data_in,
    output wire [7:0] fifo_data_line0,
    output wire [7:0] fifo_data_line1

);

wire fifo_we_line0;
wire fifo_re_line0;
wire fifo_afull_line0;

wire fifo_we_line1;
wire fifo_afull_line1;
wire fifo_re_line1;
//------------FIFO linebuf0信号--------------------------
assign fifo_we_line0 = fifo_nempty & ready;//前一级不空、后一级不满时写第一级fifo_line0
assign fifo_re = fifo_we_line0;//输出给前一级fifo读
assign demosaic_position_caculate_en = fifo_we_line0;
assign fifo_re_line0 = fifo_we_line1;

//------------FIFO linebuf1信号--------------------------
assign fifo_we_line1 = fifo_afull_line0 & fifo_nempty & ready;//前一级不空、后一级不满时写第一级fifo_line0
assign fifo_re_line1 = fifo_afull_line1 & fifo_nempty & ready;
assign we = fifo_re_line1;
assign fifo_data_in = fifo_din;

//------------第一级滑动窗口linebuf0------------------
hsyncfifo_ahead2048x8 hsyncfifo_ahead2048x8_line0(
    .rst(rst_p), 
    .clk(clk), 
    .we(fifo_we_line0),  
    .di(fifo_din),
    .re(fifo_re_line0), 
    .dout(fifo_data_line0), 
    .valid(),  
    .full_flag(), 
    .empty_flag(), 
    .afull(fifo_afull_line0)  //fifo almost full flag 
); 

//------------第二级滑动窗口linebuf1------------------
hsyncfifo_ahead2048x8 hsyncfifo_ahead2048x8_line1(
    .rst(rst_p), 
    .clk(clk),  
    .we(fifo_we_line1),  //write enable,active hight
    .di(fifo_data_line0),  //write data
    .re(fifo_re_line1),  //read enable,active hight
    .dout(fifo_data_line1),  //read data
    .valid(),  
    .full_flag(),  
    .empty_flag(),  
    .afull(fifo_afull_line1)  //fifo almost full flag
);


endmodule
