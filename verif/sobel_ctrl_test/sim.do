vlib    work   
vmap    -modelsimini "D:/Modelsim/modelsim.ini" work    work
vlog    -f ./dut.f 
vlog    tb_sobel_ctrl2.sv
vsim    -novopt -L eg work.tb_sobel_ctrl2 
log     -r /*
#add      wave    cmd_fsm_tb/*
run     -all
#run 100us