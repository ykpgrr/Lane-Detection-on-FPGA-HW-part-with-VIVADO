`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.05.2018 09:56:06
// Design Name: 
// Module Name: camera_top_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module camera_top_module(input clk100,
                  input ov7670_sioc,
                  inout ov7670_siod,
                  output ov7670_reset,
                  output ov7670_pwdn,
                  input ov7670_vsync,
                  input ov7670_href,
                  input ov7670_pclk,
                  output ov7670_xclk,
                  input [7:0] ov7670_d, // kamera data giriþleri
                  //output[7:0] led,
                  
                  output[3:0] vga_red,
                  output[3:0] vga_green,
                  output[3:0] vga_blue,
                  output      vga_hsync,
                  output      vga_vsync,
                  
                  input      btn);
  camera_top camera_top_module(clk100,ov7670_sioc,    
                  ov7670_siod,    
                  ov7670_reset,  
                  ov7670_pwdn,   
                  ov7670_vsync,   
                  ov7670_href,    
                  ov7670_pclk,    
                  ov7670_xclk,   
                  ov7670_d, 
                  led,                   
                  vga_red,  
                  vga_green,
                  vga_blue, 
                  vga_hsync,
                  vga_vsync,
                  btn);
                                  
 
endmodule
