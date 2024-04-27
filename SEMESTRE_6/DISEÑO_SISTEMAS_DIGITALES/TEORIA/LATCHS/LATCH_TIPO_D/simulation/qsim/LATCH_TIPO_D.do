onerror {quit -f}
vlib work
vlog -work work LATCH_TIPO_D.vo
vlog -work work LATCH_TIPO_D.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.LATCH_TIPO_D_vlg_vec_tst
vcd file -direction LATCH_TIPO_D.msim.vcd
vcd add -internal LATCH_TIPO_D_vlg_vec_tst/*
vcd add -internal LATCH_TIPO_D_vlg_vec_tst/i1/*
add wave /*
run -all
