vlib    work   
vmap    -modelsimini "D:/Modelsim/modelsim.ini" work    work
vlog    -f ./dut.f 
vlog    tb_isp_csc.sv
# vlog    tb_isp_csc_total.sv 
vsim    -novopt -L eg work.tb_isp_csc 
# vsim    -novopt -L eg work.tb_isp_csc_total 
#-t ns -l ./sim.log -wlf
log     -r /*
#add      wave    cmd_fsm_tb/*
run     -all
#run 100us