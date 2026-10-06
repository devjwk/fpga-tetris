# 100 MHz board clock
set_property PACKAGE_PIN Y9 [get_ports clk_100mhz]
set_property IOSTANDARD LVCMOS33 [get_ports clk_100mhz]

create_clock -name clk_100mhz -period 10.000 \
    -waveform {0.000 5.000} [get_ports clk_100mhz]

# middle user button -> click reset
set_property PACKAGE_PIN P16 [get_ports reset_btn]
set_property IOSTANDARD LVCMOS25 [get_ports reset_btn]

# VGA red : from lower bit to high bit
set_property PACKAGE_PIN V20 [get_ports {vga_red[0]}]
set_property PACKAGE_PIN U20 [get_ports {vga_red[1]}]
set_property PACKAGE_PIN V19 [get_ports {vga_red[2]}]
set_property PACKAGE_PIN V18 [get_ports {vga_red[3]}]

# VGA green 
set_property PACKAGE_PIN AB22 [get_ports {vga_green[0]}]
set_property PACKAGE_PIN AA22 [get_ports {vga_green[1]}]
set_property PACKAGE_PIN AB21 [get_ports {vga_green[2]}]
set_property PACKAGE_PIN AA21 [get_ports {vga_green[3]}]

# VGA blue
set_property PACKAGE_PIN Y21  [get_ports {vga_blue[0]}]
set_property PACKAGE_PIN Y20  [get_ports {vga_blue[1]}]
set_property PACKAGE_PIN AB20 [get_ports {vga_blue[2]}]
set_property PACKAGE_PIN AB19 [get_ports {vga_blue[3]}]

# VGA sync signal
set_property PACKAGE_PIN AA19 [get_ports vga_hsync]
set_property PACKAGE_PIN Y19  [get_ports vga_vsync]

# VGA voltage rules
set_property IOSTANDARD LVCMOS33 \
    [get_ports {vga_red[*] vga_green[*] vga_blue[*] \
                vga_hsync vga_vsync}]