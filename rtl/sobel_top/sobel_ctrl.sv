module sobel_ctrl(
    input   logic           clk                 ,
    input   logic           rst_n               ,

    //master interface
    input   logic   [7:0]   data_m_gray         , 
    input   logic   [23:0]  data_m_rgb          ,
    input   logic           valid_m             ,  
    output  logic           ready_m             ,  

    //slave interface
    input   logic           ready_s             , 
    output  logic           valid_s             , 
    output  logic           zero_valid          ,
    output  logic           cov_valid           ,
    output  logic   [7:0]   a11                 ,
    output  logic   [7:0]   a12                 ,
    output  logic   [7:0]   a13                 ,
    output  logic   [7:0]   a21                 ,
    output  logic   [7:0]   a22                 ,
    output  logic   [7:0]   a23                 ,
    output  logic   [7:0]   a31                 ,
    output  logic   [7:0]   a32                 ,
    output  logic   [7:0]   a33                 ,
    output  logic   [23:0]  data_s_rgb          
);

logic                       shift_en;
logic                       count_en;

logic    [7:0]              line_buf0_out,
                            line_buf1_out;
logic   [23:0]              line_buf0_rgb_out;
logic                       pos_valid;

assign valid_s = pos_valid & count_en;
//***************linebuffer*******************//
sobel_linebuffer u_sobel_linebuffer( 
	.clk                 (clk           ),
    .rst_p               (~rst_n        ),
    .m_valid             (valid_m       ),
    .m_ready             (ready_m       ),
    .data_m_gray         (data_m_gray   ),
    .data_m_rgb          (data_m_rgb    ),
    .s_ready             (ready_s       ),   
    .count_en            (count_en      ),
    .shift_en            (shift_en      ),
    .line_buf1_out       (line_buf1_out ),
    .line_buf0_out       (line_buf0_out ),
    .line_buf0_rgb_out   (line_buf0_rgb_out)
);

//*************pos_cal*********************//
sobel_position_calculate u_sobel_position_calculate (
    .clk                 (clk          ),    
    .rst_n               (rst_n        ),
    .count_en            (count_en     ),
    .cov_valid           (cov_valid    ),   
    .zero_valid          (zero_valid   ),   
    .pos_valid           (pos_valid    )       
);

//**************regarray*******************//
sobel_regarray  u_sobel_regarray (
    .clk                 ( clk              ),
    .rst_n               ( rst_n            ),
    .shift_en            ( shift_en         ),
    .row1_din            ( line_buf1_out    ),
    .row2_din            ( line_buf0_out    ),
    .row3_din            ( data_m_gray      ),
    .rgb_bypass_din      ( line_buf0_rgb_out),
    .a11                 ( a11        ),
    .a12                 ( a12        ),
    .a13                 ( a13        ),
    .a21                 ( a21        ),
    .a22                 ( a22        ),
    .a23                 ( a23        ),
    .a31                 ( a31        ),
    .a32                 ( a32        ),
    .a33                 ( a33        ),
    .rgb_bypass_dout     ( data_s_rgb )
);    


//----------------debug cnt-------------------------------------
`ifdef SIM
logic [11:0] dbg_row_cnt;
logic [11:0] dbg_col_cnt;
always @(posedge clk,negedge rst_n) begin
    if(!rst_n)begin
        dbg_row_cnt <=  12'd0;
        dbg_col_cnt <=  12'd0;
    end
    else if(ready_s & valid_s)begin
        if(dbg_row_cnt == 1080-1)begin
            if(dbg_col_cnt == 1920 -1)begin//case1
                dbg_row_cnt <=  12'd0;
                dbg_col_cnt <=  12'd0;                
            end
            else begin                             //case2
                dbg_row_cnt <=  dbg_row_cnt;
                dbg_col_cnt <=  dbg_col_cnt + 1'b1;                 
            end
        end
        else begin
            if(dbg_col_cnt == 1920 -1)begin//case3
                dbg_row_cnt <=  dbg_row_cnt + 1'b1;
                dbg_col_cnt <=  12'd0;
            end
            else begin                             //case4
                dbg_row_cnt <=  dbg_row_cnt;
                dbg_col_cnt <=  dbg_col_cnt + 1'b1;                
            end  
        end
    end
end
`endif
//----------------------------------------------------------
endmodule