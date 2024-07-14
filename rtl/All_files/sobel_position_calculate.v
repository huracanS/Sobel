module sobel_position_calculate#(
    parameter   RAW_FRAME_COLNUM    =   1920,
    parameter   RAW_FRAME_ROWNUM    =   1080,
    parameter   COL_PAD_WIDTH       =   0   ,
    parameter   ROW_PAD_WIDTH       =   0
)(
    input               clk         ,    
    input               rst_n       ,
    input               count_en    ,

    output      [11:0]  a22_x       ,   //矫正位置（1920*1080中的坐标）
    output      [11:0]  a22_y       ,   
    output  wire        pos_valid       //是否是1920*1080的有效像素
);
//***************************CNT**************************//
reg [11:0]  row_cnt;
reg [11:0]  col_cnt;
always @(posedge clk,negedge rst_n) begin
    if(!rst_n)begin
        row_cnt <=  12'd0;
        col_cnt <=  12'd0;
    end
    else if(count_en)begin
        if(row_cnt == RAW_FRAME_ROWNUM-1)begin
            if(col_cnt == RAW_FRAME_COLNUM -1)begin//case1
                row_cnt <=  12'd0;
                col_cnt <=  12'd0;                
            end
            else begin                             //case2
                row_cnt <=  row_cnt;
                col_cnt <=  col_cnt + 1'b1;                 
            end
        end
        else begin
            if(col_cnt == RAW_FRAME_COLNUM -1)begin//case3
                row_cnt <=  row_cnt + 1'b1;
                col_cnt <=  12'd0;
            end
            else begin                             //case4
                row_cnt <=  row_cnt;
                col_cnt <=  col_cnt + 1'b1;                
            end  
        end
    end
    else begin
        row_cnt <=  row_cnt; 
        col_cnt <=  col_cnt;
    end
end
//*******************pos_calculate**************************//
// assign  pos_valid = (row_cnt>ROW_PAD_WIDTH)&&(row_cnt<RAW_FRAME_ROWNUM-ROW_PAD_WIDTH+1)&&
//                     (col_cnt>COL_PAD_WIDTH)&&(col_cnt<RAW_FRAME_COLNUM-COL_PAD_WIDTH+1);
assign  pos_valid = (row_cnt > ROW_PAD_WIDTH)&&(row_cnt<RAW_FRAME_ROWNUM-ROW_PAD_WIDTH+1)&&
                    (col_cnt > COL_PAD_WIDTH)&&(col_cnt<RAW_FRAME_COLNUM-COL_PAD_WIDTH+1);
assign  a22_x     = col_cnt -COL_PAD_WIDTH -1;   //col,only pos_valid the value is valid
assign  a22_y     = row_cnt -ROW_PAD_WIDTH -1;
endmodule