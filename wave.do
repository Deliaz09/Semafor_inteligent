onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /semafor_test/i_semafor/clk
add wave -noupdate /semafor_test/i_semafor/rst_n
add wave -noupdate /semafor_test/i_semafor/buton
add wave -noupdate /semafor_test/i_semafor/rosu
add wave -noupdate /semafor_test/i_semafor/verde
add wave -noupdate /semafor_test/i_semafor/galben
add wave -noupdate /semafor_test/i_semafor/rosu_p
add wave -noupdate /semafor_test/i_semafor/verde_p
add wave -noupdate /semafor_test/i_semafor/stare_prez
add wave -noupdate /semafor_test/i_semafor/stare_viitoare
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1519 ns} 0}
configure wave -namecolwidth 173
configure wave -valuecolwidth 59
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {2368 ns}
