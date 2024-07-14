onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group sobel_top /tb_sobel_top_frame/uut/clk
add wave -noupdate -group sobel_top /tb_sobel_top_frame/uut/rst_n
add wave -noupdate -group sobel_top /tb_sobel_top_frame/uut/threshold
add wave -noupdate -group sobel_top /tb_sobel_top_frame/uut/data_m_rgb
add wave -noupdate -group sobel_top /tb_sobel_top_frame/uut/valid_m
add wave -noupdate -group sobel_top /tb_sobel_top_frame/uut/ready_m
add wave -noupdate -group sobel_top /tb_sobel_top_frame/uut/ready_s
add wave -noupdate -group sobel_top /tb_sobel_top_frame/uut/valid_s
add wave -noupdate -group sobel_top /tb_sobel_top_frame/uut/data_s_sobel
add wave -noupdate -group sobel_top /tb_sobel_top_frame/uut/ready_csc
add wave -noupdate -group sobel_top /tb_sobel_top_frame/uut/valid_csc
add wave -noupdate -group sobel_top /tb_sobel_top_frame/uut/data_csc_gray
add wave -noupdate -group sobel_top /tb_sobel_top_frame/uut/ready_sobel_ctrl
add wave -noupdate -group sobel_top /tb_sobel_top_frame/uut/valid_sobel_ctrl
add wave -noupdate -group sobel_top /tb_sobel_top_frame/uut/data_sobel_ctrl_convolution
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/clk
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/rst_n
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/data_m_rgb
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/valid_m
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/ready_m
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/ready_s
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/valid_s
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/data_s_gray
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/pipe1_data_o
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/in_r
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/in_g
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/in_b
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/y_r
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/y_g
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/y_b
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/pipe2_data_i
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/pipe2_valid
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/pipe2_ready
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/pipe2_y_r
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/pipe2_y_g
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/pipe2_y_b
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/pipe2_data_o_tmp
add wave -noupdate -expand -group isp_csc /tb_sobel_top_frame/uut/u_isp_csc/pipe2_data_o
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/clk
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/rst_n
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/input_fifo_data_yuv
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/input_fifo_valid_yuv
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/input_fifo_ready_yuv
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/output_fifo_ready
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/output_fifo_valid
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/output_fifo_data_yuv
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/a11
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/a12
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/a13
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/a21
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/a22
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/a23
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/a31
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/a32
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/a33
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/shift_en
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/count_en
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/linebuf0_out
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/linebuf1_out
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/a22_x
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/a22_y
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/pos_valid
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/data_valid
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/fifo_not_full
add wave -noupdate -expand -group sobel_ctrl /tb_sobel_top_frame/uut/u_sobel_ctrl/data_y
add wave -noupdate -expand -group position_calculate /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_position_calculate/clk
add wave -noupdate -expand -group position_calculate /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_position_calculate/rst_n
add wave -noupdate -expand -group position_calculate /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_position_calculate/count_en
add wave -noupdate -expand -group position_calculate /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_position_calculate/a22_x
add wave -noupdate -expand -group position_calculate /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_position_calculate/a22_y
add wave -noupdate -expand -group position_calculate /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_position_calculate/pos_valid
add wave -noupdate -expand -group position_calculate /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_position_calculate/row_cnt
add wave -noupdate -expand -group position_calculate /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_position_calculate/col_cnt
add wave -noupdate -expand -group sobel_regarray /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_regarray/clk
add wave -noupdate -expand -group sobel_regarray /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_regarray/rst_n
add wave -noupdate -expand -group sobel_regarray /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_regarray/shift_en
add wave -noupdate -expand -group sobel_regarray /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_regarray/row1_din
add wave -noupdate -expand -group sobel_regarray /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_regarray/row2_din
add wave -noupdate -expand -group sobel_regarray /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_regarray/row3_din
add wave -noupdate -expand -group sobel_regarray /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_regarray/a11
add wave -noupdate -expand -group sobel_regarray /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_regarray/a12
add wave -noupdate -expand -group sobel_regarray /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_regarray/a13
add wave -noupdate -expand -group sobel_regarray /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_regarray/a21
add wave -noupdate -expand -group sobel_regarray /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_regarray/a22
add wave -noupdate -expand -group sobel_regarray /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_regarray/a23
add wave -noupdate -expand -group sobel_regarray /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_regarray/a31
add wave -noupdate -expand -group sobel_regarray /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_regarray/a32
add wave -noupdate -expand -group sobel_regarray /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_regarray/a33
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/clk
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/rst_n
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/shift_en
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/pos_valid
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a22_x
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a22_y
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a11
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a12
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a13
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a21
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a22
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a23
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a31
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a32
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a33
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/data_out
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/data_valid
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a11_r
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a12_r
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a13_r
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a21_r
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a22_r
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a23_r
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a31_r
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a32_r
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a33_r
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a22_x_r
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/a22_y_r
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/pos_valid_r
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/gx
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/gy
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_top_frame/uut/u_sobel_ctrl/u_sobel_interpolation/data_tmp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {101830804 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 182
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {101718799 ps} {102213358 ps}
