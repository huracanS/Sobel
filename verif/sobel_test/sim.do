vlib    work   
vmap    -modelsimini "E:/Modelsim/modelsim.ini" work    work
vlog    -f ./dut.f 
vlog    tb_sobel_top_frame.sv
# vlog    tb_sobel_top.sv 
vsim    -novopt -L eg work.tb_sobel_top_frame 
# vsim    -novopt -L eg work.tb_sobel_top 
#-t ns -l ./sim.log -wlf
log     -r /*
#add      wave    cmd_fsm_tb/*
run     -all
#run 100us