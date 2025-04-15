vlib work
vmap work work

vlog  ../semafor.v
vlog  ../ck_rst_tb.v
vlog  ../semafor_test.v

vsim -novopt work.semafor_test
do wave.do

run -all


