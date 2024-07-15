module demosaic_top (
    input                   clk             ,
    input                   rst_n           ,

    //async_fifo_rd_interface
    input                   fifo_not_empty   ,
    output                  fifo_ren        ,
    input       [7:0]       fifo_din        ,

    //sync_fifo_wr_interface
    input                   demosaic_i_ready,
    output                  demosaic_o_valid,
    output      [23:0]      fifo_dout
);
wire    [7:0]               a11,a12,a13,
                            a21,a22,a23,
                            a31,a32,a33;
wire                        shift_en;
wire                        count_en;
wire    [7:0]               linebuf0_out,
                            linebuf1_out;
wire    [11:0]              a22_x;      
wire    [11:0]              a22_y;      
wire                        pos_valid;  
wire                        data_valid;
assign                      demosaic_o_valid = data_valid;
assign                      fifo_not_full    = demosaic_i_ready; 
//**************regarray*******************//
demosaic_regarray  u_demosaic_regarray (
    .clk                     ( clk              ),
    .rst_n                   ( rst_n            ),
    .shift_en                ( shift_en         ),
    .row1_din                ( linebuf1_out     ),
    .row2_din                ( linebuf0_out     ),
    .row3_din                ( fifo_din         ),

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
demosaic_position_calculate  u_demosaic_position_calculate (
    .clk                     ( clk         ),
    .rst_n                   ( rst_n       ),
    .count_en                ( count_en    ),

    .a22_x                   ( a22_x       ),
    .a22_y                   ( a22_y       ),
    .pos_valid               ( pos_valid   )
);

//*************interpolation****************//
demosaic_interpolation  u_demosaic_interpolation (
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

    .data_out                ( fifo_dout    ),
    .data_valid              ( data_valid   )
);

//***************linebuffer*******************//
demosaic_linebuffer u_demosaic_linebuffer( 
	.clk(clk),
    .rst_p(!rst_n),
    .fifo_nempty(fifo_not_empty),
    .fifo_re(fifo_ren),
    .fifo_din(fifo_din),
    .demosaic_position_caculate_en(count_en),
    .ready(fifo_not_full),
    .we(shift_en),
    .fifo_data_in(),//
    .fifo_data_line0(linebuf0_out),
    .fifo_data_line1(linebuf1_out)

);
endmodule