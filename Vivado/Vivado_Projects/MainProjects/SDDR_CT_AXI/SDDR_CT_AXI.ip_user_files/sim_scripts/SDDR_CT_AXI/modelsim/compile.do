vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xbip_utils_v3_0_10
vlib modelsim_lib/msim/c_reg_fd_v12_0_6
vlib modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_4
vlib modelsim_lib/msim/xbip_pipe_v3_0_6
vlib modelsim_lib/msim/xbip_dsp48_addsub_v3_0_6
vlib modelsim_lib/msim/xbip_addsub_v3_0_6
vlib modelsim_lib/msim/c_addsub_v12_0_13
vlib modelsim_lib/msim/c_gate_bit_v12_0_6
vlib modelsim_lib/msim/xbip_counter_v3_0_6
vlib modelsim_lib/msim/c_counter_binary_v12_0_13
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/interrupt_control_v3_1_4
vlib modelsim_lib/msim/axi_gpio_v2_0_21
vlib modelsim_lib/msim/fifo_generator_v13_2_4
vlib modelsim_lib/msim/xlconcat_v2_1_3
vlib modelsim_lib/msim/util_vector_logic_v2_0_1
vlib modelsim_lib/msim/xlslice_v1_0_2

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm
vmap xbip_utils_v3_0_10 modelsim_lib/msim/xbip_utils_v3_0_10
vmap c_reg_fd_v12_0_6 modelsim_lib/msim/c_reg_fd_v12_0_6
vmap xbip_dsp48_wrapper_v3_0_4 modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_6 modelsim_lib/msim/xbip_pipe_v3_0_6
vmap xbip_dsp48_addsub_v3_0_6 modelsim_lib/msim/xbip_dsp48_addsub_v3_0_6
vmap xbip_addsub_v3_0_6 modelsim_lib/msim/xbip_addsub_v3_0_6
vmap c_addsub_v12_0_13 modelsim_lib/msim/c_addsub_v12_0_13
vmap c_gate_bit_v12_0_6 modelsim_lib/msim/c_gate_bit_v12_0_6
vmap xbip_counter_v3_0_6 modelsim_lib/msim/xbip_counter_v3_0_6
vmap c_counter_binary_v12_0_13 modelsim_lib/msim/c_counter_binary_v12_0_13
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 modelsim_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_21 modelsim_lib/msim/axi_gpio_v2_0_21
vmap fifo_generator_v13_2_4 modelsim_lib/msim/fifo_generator_v13_2_4
vmap xlconcat_v2_1_3 modelsim_lib/msim/xlconcat_v2_1_3
vmap util_vector_logic_v2_0_1 modelsim_lib/msim/util_vector_logic_v2_0_1
vmap xlslice_v1_0_2 modelsim_lib/msim/xlslice_v1_0_2

vlog -work xil_defaultlib -64 -incr -sv \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_10 -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_SDDR_CT_0_0/src/CT_TIMER/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_6 -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_SDDR_CT_0_0/src/CT_TIMER/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_SDDR_CT_0_0/src/CT_TIMER/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_SDDR_CT_0_0/src/CT_TIMER/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_SDDR_CT_0_0/src/CT_TIMER/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_6 -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_SDDR_CT_0_0/src/CT_TIMER/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_13 -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_SDDR_CT_0_0/src/CT_TIMER/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work c_gate_bit_v12_0_6 -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_SDDR_CT_0_0/src/CT_TIMER/hdl/c_gate_bit_v12_0_vh_rfs.vhd" \

vcom -work xbip_counter_v3_0_6 -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_SDDR_CT_0_0/src/CT_TIMER/hdl/xbip_counter_v3_0_vh_rfs.vhd" \

vcom -work c_counter_binary_v12_0_13 -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_SDDR_CT_0_0/src/CT_TIMER/hdl/c_counter_binary_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_SDDR_CT_0_0/src/CT_TIMER/sim/CT_TIMER.vhd" \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ipshared/c9c6/src/SDDR_CT.vhd" \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ipshared/c9c6/src/ISERDES_WRAPPER.vhd" \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_SDDR_CT_0_0/sim/SDDR_CT_AXI_SDDR_CT_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_21 -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ipshared/9c6e/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_axi_gpio_0_0/sim/SDDR_CT_AXI_axi_gpio_0_0.vhd" \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_axi_gpio_0_1/sim/SDDR_CT_AXI_axi_gpio_0_1.vhd" \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_CTA_SPLIT_0_0/sim/SDDR_CT_AXI_CTA_SPLIT_0_0.vhd" \

vlog -work fifo_generator_v13_2_4 -64 -incr \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_4 -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_4 -64 -incr \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_fifo_generator_0_0/sim/SDDR_CT_AXI_fifo_generator_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_CT_FIFO_R_CT_0_0/sim/SDDR_CT_AXI_CT_FIFO_R_CT_0_0.vhd" \

vlog -work xlconcat_v2_1_3 -64 -incr \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_xlconcat_0_1/sim/SDDR_CT_AXI_xlconcat_0_1.v" \

vlog -work util_vector_logic_v2_0_1 -64 -incr \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_util_vector_logic_0_0/sim/SDDR_CT_AXI_util_vector_logic_0_0.v" \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_util_vector_logic_0_1/sim/SDDR_CT_AXI_util_vector_logic_0_1.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_ct_capacity_controll_0_0/sim/SDDR_CT_AXI_ct_capacity_controll_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_util_vector_logic_2_0/sim/SDDR_CT_AXI_util_vector_logic_2_0.v" \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_util_vector_logic_3_0/sim/SDDR_CT_AXI_util_vector_logic_3_0.v" \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_xlconcat_1_1/sim/SDDR_CT_AXI_xlconcat_1_1.v" \

vlog -work xlslice_v1_0_2 -64 -incr \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ipshared/f044/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_xlslice_0_0/sim/SDDR_CT_AXI_xlslice_0_0.v" \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/ip/SDDR_CT_AXI_xlslice_0_1/sim/SDDR_CT_AXI_xlslice_0_1.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../../SDDR_CT_AXI.srcs/sources_1/bd/SDDR_CT_AXI/sim/SDDR_CT_AXI.vhd" \

vlog -work xil_defaultlib \
"glbl.v"
