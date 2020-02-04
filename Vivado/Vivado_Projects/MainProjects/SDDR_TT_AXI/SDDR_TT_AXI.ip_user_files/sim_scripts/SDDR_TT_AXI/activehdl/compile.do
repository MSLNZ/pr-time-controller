vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/xbip_utils_v3_0_10
vlib activehdl/c_reg_fd_v12_0_6
vlib activehdl/xbip_dsp48_wrapper_v3_0_4
vlib activehdl/xbip_pipe_v3_0_6
vlib activehdl/xbip_dsp48_addsub_v3_0_6
vlib activehdl/xbip_addsub_v3_0_6
vlib activehdl/c_addsub_v12_0_13
vlib activehdl/c_gate_bit_v12_0_6
vlib activehdl/xbip_counter_v3_0_6
vlib activehdl/c_counter_binary_v12_0_13
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/interrupt_control_v3_1_4
vlib activehdl/axi_gpio_v2_0_21
vlib activehdl/fifo_generator_v13_2_4
vlib activehdl/xlconcat_v2_1_3
vlib activehdl/util_vector_logic_v2_0_1
vlib activehdl/xlslice_v1_0_2

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap xbip_utils_v3_0_10 activehdl/xbip_utils_v3_0_10
vmap c_reg_fd_v12_0_6 activehdl/c_reg_fd_v12_0_6
vmap xbip_dsp48_wrapper_v3_0_4 activehdl/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_6 activehdl/xbip_pipe_v3_0_6
vmap xbip_dsp48_addsub_v3_0_6 activehdl/xbip_dsp48_addsub_v3_0_6
vmap xbip_addsub_v3_0_6 activehdl/xbip_addsub_v3_0_6
vmap c_addsub_v12_0_13 activehdl/c_addsub_v12_0_13
vmap c_gate_bit_v12_0_6 activehdl/c_gate_bit_v12_0_6
vmap xbip_counter_v3_0_6 activehdl/xbip_counter_v3_0_6
vmap c_counter_binary_v12_0_13 activehdl/c_counter_binary_v12_0_13
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 activehdl/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_21 activehdl/axi_gpio_v2_0_21
vmap fifo_generator_v13_2_4 activehdl/fifo_generator_v13_2_4
vmap xlconcat_v2_1_3 activehdl/xlconcat_v2_1_3
vmap util_vector_logic_v2_0_1 activehdl/util_vector_logic_v2_0_1
vmap xlslice_v1_0_2 activehdl/xlslice_v1_0_2

vlog -work xil_defaultlib  -sv2k12 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_10 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_6 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_6 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_13 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work c_gate_bit_v12_0_6 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/c_gate_bit_v12_0_vh_rfs.vhd" \

vcom -work xbip_counter_v3_0_6 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/xbip_counter_v3_0_vh_rfs.vhd" \

vcom -work c_counter_binary_v12_0_13 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/c_counter_binary_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/sim/sddrtt_timer.vhd" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/6429/src/SDDR_TT.vhd" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/sim/SDDR_TT_AXI_SDDR_TT_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_21 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/9c6e/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_axi_gpio_0_0/sim/SDDR_TT_AXI_axi_gpio_0_0.vhd" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_DATA0_0/sim/SDDR_TT_AXI_DATA0_0.vhd" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_axi_gpio_0_1/sim/SDDR_TT_AXI_axi_gpio_0_1.vhd" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_axi_gpio_0_2/sim/SDDR_TT_AXI_axi_gpio_0_2.vhd" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_axi_gpio_0_3/sim/SDDR_TT_AXI_axi_gpio_0_3.vhd" \

vlog -work fifo_generator_v13_2_4  -v2k5 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_4 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_4  -v2k5 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_fifo_generator_0_0/sim/SDDR_TT_AXI_fifo_generator_0_0.v" \

vlog -work xlconcat_v2_1_3  -v2k5 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_xlconcat_1_0/sim/SDDR_TT_AXI_xlconcat_1_0.v" \

vcom -work xil_defaultlib -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_TT_FIFO_SPLIT_0_0/sim/SDDR_TT_AXI_TT_FIFO_SPLIT_0_0.vhd" \

vlog -work util_vector_logic_v2_0_1  -v2k5 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_util_vector_logic_0_0/sim/SDDR_TT_AXI_util_vector_logic_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_tt_capacity_controll_0_1/sim/SDDR_TT_AXI_tt_capacity_controll_0_1.vhd" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_write_clocker_0_0/sim/SDDR_TT_AXI_write_clocker_0_0.vhd" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_TT_FIFO_R_CT_0_0/sim/SDDR_TT_AXI_TT_FIFO_R_CT_0_0.vhd" \

vlog -work xlslice_v1_0_2  -v2k5 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/f044/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_xlslice_0_0/sim/SDDR_TT_AXI_xlslice_0_0.v" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_xlslice_0_1/sim/SDDR_TT_AXI_xlslice_0_1.v" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_xlslice_1_0/sim/SDDR_TT_AXI_xlslice_1_0.v" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_xlconcat_0_1/sim/SDDR_TT_AXI_xlconcat_0_1.v" \

vcom -work xil_defaultlib -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/sim/SDDR_TT_AXI.vhd" \

vlog -work xil_defaultlib \
"glbl.v"
