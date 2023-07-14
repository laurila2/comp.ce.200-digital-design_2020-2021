## Clock signal 50 MHz (period in nanosec-- 8->125Mhz, 10->100Mhz 20->50Mhz)
## waveform: aseta kellon reunat {nouseva laskeva}, jos ei asetettu, menee puoliväliin, niinkuin tässäkin
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS18} [get_ports clk]
create_clock -period 20.000 -name clk_pin -waveform {0.000 10.000} -add [get_ports clk]

set_property PACKAGE_PIN D19 [get_ports {btn[0]}]
set_property PACKAGE_PIN D20 [get_ports {btn[1]}]
set_property PACKAGE_PIN L20 [get_ports {btn[2]}]
set_property PACKAGE_PIN L19 [get_ports {btn[3]}]
set_property PACKAGE_PIN R14 [get_ports {led[0]}]
set_property PACKAGE_PIN P14 [get_ports {led[1]}]
set_property PACKAGE_PIN N16 [get_ports {led[2]}]
set_property PACKAGE_PIN M14 [get_ports {led[3]}]
set_property PACKAGE_PIN M19 [get_ports rst_n]
set_property PACKAGE_PIN V17 [get_ports {channel[0]}]
set_property PACKAGE_PIN V18 [get_ports {channel[1]}]
set_property PACKAGE_PIN T16 [get_ports {channel[2]}]
set_property PACKAGE_PIN R17 [get_ports {channel[3]}]
set_property PACKAGE_PIN P18 [get_ports {channel[4]}]
set_property PACKAGE_PIN N17 [get_ports {channel[5]}]
set_property PACKAGE_PIN V13 [get_ports {channel[6]}]
set_property PACKAGE_PIN V15 [get_ports {channel[7]}]
set_property PACKAGE_PIN U17 [get_ports s_sda]
set_property PACKAGE_PIN R16 [get_ports s_clk]
set_property PACKAGE_PIN W11 [get_ports s_rst]
set_property PACKAGE_PIN Y12 [get_ports lat]
set_property PACKAGE_PIN Y11 [get_ports sb]
set_property IOSTANDARD LVCMOS18 [get_ports rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports s_sda]
set_property IOSTANDARD LVCMOS18 [get_ports s_clk]
set_property IOSTANDARD LVCMOS18 [get_ports s_rst]
set_property IOSTANDARD LVCMOS18 [get_ports lat]
set_property IOSTANDARD LVCMOS18 [get_ports sb]







set_property IOSTANDARD LVCMOS18 [get_ports sw0]
set_property PACKAGE_PIN M20 [get_ports sw0]