vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm
vlib questa_lib/msim/xbip_utils_v3_0_10
vlib questa_lib/msim/c_reg_fd_v12_0_6
vlib questa_lib/msim/xbip_dsp48_wrapper_v3_0_4
vlib questa_lib/msim/xbip_pipe_v3_0_6
vlib questa_lib/msim/xbip_dsp48_addsub_v3_0_6
vlib questa_lib/msim/xbip_addsub_v3_0_6
vlib questa_lib/msim/c_addsub_v12_0_13
vlib questa_lib/msim/c_gate_bit_v12_0_6
vlib questa_lib/msim/xbip_counter_v3_0_6
vlib questa_lib/msim/c_counter_binary_v12_0_13
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/interrupt_control_v3_1_4
vlib questa_lib/msim/axi_gpio_v2_0_21
vlib questa_lib/msim/fifo_generator_v13_2_4
vlib questa_lib/msim/xlconcat_v2_1_3
vlib questa_lib/msim/util_vector_logic_v2_0_1
vlib questa_lib/msim/xlslice_v1_0_2

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm
vmap xbip_utils_v3_0_10 questa_lib/msim/xbip_utils_v3_0_10
vmap c_reg_fd_v12_0_6 questa_lib/msim/c_reg_fd_v12_0_6
vmap xbip_dsp48_wrapper_v3_0_4 questa_lib/msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_6 questa_lib/msim/xbip_pipe_v3_0_6
vmap xbip_dsp48_addsub_v3_0_6 questa_lib/msim/xbip_dsp48_addsub_v3_0_6
vmap xbip_addsub_v3_0_6 questa_lib/msim/xbip_addsub_v3_0_6
vmap c_addsub_v12_0_13 questa_lib/msim/c_addsub_v12_0_13
vmap c_gate_bit_v12_0_6 questa_lib/msim/c_gate_bit_v12_0_6
vmap xbip_counter_v3_0_6 questa_lib/msim/xbip_counter_v3_0_6
vmap c_counter_binary_v12_0_13 questa_lib/msim/c_counter_binary_v12_0_13
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 questa_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_21 questa_lib/msim/axi_gpio_v2_0_21
vmap fifo_generator_v13_2_4 questa_lib/msim/fifo_generator_v13_2_4
vmap xlconcat_v2_1_3 questa_lib/msim/xlconcat_v2_1_3
vmap util_vector_logic_v2_0_1 questa_lib/msim/util_vector_logic_v2_0_1
vmap xlslice_v1_0_2 questa_lib/msim/xlslice_v1_0_2

vlog -work xil_defaultlib -64 -sv \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_10 -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_6 -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_6 -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_13 -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work c_gate_bit_v12_0_6 -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/c_gate_bit_v12_0_vh_rfs.vhd" \

vcom -work xbip_counter_v3_0_6 -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/xbip_counter_v3_0_vh_rfs.vhd" \

vcom -work c_counter_binary_v12_0_13 -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/hdl/c_counter_binary_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/src/sddrtt_timer/sim/sddrtt_timer.vhd" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/6429/src/SDDR_TT.vhd" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_SDDR_TT_0_0/sim/SDDR_TT_AXI_SDDR_TT_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_21 -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/9c6e/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_axi_gpio_0_0/sim/SDDR_TT_AXI_axi_gpio_0_0.vhd" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_DATA0_0/sim/SDDR_TT_AXI_DATA0_0.vhd" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_axi_gpio_0_1/sim/SDDR_TT_AXI_axi_gpio_0_1.vhd" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_axi_gpio_0_2/sim/SDDR_TT_AXI_axi_gpio_0_2.vhd" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_axi_gpio_0_3/sim/SDDR_TT_AXI_axi_gpio_0_3.vhd" \

vlog -work fifo_generator_v13_2_4 -64 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_4 -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_4 -64 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib -64 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_fifo_generator_0_0/sim/SDDR_TT_AXI_fifo_generator_0_0.v" \

vlog -work xlconcat_v2_1_3 -64 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_xlconcat_1_0/sim/SDDR_TT_AXI_xlconcat_1_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_TT_FIFO_SPLIT_0_0/sim/SDDR_TT_AXI_TT_FIFO_SPLIT_0_0.vhd" \

vlog -work util_vector_logic_v2_0_1 -64 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_util_vector_logic_0_0/sim/SDDR_TT_AXI_util_vector_logic_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_tt_capacity_controll_0_1/sim/SDDR_TT_AXI_tt_capacity_controll_0_1.vhd" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_write_clocker_0_0/sim/SDDR_TT_AXI_write_clocker_0_0.vhd" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_TT_FIFO_R_CT_0_0/sim/SDDR_TT_AXI_TT_FIFO_R_CT_0_0.vhd" \

vlog -work xlslice_v1_0_2 -64 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ipshared/f044/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_xlslice_0_0/sim/SDDR_TT_AXI_xlslice_0_0.v" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_xlslice_0_1/sim/SDDR_TT_AXI_xlslice_0_1.v" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_xlslice_1_0/sim/SDDR_TT_AXI_xlslice_1_0.v" \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/ip/SDDR_TT_AXI_xlconcat_0_1/sim/SDDR_TT_AXI_xlconcat_0_1.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../../SDDR_TT_AXI.srcs/sources_1/bd/SDDR_TT_AXI/sim/SDDR_TT_AXI.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

