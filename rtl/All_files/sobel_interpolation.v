module sobel_interpolation(
    input               clk         ,
    input               rst_n       ,
    input               shift_en    ,

    input               pos_valid   ,
    input       [11:0]  a22_x       ,//col :GB 因为补的pad是偶数，所以不影响
    input       [11:0]  a22_y       ,//row :RG

    input       [7:0]   a11         ,
    input       [7:0]   a12         ,
    input       [7:0]   a13         ,
    input       [7:0]   a21         ,
    input       [7:0]   a22         ,
    input       [7:0]   a23         ,
    input       [7:0]   a31         ,
    input       [7:0]   a32         ,
    input       [7:0]   a33         ,  

    output  reg [23:0]  data_out    ,
    output  reg         data_valid  
);
//****************input register*************************//
reg             [7:0]   a11_r;
reg             [7:0]   a12_r;
reg             [7:0]   a13_r;
reg             [7:0]   a21_r;
reg             [7:0]   a22_r;
reg             [7:0]   a23_r;
reg             [7:0]   a31_r;
reg             [7:0]   a32_r;
reg             [7:0]   a33_r;     
reg             [11:0]  a22_x_r;
reg             [11:0]  a22_y_r;
reg                     pos_valid_r;
always@(posedge clk,negedge rst_n)begin
    if(~rst_n)begin
        a11_r       <= 'd0;
        a12_r       <= 'd0;
        a13_r       <= 'd0;
        a21_r       <= 'd0;
        a22_r       <= 'd0;
        a23_r       <= 'd0;
        a31_r       <= 'd0;
        a32_r       <= 'd0;
        a33_r       <= 'd0;
        a22_x_r     <= 'd0;
        a22_y_r     <= 'd0;
        pos_valid_r <= 'd0;
    end
    else if(shift_en)begin
        a11_r       <= a11        ;
        a12_r       <= a12        ;
        a13_r       <= a13        ;
        a21_r       <= a21        ;
        a22_r       <= a22        ;
        a23_r       <= a23        ;
        a31_r       <= a31        ;
        a32_r       <= a32        ;
        a33_r       <= a33        ;
        a22_x_r     <= a22_x      ;
        a22_y_r     <= a22_y      ;
        pos_valid_r <= pos_valid  ;        
    end
    else begin
        a11_r       <= a11_r      ;
        a12_r       <= a12_r      ;
        a13_r       <= a13_r      ;
        a21_r       <= a21_r      ;
        a22_r       <= a22_r      ;
        a23_r       <= a23_r      ;
        a31_r       <= a31_r      ;
        a32_r       <= a32_r      ;
        a33_r       <= a33_r      ;
        a22_x_r     <= a22_x_r    ;
        a22_y_r     <= a22_y_r    ;
        pos_valid_r <= pos_valid_r;       
    end
end     
//////////////////////////////////////////////////////////

//**********************计算模块***************//

//流水线执行.
wire [8:0] gx;//x卷积
wire [8:0] gy;//y方向卷积
 //gx：计算gx
//assign gx = a3 - a1 + ((b3 - b1) << 1) + c3 - c1;
//assign gy = a1 - c1 + ((a2 - c2) << 1) + a3 - c3;
wire [17:0] data_tmp;
assign gx = a13_r - a11_r + ((a23_r - a21_r) << 1) + a33_r - a31_r;
assign gy = a11_r - a31_r + ((a12_r - a32_r) << 1) + a13_r - a33_r;
assign data_tmp = {gx,gy};

//*************output register**********************//
always@(posedge clk,negedge rst_n)begin
    if(~rst_n)begin
        {data_valid,data_out} <= 25'd0;
    end
    else if(shift_en)begin
        {data_valid,data_out} <= {pos_valid_r,{6'h00,data_tmp}};
    end
    else begin
        {data_valid,data_out} <= {data_valid,data_out};
    end
end
endmodule