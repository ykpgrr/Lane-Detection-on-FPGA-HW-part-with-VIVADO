set_property PACKAGE_PIN    Y9 [get_ports {   clk100 } ]
set_property PACKAGE_PIN	Y21	[get_ports {	vga_blue[0]	}	]
set_property PACKAGE_PIN	Y20	[get_ports {	vga_blue[1]	}	]
set_property PACKAGE_PIN	AB20	[get_ports {	vga_blue[2]	}	]
set_property PACKAGE_PIN	AB19	[get_ports {	vga_blue[3]	}	]
set_property PACKAGE_PIN	AB22	[get_ports {	vga_green[0]	}	]
set_property PACKAGE_PIN	AA22	[get_ports {	vga_green[1]	}	]
set_property PACKAGE_PIN	AB21	[get_ports {	vga_green[2]	}	]
set_property PACKAGE_PIN	AA21	[get_ports {	vga_green[3]	}	]
set_property PACKAGE_PIN	V20	[get_ports {	vga_red[0]	}	]
set_property PACKAGE_PIN	U20	[get_ports {	vga_red[1]	}	]
set_property PACKAGE_PIN	V19	[get_ports {	vga_red[2]	}	]
set_property PACKAGE_PIN	V18	[get_ports {	vga_red[3]	}	]
set_property PACKAGE_PIN	AA19	[get_ports {	vga_hsync	}	]
set_property PACKAGE_PIN	Y19	[get_ports {	vga_vsync	}	]
	
set_property PACKAGE_PIN	Y11	 [get_ports {	ov7670_pwdn	}	] 
set_property PACKAGE_PIN	AB11 [get_ports {	ov7670_reset }	] 
set_property PACKAGE_PIN	AA11 [get_ports {	ov7670_d[0]	}	] 
set_property PACKAGE_PIN	AB10 [get_ports {	ov7670_d[1]	}	] 
set_property PACKAGE_PIN	Y10	[get_ports {	ov7670_d[2]	}	] 
set_property PACKAGE_PIN	AB9	[get_ports {	ov7670_d[3]	}	] 
set_property PACKAGE_PIN	AA9	[get_ports {	ov7670_d[4]	}	] 
set_property PACKAGE_PIN	AA8	[get_ports {	ov7670_d[5]	}	]
					
set_property PACKAGE_PIN	W12 [get_ports {	ov7670_d[6]	}	] 
set_property PACKAGE_PIN	V12 [get_ports {	ov7670_d[7]	}	] 
set_property PACKAGE_PIN	W11 [get_ports {	ov7670_xclk	}	] 
set_property PACKAGE_PIN	W10 [get_ports {	ov7670_pclk	}	] 
set_property PACKAGE_PIN	V10 [get_ports {	ov7670_href }	] 
set_property PACKAGE_PIN	V9	[get_ports {	ov7670_vsync }	] 
set_property PACKAGE_PIN	W8	[get_ports {	ov7670_siod	}	] 
set_property PACKAGE_PIN	V8	[get_ports {	ov7670_sioc	}	]				
					
#set_property PACKAGE_PIN	Y11	[get_ports {	OV7670_PWDN	}	] JA1
#set_property PACKAGE_PIN	AB11[get_ports {	OV7670_RESET}	] JA7
#set_property PACKAGE_PIN	AA11[get_ports {	OV7670_D[0]	}	] JA2
#set_property PACKAGE_PIN	AB10[get_ports {	OV7670_D[1]	}	] JA8
#set_property PACKAGE_PIN	Y10	[get_ports {	OV7670_D[2]	}	] JA3
#set_property PACKAGE_PIN	AB9	[get_ports {	OV7670_D[3]	}	] JA9
#set_property PACKAGE_PIN	AA9	[get_ports {	OV7670_D[4]	}	] JA4
#set_property PACKAGE_PIN	AA8	[get_ports {	OV7670_D[5]	}	] JA10
#					
#set_property PACKAGE_PIN	W12	[get_ports {	OV7670_D[6]	}	] JB1
#set_property PACKAGE_PIN	V12	[get_ports {	OV7670_D[7]	}	] JB7
#set_property PACKAGE_PIN	W11	[get_ports {	OV7670_XCLK	}	] JB2
#set_property PACKAGE_PIN	W10	[get_ports {	OV7670_PCLK	}	] JB8
#set_property PACKAGE_PIN	V10	[get_ports {	OV7670_HREF	}	] JB3
#set_property PACKAGE_PIN	V9	[get_ports {	OV7670_VSYNC}	] JB9
#set_property PACKAGE_PIN	W8	[get_ports {	OV7670_SIOD	}	] JB4
#set_property PACKAGE_PIN	V8	[get_ports {	OV7670_SIOC	}	] JB10

#set_property PACKAGE_PIN	V12	[get_ports {	OV7670_PCLK	}	] JB7
					
set_property PACKAGE_PIN	T22	[get_ports {	led[0]	}	]
set_property PACKAGE_PIN	T21	[get_ports {	led[1]	}	]
set_property PACKAGE_PIN	U22	[get_ports {	led[2]	}	]
set_property PACKAGE_PIN	U21	[get_ports {	led[3]	}	]
set_property PACKAGE_PIN	V22	[get_ports {	led[4]	}	]
set_property PACKAGE_PIN	W22	[get_ports {	led[5]	}	]
set_property PACKAGE_PIN	U19	[get_ports {	led[6]	}	]
set_property PACKAGE_PIN	U14	[get_ports {	led[7]	}	]
					
set_property PACKAGE_PIN	T18	[get_ports {	btn	}	]


# Voltage levels
set_property IOSTANDARD LVTTL [get_ports btn]
set_property IOSTANDARD LVTTL [get_ports {led[*]}]

set_property IOSTANDARD LVTTL [get_ports ov7670_pclk]
set_property IOSTANDARD LVTTL [get_ports ov7670_sioc]
set_property IOSTANDARD LVTTL [get_ports ov7670_vsync]
set_property IOSTANDARD LVTTL [get_ports ov7670_reset]
set_property IOSTANDARD LVTTL [get_ports ov7670_pwdn]
set_property IOSTANDARD LVTTL [get_ports ov7670_href]
set_property IOSTANDARD LVTTL [get_ports ov7670_xclk]
set_property IOSTANDARD LVTTL [get_ports ov7670_siod]
set_property IOSTANDARD LVTTL [get_ports {ov7670_d[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports vga_hsync]
set_property IOSTANDARD LVCMOS33 [get_ports vga_vsync]
set_property IOSTANDARD LVCMOS33 [get_ports clk100]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ov7670_pclk]


# Magic
