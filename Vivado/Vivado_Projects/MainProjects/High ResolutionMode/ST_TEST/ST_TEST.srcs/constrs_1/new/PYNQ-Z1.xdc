set_property PACKAGE_PIN N15 [get_ports ARMED]
set_property PACKAGE_PIN M15 [get_ports WAITING]
set_property PACKAGE_PIN W14 [get_ports P0]
set_property PACKAGE_PIN Y14 [get_ports P1]
set_property PACKAGE_PIN T11 [get_ports P2]
set_property PACKAGE_PIN T10 [get_ports P3]
set_property IOSTANDARD LVCMOS33 [get_ports ARMED]
set_property IOSTANDARD LVCMOS33 [get_ports P0]
set_property IOSTANDARD LVCMOS33 [get_ports P1]
set_property IOSTANDARD LVCMOS33 [get_ports P2]
set_property IOSTANDARD LVCMOS33 [get_ports P3]
set_property IOSTANDARD LVCMOS33 [get_ports WAITING]




set_property IOSTANDARD LVCMOS33 [get_ports {LOCKED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LOCKED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LOCKED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LOCKED[3]}]
set_property PACKAGE_PIN R14 [get_ports {LOCKED[0]}]
set_property PACKAGE_PIN P14 [get_ports {LOCKED[1]}]
set_property PACKAGE_PIN N16 [get_ports {LOCKED[2]}]
set_property PACKAGE_PIN M14 [get_ports {LOCKED[3]}]
set_property PACKAGE_PIN H16 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]

set_clock_latency -clock [get_clocks [list [get_clocks -of_objects [get_pins ST_TEST_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT1]] [get_clocks -of_objects [get_pins ST_TEST_i/clk_wiz_2/inst/mmcm_adv_inst/CLKOUT1]] [get_clocks -of_objects [get_pins ST_TEST_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT3]] [get_clocks -of_objects [get_pins ST_TEST_i/clk_wiz_2/inst/mmcm_adv_inst/CLKOUT3]]]] -rise -fall 0.200 [get_pins {ST_TEST_i/selectio_wiz_0/inst/clk_div_in ST_TEST_i/selectio_wiz_1/inst/clk_div_in ST_TEST_i/selectio_wiz_2/inst/clk_div_in ST_TEST_i/selectio_wiz_3/inst/clk_div_in}]
#set_property DONT_TOUCH true [get_nets ST_TEST_i/clk_wiz_2/clk_out1]
#set_property DONT_TOUCH true [get_nets ST_TEST_i/clk_wiz_2/clk_out2]
#set_property DONT_TOUCH true [get_nets ST_TEST_i/clk_wiz_2/clk_out3]
#set_property DONT_TOUCH true [get_nets ST_TEST_i/clk_wiz_2/clk_out4]
#Set dont touch to all delay components
#set_property DONT_TOUCH true [get_cells ST_TEST_i/CLOCK_DELAY_0/U0]
#set_property DONT_TOUCH true [get_cells ST_TEST_i/selectio_wiz_2/inst]
#set_property DONT_TOUCH true [get_cells ST_TEST_i/selectio_wiz_3/inst]