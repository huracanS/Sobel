module sobel_regarray(
    input               clk         ,
    input               rst_n       ,
    input               shift_en    ,//linebuffer最后一级fifo给的写使能.

    input       [7:0]   row1_din    ,//linebuf1_out
    input       [7:0]   row2_din    ,//linebuf0_out
    input       [7:0]   row3_din    ,//fifo_din
    input       [23:0]  rgb_bypass_din,
    output  reg [7:0]   a11         ,
    output  reg [7:0]   a12         ,
    output      [7:0]   a13         ,
    output  reg [7:0]   a21         ,
    output  reg [7:0]   a22         ,
    output      [7:0]   a23         ,
    output  reg [7:0]   a31         ,
    output  reg [7:0]   a32         ,
    output      [7:0]   a33         ,
    output  reg [23:0]  rgb_bypass_dout          
);
assign {a13,a23,a33}={row1_din,row2_din,row3_din};
always @(posedge clk,negedge rst_n) begin
    if(~rst_n)begin
        {a11,a12} <= 16'd0;
        {a21,a22} <= 16'd0;
        {a31,a32} <= 16'd0;    
        rgb_bypass_dout <= 24'd0;    
    end
    else if(shift_en)begin
        {a11,a12} <= {a12,a13};
        {a21,a22} <= {a22,a23};
        {a31,a32} <= {a32,a33};     
        rgb_bypass_dout <= rgb_bypass_din;    
    end
    else begin
        {a11,a12} <= {a11,a12};  
        {a21,a22} <= {a21,a22};  
        {a31,a32} <= {a31,a32};  
        rgb_bypass_dout <= rgb_bypass_dout;
    end
end
endmodule