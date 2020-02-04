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
set_property webtalk.parent_dir {D:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.cache/wt} [current_project]
set_property parent.project_path {D:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.xpr} [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part www.digilentinc.com:pynq-z1:part0:1.0 [current_project]
set_property ip_repo_paths {
  d:/SInglePhotons/HW_IP/COUNTER_AXI
  d:/SInglePhotons/HW_IP/DDS_AXI_PERIPH
  d:/SInglePhotons/HW_IP/DDS_COM_TEST
  d:/SInglePhotons/HW_IP/DELAY8
  d:/SInglePhotons/HW_IP/SDDR_CT
  d:/SInglePhotons/HW_IP/SDDR_ST
  d:/SInglePhotons/HW_IP/SDDR_TT
  d:/SInglePhotons/HW_IP/SDDR_DESERIALIZER
  d:/SInglePhotons/HW_IP/_Data_transference/SDDR_ST_AXI
  d:/SInglePhotons/HW_IP/_Data_transference/SDDR_CT_AXI
  d:/SInglePhotons/HW_IP/_Data_transference/SDDR_TT_AXI
} [current_project]
update_ip_catalog
set_property ip_output_repo {d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  {D:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/new/ENABLER.vhd}
  {D:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/hdl/SP_OV_wrapper.vhd}
}
add_files {{D:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/SP_OV.bd}}
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_processing_system7_0_0/SP_OV_processing_system7_0_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_rst_ps7_0_100M_0/SP_OV_rst_ps7_0_100M_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_rst_ps7_0_100M_0/SP_OV_rst_ps7_0_100M_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_data_0/P_COUNTER_axi_gpio_data_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_data_0/P_COUNTER_axi_gpio_data_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_data_0/P_COUNTER_axi_gpio_data_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_data1_0/P_COUNTER_axi_gpio_data1_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_data1_0/P_COUNTER_axi_gpio_data1_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_data1_0/P_COUNTER_axi_gpio_data1_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_data2_0/P_COUNTER_axi_gpio_data2_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_data2_0/P_COUNTER_axi_gpio_data2_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_data2_0/P_COUNTER_axi_gpio_data2_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_data3_0/P_COUNTER_axi_gpio_data3_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_data3_0/P_COUNTER_axi_gpio_data3_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_data3_0/P_COUNTER_axi_gpio_data3_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_util_0/P_COUNTER_axi_gpio_util_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_util_0/P_COUNTER_axi_gpio_util_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_util_0/P_COUNTER_axi_gpio_util_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_util1_0/P_COUNTER_axi_gpio_util1_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_util1_0/P_COUNTER_axi_gpio_util1_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_util1_0/P_COUNTER_axi_gpio_util1_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_util2_0/P_COUNTER_axi_gpio_util2_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_util2_0/P_COUNTER_axi_gpio_util2_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_util2_0/P_COUNTER_axi_gpio_util2_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_util3_0/P_COUNTER_axi_gpio_util3_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_util3_0/P_COUNTER_axi_gpio_util3_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_P_COUNTER_wrapper_0_0/src/P_COUNTER_axi_gpio_util3_0/P_COUNTER_axi_gpio_util3_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_DDS_COM_wrapper_0_0/src/DDS_COM_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_axi_gpio_0_0/DDS_AXI_PERIPH_axi_gpio_0_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_axi_gpio_0_0/DDS_AXI_PERIPH_axi_gpio_0_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_axi_gpio_0_0/DDS_AXI_PERIPH_axi_gpio_0_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_phase_0_0/DDS_AXI_PERIPH_phase_0_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_phase_0_0/DDS_AXI_PERIPH_phase_0_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_phase_0_0/DDS_AXI_PERIPH_phase_0_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_phase_1_0/DDS_AXI_PERIPH_phase_1_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_phase_1_0/DDS_AXI_PERIPH_phase_1_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_phase_1_0/DDS_AXI_PERIPH_phase_1_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_phase_2_0/DDS_AXI_PERIPH_phase_2_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_phase_2_0/DDS_AXI_PERIPH_phase_2_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_phase_2_0/DDS_AXI_PERIPH_phase_2_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_axi_gpio_0_1/DDS_AXI_PERIPH_axi_gpio_0_1_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_axi_gpio_0_1/DDS_AXI_PERIPH_axi_gpio_0_1_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_axi_gpio_0_1/DDS_AXI_PERIPH_axi_gpio_0_1.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_aux_0_1/DDS_AXI_PERIPH_aux_0_1_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_aux_0_1/DDS_AXI_PERIPH_aux_0_1_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_aux_0_1/DDS_AXI_PERIPH_aux_0_1.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_aux_1_1/DDS_AXI_PERIPH_aux_1_1_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_aux_1_1/DDS_AXI_PERIPH_aux_1_1_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_aux_1_1/DDS_AXI_PERIPH_aux_1_1.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_aux_2_1/DDS_AXI_PERIPH_aux_2_1_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_aux_2_1/DDS_AXI_PERIPH_aux_2_1_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_aux_2_1/DDS_AXI_PERIPH_aux_2_1.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_axi_gpio_0_2/DDS_AXI_PERIPH_axi_gpio_0_2_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_axi_gpio_0_2/DDS_AXI_PERIPH_axi_gpio_0_2_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DDS_AXI_PERIPH_wrapp_0_0/src/DDS_AXI_PERIPH_axi_gpio_0_2/DDS_AXI_PERIPH_axi_gpio_0_2.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_axi_gpio_0_0/SP_OV_axi_gpio_0_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_axi_gpio_0_0/SP_OV_axi_gpio_0_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_axi_gpio_0_0/SP_OV_axi_gpio_0_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_axi_gpio_0_1/SP_OV_axi_gpio_0_1_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_axi_gpio_0_1/SP_OV_axi_gpio_0_1_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_axi_gpio_0_1/SP_OV_axi_gpio_0_1.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_clk_wiz_0_1/SP_OV_clk_wiz_0_1_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_clk_wiz_0_1/SP_OV_clk_wiz_0_1.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_clk_wiz_0_1/SP_OV_clk_wiz_0_1_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_clk_wiz_1_1/SP_OV_clk_wiz_1_1_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_clk_wiz_1_1/SP_OV_clk_wiz_1_1.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_clk_wiz_1_1/SP_OV_clk_wiz_1_1_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_AXI_ST_wrapper_0_0/src/SDDR_AXI_ST_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_AXI_ST_wrapper_0_0/src/SDDR_AXI_ST_axi_gpio_0_0/SDDR_AXI_ST_axi_gpio_0_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_AXI_ST_wrapper_0_0/src/SDDR_AXI_ST_axi_gpio_0_0/SDDR_AXI_ST_axi_gpio_0_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_AXI_ST_wrapper_0_0/src/SDDR_AXI_ST_axi_gpio_0_0/SDDR_AXI_ST_axi_gpio_0_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_AXI_ST_wrapper_0_0/src/SDDR_AXI_ST_axi_gpio_0_1/SDDR_AXI_ST_axi_gpio_0_1_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_AXI_ST_wrapper_0_0/src/SDDR_AXI_ST_axi_gpio_0_1/SDDR_AXI_ST_axi_gpio_0_1_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_AXI_ST_wrapper_0_0/src/SDDR_AXI_ST_axi_gpio_0_1/SDDR_AXI_ST_axi_gpio_0_1.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_AXI_ST_wrapper_0_0/src/SDDR_AXI_ST_fifo_generator_0_0/SDDR_AXI_ST_fifo_generator_0_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_CT_AXI_wrapper_0_0/src/SDDR_CT_AXI_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_CT_AXI_wrapper_0_0/src/SDDR_CT_AXI_axi_gpio_0_0/SDDR_CT_AXI_axi_gpio_0_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_CT_AXI_wrapper_0_0/src/SDDR_CT_AXI_axi_gpio_0_0/SDDR_CT_AXI_axi_gpio_0_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_CT_AXI_wrapper_0_0/src/SDDR_CT_AXI_axi_gpio_0_0/SDDR_CT_AXI_axi_gpio_0_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_CT_AXI_wrapper_0_0/src/SDDR_CT_AXI_axi_gpio_0_1/SDDR_CT_AXI_axi_gpio_0_1_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_CT_AXI_wrapper_0_0/src/SDDR_CT_AXI_axi_gpio_0_1/SDDR_CT_AXI_axi_gpio_0_1_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_CT_AXI_wrapper_0_0/src/SDDR_CT_AXI_axi_gpio_0_1/SDDR_CT_AXI_axi_gpio_0_1.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_CT_AXI_wrapper_0_0/src/SDDR_CT_AXI_fifo_generator_0_0/SDDR_CT_AXI_fifo_generator_0_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_axi_gpio_0_0/SDDR_TT_AXI_axi_gpio_0_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_axi_gpio_0_0/SDDR_TT_AXI_axi_gpio_0_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_axi_gpio_0_0/SDDR_TT_AXI_axi_gpio_0_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_DATA0_0/SDDR_TT_AXI_DATA0_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_DATA0_0/SDDR_TT_AXI_DATA0_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_DATA0_0/SDDR_TT_AXI_DATA0_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_axi_gpio_0_1/SDDR_TT_AXI_axi_gpio_0_1_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_axi_gpio_0_1/SDDR_TT_AXI_axi_gpio_0_1_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_axi_gpio_0_1/SDDR_TT_AXI_axi_gpio_0_1.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_axi_gpio_0_2/SDDR_TT_AXI_axi_gpio_0_2_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_axi_gpio_0_2/SDDR_TT_AXI_axi_gpio_0_2_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_axi_gpio_0_2/SDDR_TT_AXI_axi_gpio_0_2.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_axi_gpio_0_3/SDDR_TT_AXI_axi_gpio_0_3_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_axi_gpio_0_3/SDDR_TT_AXI_axi_gpio_0_3_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_axi_gpio_0_3/SDDR_TT_AXI_axi_gpio_0_3.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_fifo_generator_0_0/SDDR_TT_AXI_fifo_generator_0_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_SDDR_TT_AXI_wrapper_0_0/src/SDDR_TT_AXI_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_clk_wiz_0_2/SP_OV_clk_wiz_0_2_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_clk_wiz_0_2/SP_OV_clk_wiz_0_2.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_clk_wiz_0_2/SP_OV_clk_wiz_0_2_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DESERIALIZER_B_wrapp_0_0/src/DESERIALIZER_B_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DESERIALIZER_B_wrapp_0_0/src/DESERIALIZER_B_axi_gpio_0_0/DESERIALIZER_B_axi_gpio_0_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DESERIALIZER_B_wrapp_0_0/src/DESERIALIZER_B_axi_gpio_0_0/DESERIALIZER_B_axi_gpio_0_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DESERIALIZER_B_wrapp_0_0/src/DESERIALIZER_B_axi_gpio_0_0/DESERIALIZER_B_axi_gpio_0_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DESERIALIZER_B_wrapp_0_0/src/DESERIALIZER_B_axi_gpio_0_1/DESERIALIZER_B_axi_gpio_0_1_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DESERIALIZER_B_wrapp_0_0/src/DESERIALIZER_B_axi_gpio_0_1/DESERIALIZER_B_axi_gpio_0_1_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_DESERIALIZER_B_wrapp_0_0/src/DESERIALIZER_B_axi_gpio_0_1/DESERIALIZER_B_axi_gpio_0_1.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/ip/SP_OV_auto_pc_0/SP_OV_auto_pc_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{D:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/sources_1/bd/SP_OV/SP_OV_ooc.xdc}}]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{D:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/constrs_1/new/PYNQ-Z1.xdc}}
set_property used_in_implementation false [get_files {{D:/SInglePhotons/Vivado Projects/Data_Transfer/TOP_OVERLAY/TOP_OVERLAY.srcs/constrs_1/new/PYNQ-Z1.xdc}}]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top SP_OV_wrapper -part xc7z020clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef SP_OV_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file SP_OV_wrapper_utilization_synth.rpt -pb SP_OV_wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
