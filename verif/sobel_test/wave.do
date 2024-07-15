onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_sobel_top2/clk
add wave -noupdate /tb_sobel_top2/data_m
add wave -noupdate /tb_sobel_top2/valid_m
add wave -noupdate /tb_sobel_top2/ready_m
add wave -noupdate /tb_sobel_top2/data_s
add wave -noupdate /tb_sobel_top2/valid_s
add wave -noupdate /tb_sobel_top2/uut/u_sobel_pipe_line/pipe1_s_data
add wave -noupdate /tb_sobel_top2/uut/u_sobel_pipe_line/pipe0_s_data
add wave -noupdate /tb_sobel_top2/uut/u_sobel_pipe_line/pipe2_m_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {56678210 ps} 0}
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
WaveRestoreZoom {102202937 ps} {103757542 ps}
