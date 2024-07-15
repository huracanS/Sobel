//a33 position calculate
module sobel_position_calculate#(
    parameter   RAW_FRAME_COLNUM    =   1920,
    parameter   RAW_FRAME_ROWNUM    =   1080
)(
    input               clk         ,    
    input               rst_n       ,
    input               count_en    ,
    output  wire        cov_valid   ,   //需要对a11-a33进行卷积
    output  wire        zero_valid  ,   //pad区域，需要输出0
    output  wire        pos_valid       //有效像素
);
reg [11:0]  row_cnt;
reg [11:0]  col_cnt;
//****************reset_flag_logic*************************//
//以应对初始的corner case
reg reset_flag;
always @(posedge clk,negedge rst_n) begin
    if(~rst_n)begin
        reset_flag <= 1'b0;
    end
    else if(row_cnt == 1'b1 )begin
        reset_flag <= 1'b1;
    end
end
//***************************CNT**************************//
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
end
//*******************pos_calculate**************************//
assign  cov_valid   = (row_cnt>= 'd2) && (col_cnt >= 'd2); 
assign  zero_valid  = reset_flag &&((row_cnt < 'd2) || (col_cnt < 'd2));
assign  pos_valid   = cov_valid | zero_valid;
endmodule