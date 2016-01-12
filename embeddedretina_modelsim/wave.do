onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal /tb_retinadescriptorgenerator/contador
add wave -noupdate -format Literal /tb_retinadescriptorgenerator/descriptor
add wave -noupdate -format Logic /tb_retinadescriptorgenerator/enableout
add wave -noupdate -format Literal /tb_retinadescriptorgenerator/uut/topdescriptor_maker/pointbufferx/counter
add wave -noupdate -format Logic /tb_retinadescriptorgenerator/uut/keypoint_reader/enablein
add wave -noupdate -format Logic /tb_retinadescriptorgenerator/uut/imagepatch_reader/en_out
add wave -noupdate -format Logic /tb_retinadescriptorgenerator/uut/gaussian_filter/enablein
add wave -noupdate -format Logic /tb_retinadescriptorgenerator/uut/gaussian_filter/enableout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {105 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {0 ns} {500 ns}
