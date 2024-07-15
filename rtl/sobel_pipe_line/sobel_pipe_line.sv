`define SIM
module sobel_pipe_line(
    input   logic           clk         ,
    input   logic           rst_n        ,

    input   logic [8:0]     threshold   ,
    input   logic           sobel_en    ,
    //master
    input   logic   [23:0]  data_m_rgb  ,
    input   logic   [7:0]   a11         ,
    input   logic   [7:0]   a12         ,
    input   logic   [7:0]   a13         ,
    input   logic   [7:0]   a21         ,
    input   logic   [7:0]   a22         ,
    input   logic   [7:0]   a23         ,
    input   logic   [7:0]   a31         ,
    input   logic   [7:0]   a32         ,
    input   logic   [7:0]   a33         ,
    input   logic           zero_valid  ,
    input   logic           valid_m     ,  
    output  logic           ready_m     ,  

    //slave
`ifdef SIM
    output  logic [23:0]    dbg_bypass_rgb,
`endif 
    output  logic [23:0]    data_s      ,
    input   logic           ready_s     , 
    output  logic           valid_s      
 
);
//-----------------------PIPE0-----------------------------------
//流水线执行.
logic [8:0] gx0;//x cov
logic [8:0] gy0;//y cov
logic [17:0]  pipe0_m_data;  
logic [17:0]  pipe0_s_data;  
logic [23:0]  pipe0_s_rgb; 
logic pipe0_s_valid;         
logic pipe0_s_ready; 
assign gx0 = a13  - a11  + ((a23  - a21 ) << 1) + a33  - a31 ;
assign gy0 = a11  - a31  + ((a12  - a32 ) << 1) + a13  - a33 ;
assign pipe0_m_data = zero_valid?'d0:{gx0,gy0};
        
skid_buffer #(
    .WIDTH ( 18 ))
 u_skid_buffer0 (
    .clk                     ( clk                      ),
    .rst_n                   ( rst_n                    ),
    //与前一级
    .input_valid             ( valid_m                  ),// i 
    .input_data              ( pipe0_m_data             ),// i
    .input_ready             ( ready_m                  ),// o

    //与后一级
    .output_ready            ( pipe0_s_ready            ),// i
    .output_valid            ( pipe0_s_valid            ),// o
    .output_data             ( pipe0_s_data             ) // o
);

skid_buffer #(
    .WIDTH ( 24 ))
 u_skid_buffer0_bpyass (
    .clk                     ( clk                      ),
    .rst_n                   ( rst_n                    ),
    //与前一级
    .input_valid             ( valid_m                  ),// i 
    .input_data              ( data_m_rgb               ),// i
    .input_ready             (                          ),// o

    //与后一级
    .output_ready            ( pipe0_s_ready            ),// i
    .output_valid            (                          ),// o
    .output_data             ( pipe0_s_rgb              ) // o
);
//----------------------------------------------------------------

//-----------------------PIPE1-----------------------------------
logic [8:0]  gx1;//x cov
logic [8:0]  gy1;//y cov
logic [8:0]  pipe1_m_data;
logic [8:0]  pipe1_s_data;  
logic [23:0] pipe1_s_rgb;
logic pipe1_s_valid;         
logic pipe1_s_ready; 

assign  gx1 = pipe0_s_data[17:9];
assign  gy1 = pipe0_s_data[8 :0];

always @(*) begin
    case({gx1[8],gy1[8]})
        2'b00: begin
            pipe1_m_data = gx1[7:0] + gy1[7:0];
        end
        2'b01: begin
            pipe1_m_data = (gx1[7:0]) + (~gy1[7:0] + 1'b1);
        end

        2'b10: begin
            pipe1_m_data = (~gx1[7:0] + 1'b1) + (gy1[7:0]);
        end
        2'b11: begin
            pipe1_m_data = (~gx1[7:0] + 1'b1) + (~gy1[7:0] + 1'b1);
        end
    endcase 
end
skid_buffer #(
    .WIDTH ( 9 ))
 u_skid_buffer1 (
    .clk                     ( clk                      ),
    .rst_n                   ( rst_n                    ),
    //与前一级
    .input_valid             ( pipe0_s_valid            ),// i 
    .input_data              ( pipe1_m_data             ),// i
    .input_ready             ( pipe0_s_ready            ),// o

    //与后一级
    .output_ready            ( pipe1_s_ready            ),// i
    .output_valid            ( pipe1_s_valid            ),// o
    .output_data             ( pipe1_s_data             ) // o
);

skid_buffer #(
    .WIDTH ( 24 ))
 u_skid_buffer1_bypass (
    .clk                     ( clk                      ),
    .rst_n                   ( rst_n                    ),
    //与前一级
    .input_valid             ( pipe0_s_valid            ),// i 
    .input_data              ( pipe0_s_rgb              ),// i
    .input_ready             (                          ),// o

    //与后一级
    .output_ready            ( pipe1_s_ready            ),// i
    .output_valid            (                          ),// o
    .output_data             ( pipe1_s_rgb              ) // o
);
//-----------------------PIPE2-----------------------------------
logic  [23:0]   pipe2_m_data;
assign pipe2_m_data = (~sobel_en)?pipe1_s_rgb:(pipe1_s_data  > threshold )? 24'h000000:24'hffffff;         
skid_buffer #(
    .WIDTH ( 24 ))
 u_skid_buffer2 (
    .clk                     ( clk                      ),
    .rst_n                   ( rst_n                    ),
    //与前一级
    .input_valid             ( pipe1_s_valid            ),// i 
    .input_data              ( pipe2_m_data             ),// i
    .input_ready             ( pipe1_s_ready            ),// o

    //与后一级
    .output_ready            ( ready_s                  ),// i
    .output_valid            ( valid_s                  ),// o
    .output_data             ( data_s                   ) // o
);
`ifdef SIM
    skid_buffer #(
        .WIDTH ( 24 ))
    u_skid_buffer2_bypass (
        .clk                     ( clk                      ),
        .rst_n                   ( rst_n                    ),
        //与前一级
        .input_valid             ( pipe1_s_valid            ),// i 
        .input_data              ( pipe1_s_rgb              ),// i
        .input_ready             (                          ),// o

        //与后一级
        .output_ready            ( ready_s                  ),// i
        .output_valid            (                          ),// o
        .output_data             ( dbg_bypass_rgb           ) // o
    );    
`endif 


endmodule