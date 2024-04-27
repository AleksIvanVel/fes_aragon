onerror {exit -code 1}
vlib work
vlog -work work CONTADOR.vo
vlog -work work Contador.vwf.vt
vsim -novopt -c -t 1ps -L maxii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.CONTADOR_vlg_vec_tst -voptargs="+acc"
vcd file -direction CONTADOR.msim.vcd
vcd add -internal CONTADOR_vlg_vec_tst/*
vcd add -internal CONTADOR_vlg_vec_tst/i1/*
run -all
quit -f
