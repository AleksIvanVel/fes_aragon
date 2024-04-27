onerror {exit -code 1}
vlib work
vlog -work work SM_CONTADOR.vo
vlog -work work CONTADOR.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.SM_CONTADOR_vlg_vec_tst -voptargs="+acc"
vcd file -direction SM_CONTADOR.msim.vcd
vcd add -internal SM_CONTADOR_vlg_vec_tst/*
vcd add -internal SM_CONTADOR_vlg_vec_tst/i1/*
run -all
quit -f
