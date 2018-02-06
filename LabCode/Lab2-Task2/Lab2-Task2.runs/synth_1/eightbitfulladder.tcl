# 
# Synthesis run script generated by Vivado
# 

set_param gui.test TreeTableDev
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

create_project -in_memory -part xc7a35tcpg236-1
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /ad/eng/users/t/o/tobychen/Desktop/Lab2-Task2/Lab2-Task2.cache/wt [current_project]
set_property parent.project_path /ad/eng/users/t/o/tobychen/Desktop/Lab2-Task2/Lab2-Task2.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {
  /ad/eng/users/t/o/tobychen/Desktop/Lab2-Task2/Lab2-Task2.srcs/sources_1/imports/Lab2-Task2/1bitfulladder.v
  /ad/eng/users/t/o/tobychen/Desktop/Lab2-Task2/Lab2-Task2.srcs/sources_1/new/eightbitfulladder.v
}
catch { write_hwdef -file eightbitfulladder.hwdef }
synth_design -top eightbitfulladder -part xc7a35tcpg236-1
write_checkpoint -noxdef eightbitfulladder.dcp
catch { report_utilization -file eightbitfulladder_utilization_synth.rpt -pb eightbitfulladder_utilization_synth.pb }
