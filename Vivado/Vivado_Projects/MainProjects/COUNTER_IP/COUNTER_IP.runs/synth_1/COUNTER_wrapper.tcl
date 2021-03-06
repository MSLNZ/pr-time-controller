# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 1
create_project -in_memory -part xc7z020clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir {C:/Gitrep/SInglePhotons/Vivado Projects/COUNTER_IP/COUNTER_IP.cache/wt} [current_project]
set_property parent.project_path {C:/Gitrep/SInglePhotons/Vivado Projects/COUNTER_IP/COUNTER_IP.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_repo_paths {
  h:/IP_BLOCKS/COUNTER
  {c:/Gitrep/SInglePhotons/Vivado Projects/COUNTER_IP/COUNTER_IP.srcs/sources_1}
  c:/Gitrep/SInglePhotons/IP_BLOCKS/COUNTER/COUNTER_1.0
} [current_project]
update_ip_catalog
set_property ip_output_repo {c:/Gitrep/SInglePhotons/Vivado Projects/COUNTER_IP/COUNTER_IP.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  {C:/Gitrep/SInglePhotons/Vivado Projects/COUNTER_IP/COUNTER_IP.srcs/sources_1/imports/new/DIG_TIMER.vhd}
  {C:/Gitrep/SInglePhotons/Vivado Projects/COUNTER_IP/COUNTER_IP.srcs/sources_1/imports/new/PULSE_COUNTER.vhd}
  {C:/Gitrep/SInglePhotons/Vivado Projects/COUNTER_IP/COUNTER_IP.srcs/sources_1/bd/COUNTER/hdl/COUNTER_wrapper.vhd}
}
add_files {{C:/Gitrep/SInglePhotons/Vivado Projects/COUNTER_IP/COUNTER_IP.srcs/sources_1/bd/COUNTER/COUNTER.bd}}
set_property used_in_implementation false [get_files -all {{c:/Gitrep/SInglePhotons/Vivado Projects/COUNTER_IP/COUNTER_IP.srcs/sources_1/bd/COUNTER/ip/COUNTER_axi_gpio_0_0/COUNTER_axi_gpio_0_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{c:/Gitrep/SInglePhotons/Vivado Projects/COUNTER_IP/COUNTER_IP.srcs/sources_1/bd/COUNTER/ip/COUNTER_axi_gpio_0_0/COUNTER_axi_gpio_0_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{c:/Gitrep/SInglePhotons/Vivado Projects/COUNTER_IP/COUNTER_IP.srcs/sources_1/bd/COUNTER/ip/COUNTER_axi_gpio_0_0/COUNTER_axi_gpio_0_0.xdc}}]
set_property used_in_implementation false [get_files -all {{c:/Gitrep/SInglePhotons/Vivado Projects/COUNTER_IP/COUNTER_IP.srcs/sources_1/bd/COUNTER/ip/COUNTER_axi_gpio_0_1/COUNTER_axi_gpio_0_1_board.xdc}}]
set_property used_in_implementation false [get_files -all {{c:/Gitrep/SInglePhotons/Vivado Projects/COUNTER_IP/COUNTER_IP.srcs/sources_1/bd/COUNTER/ip/COUNTER_axi_gpio_0_1/COUNTER_axi_gpio_0_1_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{c:/Gitrep/SInglePhotons/Vivado Projects/COUNTER_IP/COUNTER_IP.srcs/sources_1/bd/COUNTER/ip/COUNTER_axi_gpio_0_1/COUNTER_axi_gpio_0_1.xdc}}]
set_property used_in_implementation false [get_files -all {{C:/Gitrep/SInglePhotons/Vivado Projects/COUNTER_IP/COUNTER_IP.srcs/sources_1/bd/COUNTER/COUNTER_ooc.xdc}}]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top COUNTER_wrapper -part xc7z020clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef COUNTER_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file COUNTER_wrapper_utilization_synth.rpt -pb COUNTER_wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
