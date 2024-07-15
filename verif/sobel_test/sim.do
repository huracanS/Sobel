vlib    work   
vmap    -modelsimini "D:/Modelsim/modelsim.ini" work    work
vlog    tb_sobel_top2.sv
vlog    -f ./dut.f 
vsim    -novopt -L eg work.tb_sobel_top2 
log     -r /*
run     -all
#run 100us