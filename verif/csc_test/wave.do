onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group clk /tb_isp_csc/clk
add wave -noupdate -expand -group master /tb_isp_csc/data_m_rgb
add wave -noupdate -expand -group master /tb_isp_csc/valid_m
add wave -noupdate -expand -group master -radix unsigned /tb_isp_csc/i
add wave -noupdate -expand -group master /tb_isp_csc/ready_m
add wave -noupdate -expand -group slave /tb_isp_csc/data_s_gray
add wave -noupdate -expand -group slave /tb_isp_csc/valid_s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {55607418300 ps} 0}
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
WaveRestoreZoom {55607322700 ps} {55607453500 ps}
