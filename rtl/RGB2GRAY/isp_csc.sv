
/*
 * ISP - Color Space Conversion (RGB2YUV)
 */

module isp_csc(
	input logic         clk             ,
	input logic         rst_n           ,
    //Master Interface
    input  logic [23:0] data_m_rgb      ,     
    input  logic        valid_m         ,    
    output logic        ready_m         ,    
    //Slvae Interface       
    input  logic        ready_s         ,   
    output logic        valid_s         ,   
    output logic [7:0]  data_s_gray     ,
    output logic [23:0] data_s_rgb  
);

//-----------------------PIPE1-----------------------------------
//MUL
logic [47:0]    pipe1_data_o;
logic [7:0]     in_r;
logic [7:0]     in_g;
logic [7:0]     in_b;
assign in_r = data_m_rgb[23:16];
assign in_g = data_m_rgb[15:8 ];
assign in_b = data_m_rgb[7 :0 ];

logic [15:0] y_r, y_g, y_b;
assign y_r = in_r * 8'd77   ; //0.299
assign y_g = in_g * 8'd150  ; //0.584
assign y_b = in_b * 8'd29   ; //0.114

assign pipe1_data_o = {y_r,y_g,y_b}; 
logic [23:0]  pipe2_rgb_i;
logic [47:0]  pipe2_data_i;
logic pipe2_valid;  
logic pipe2_ready;  
skid_buffer #(
    .WIDTH ( 48 ))
 u_skid_buffer2 (
    .clk                     ( clk                      ),
    .rst_n                   ( rst_n                    ),
    //与前一级
    .input_valid             ( valid_m                  ),// i 
    .input_data              ( pipe1_data_o             ),// i
    .input_ready             ( ready_m                  ),// o

    //与后一级
    .output_valid            ( pipe2_valid              ),// o
    .output_data             ( pipe2_data_i             ),// o
    .output_ready            ( pipe2_ready              )// i
);
skid_buffer #(
    .WIDTH ( 24 ))
 u_skid_buffer2_bypass (
    .clk                     ( clk                      ),
    .rst_n                   ( rst_n                    ),
    //与前一级
    .input_valid             ( valid_m                  ),// i 
    .input_data              ( data_m_rgb               ),// i
    .input_ready             ( ready_m                  ),// o

    //与后一级
    .output_valid            ( pipe2_valid              ),// o
    .output_data             ( pipe2_rgb_i             ),// o
    .output_ready            ( pipe2_ready              )// i
);
//--------------------------------------------------------------


//-----------------------PIPE2-----------------------------------
logic [15:0] pipe2_y_r, pipe2_y_g, pipe2_y_b;
logic [15:0] pipe2_data_o_tmp;
logic [7 :0] pipe2_data_o;
assign pipe2_y_r = pipe2_data_i[47:32];
assign pipe2_y_g = pipe2_data_i[31:16];
assign pipe2_y_b = pipe2_data_i[15:0 ];
assign pipe2_data_o_tmp = pipe2_y_r + pipe2_y_g + pipe2_y_b;
assign pipe2_data_o = pipe2_data_o_tmp[15:8];
skid_buffer #(
    .WIDTH ( 8 ))
 u_skid_buffer3 (
    .clk                     ( clk                           ),
    .rst_n                   ( rst_n                         ),
    //与前一级
    .input_valid             ( pipe2_valid                   ),// i 
    .input_data              ( pipe2_data_o                  ),// i
    .input_ready             ( pipe2_ready                   ),// o

    //与后一级
    .output_ready            ( ready_s                       ),// i
    .output_valid            ( valid_s                       ),// o
    .output_data             ( data_s_gray                   ) // o
);
skid_buffer #(
    .WIDTH ( 24 ))
 u_skid_buffer3_bypass (
    .clk                     ( clk                           ),
    .rst_n                   ( rst_n                         ),
    //与前一级
    .input_valid             ( pipe2_valid                   ),// i 
    .input_data              ( pipe2_rgb_i                   ),// i
    .input_ready             ( pipe2_ready                   ),// o

    //与后一级
    .output_ready            ( ready_s                       ),// i
    .output_valid            ( valid_s                       ),// o
    .output_data             ( data_s_rgb                    ) // o
);
endmodule