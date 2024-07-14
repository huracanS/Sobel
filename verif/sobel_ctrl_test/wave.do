onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/clk
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/rst_p
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/fifo_nempty
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/fifo_re
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/fifo_din
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/demosaic_position_caculate_en
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/ready
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/we
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/fifo_data_in
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/fifo_data_line0
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/fifo_data_line1
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/fifo_we_line0
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/fifo_re_line0
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/fifo_afull_line0
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/fifo_we_line1
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/fifo_afull_line1
add wave -noupdate -expand -group sobel_linebuffer /tb_sobel_ctrl/uut/u_sobel_linebuffer/fifo_re_line1
add wave -noupdate -expand -group sobel_regarray /tb_sobel_ctrl/uut/u_sobel_regarray/clk
add wave -noupdate -expand -group sobel_regarray /tb_sobel_ctrl/uut/u_sobel_regarray/rst_n
add wave -noupdate -expand -group sobel_regarray /tb_sobel_ctrl/uut/u_sobel_regarray/shift_en
add wave -noupdate -expand -group sobel_regarray /tb_sobel_ctrl/uut/u_sobel_regarray/row1_din
add wave -noupdate -expand -group sobel_regarray /tb_sobel_ctrl/uut/u_sobel_regarray/row2_din
add wave -noupdate -expand -group sobel_regarray /tb_sobel_ctrl/uut/u_sobel_regarray/row3_din
add wave -noupdate -expand -group sobel_regarray /tb_sobel_ctrl/uut/u_sobel_regarray/a11
add wave -noupdate -expand -group sobel_regarray /tb_sobel_ctrl/uut/u_sobel_regarray/a12
add wave -noupdate -expand -group sobel_regarray /tb_sobel_ctrl/uut/u_sobel_regarray/a13
add wave -noupdate -expand -group sobel_regarray /tb_sobel_ctrl/uut/u_sobel_regarray/a21
add wave -noupdate -expand -group sobel_regarray /tb_sobel_ctrl/uut/u_sobel_regarray/a22
add wave -noupdate -expand -group sobel_regarray /tb_sobel_ctrl/uut/u_sobel_regarray/a23
add wave -noupdate -expand -group sobel_regarray /tb_sobel_ctrl/uut/u_sobel_regarray/a31
add wave -noupdate -expand -group sobel_regarray /tb_sobel_ctrl/uut/u_sobel_regarray/a32
add wave -noupdate -expand -group sobel_regarray /tb_sobel_ctrl/uut/u_sobel_regarray/a33
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/clk
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/rst_n
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/shift_en
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/pos_valid
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/a22_x
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/a22_y
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/a11
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/a12
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/a13
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/a21
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/a22
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/a23
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/a31
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/a32
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/a33
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/data_out
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/data_valid
add wave -noupdate -expand -group sobel_interpolation -radix unsigned /tb_sobel_ctrl/uut/u_sobel_interpolation/a11_r
add wave -noupdate -expand -group sobel_interpolation -radix unsigned /tb_sobel_ctrl/uut/u_sobel_interpolation/a12_r
add wave -noupdate -expand -group sobel_interpolation -radix unsigned /tb_sobel_ctrl/uut/u_sobel_interpolation/a13_r
add wave -noupdate -expand -group sobel_interpolation -radix unsigned /tb_sobel_ctrl/uut/u_sobel_interpolation/a21_r
add wave -noupdate -expand -group sobel_interpolation -radix unsigned /tb_sobel_ctrl/uut/u_sobel_interpolation/a22_r
add wave -noupdate -expand -group sobel_interpolation -radix unsigned /tb_sobel_ctrl/uut/u_sobel_interpolation/a23_r
add wave -noupdate -expand -group sobel_interpolation -radix unsigned /tb_sobel_ctrl/uut/u_sobel_interpolation/a31_r
add wave -noupdate -expand -group sobel_interpolation -radix unsigned /tb_sobel_ctrl/uut/u_sobel_interpolation/a32_r
add wave -noupdate -expand -group sobel_interpolation -radix unsigned /tb_sobel_ctrl/uut/u_sobel_interpolation/a33_r
add wave -noupdate -expand -group sobel_interpolation -radix unsigned /tb_sobel_ctrl/uut/u_sobel_interpolation/a22_x_r
add wave -noupdate -expand -group sobel_interpolation -radix unsigned /tb_sobel_ctrl/uut/u_sobel_interpolation/a22_y_r
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/pos_valid_r
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/gx
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/gy
add wave -noupdate -expand -group sobel_interpolation /tb_sobel_ctrl/uut/u_sobel_interpolation/data_tmp
add wave -noupdate -expand -group sobel_position_calculate /tb_sobel_ctrl/uut/u_sobel_position_calculate/clk
add wave -noupdate -expand -group sobel_position_calculate /tb_sobel_ctrl/uut/u_sobel_position_calculate/rst_n
add wave -noupdate -expand -group sobel_position_calculate /tb_sobel_ctrl/uut/u_sobel_position_calculate/count_en
add wave -noupdate -expand -group sobel_position_calculate /tb_sobel_ctrl/uut/u_sobel_position_calculate/a22_x
add wave -noupdate -expand -group sobel_position_calculate /tb_sobel_ctrl/uut/u_sobel_position_calculate/a22_y
add wave -noupdate -expand -group sobel_position_calculate /tb_sobel_ctrl/uut/u_sobel_position_calculate/pos_valid
add wave -noupdate -expand -group sobel_position_calculate /tb_sobel_ctrl/uut/u_sobel_position_calculate/row_cnt
add wave -noupdate -expand -group sobel_position_calculate /tb_sobel_ctrl/uut/u_sobel_position_calculate/col_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {41460529937 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {41459168057 ps} {41462433065 ps}
