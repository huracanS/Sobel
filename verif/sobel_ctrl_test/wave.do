onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_sobel_ctrl2/uut/clk
add wave -noupdate /tb_sobel_ctrl2/uut/rst_n
add wave -noupdate -group input_cnt /tb_sobel_ctrl2/uut/data_m_gray
add wave -noupdate -group input_cnt /tb_sobel_ctrl2/uut/valid_m
add wave -noupdate -group input_cnt /tb_sobel_ctrl2/uut/ready_m
add wave -noupdate -group input_cnt -color Gold -radix unsigned /tb_sobel_ctrl2/uut/u_sobel_position_calculate/row_cnt
add wave -noupdate -group input_cnt -color Gold -radix unsigned /tb_sobel_ctrl2/uut/u_sobel_position_calculate/col_cnt
add wave -noupdate -expand -group output_cnt -group data_o /tb_sobel_ctrl2/uut/a11
add wave -noupdate -expand -group output_cnt -group data_o /tb_sobel_ctrl2/uut/a12
add wave -noupdate -expand -group output_cnt -group data_o /tb_sobel_ctrl2/uut/a13
add wave -noupdate -expand -group output_cnt -group data_o /tb_sobel_ctrl2/uut/a21
add wave -noupdate -expand -group output_cnt -group data_o /tb_sobel_ctrl2/uut/a22
add wave -noupdate -expand -group output_cnt -group data_o /tb_sobel_ctrl2/uut/a23
add wave -noupdate -expand -group output_cnt -group data_o /tb_sobel_ctrl2/uut/a31
add wave -noupdate -expand -group output_cnt -group data_o /tb_sobel_ctrl2/uut/a32
add wave -noupdate -expand -group output_cnt -group data_o /tb_sobel_ctrl2/uut/a33
add wave -noupdate -expand -group output_cnt /tb_sobel_ctrl2/uut/ready_s
add wave -noupdate -expand -group output_cnt /tb_sobel_ctrl2/uut/valid_s
add wave -noupdate -expand -group output_cnt -color Gold -radix unsigned /tb_sobel_ctrl2/uut/dbg_row_cnt
add wave -noupdate -expand -group output_cnt -color Gold -radix unsigned /tb_sobel_ctrl2/uut/dbg_col_cnt
add wave -noupdate -expand -group pos_sig -color Cyan /tb_sobel_ctrl2/uut/zero_valid
add wave -noupdate -expand -group pos_sig -color Cyan /tb_sobel_ctrl2/uut/cov_valid
add wave -noupdate -expand -group pos_sig -color Cyan /tb_sobel_ctrl2/uut/pos_valid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1369336 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {153025321 ps} {154426916 ps}
