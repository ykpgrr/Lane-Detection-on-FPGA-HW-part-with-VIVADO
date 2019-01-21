`timescale 1ns / 1ps
      
module camera_top(input clk100,
                  input ov7670_sioc,
                  inout ov7670_siod,
                  output ov7670_reset,
                  output ov7670_pwdn,
                  input ov7670_vsync,
                  input ov7670_href,
                  input ov7670_pclk,
                  output ov7670_xclk,
                  input [7:0] ov7670_d, // kamera data giriþleri
                  output[7:0] led,            
                  output[3:0] vga_red,
                  output[3:0] vga_green,
                  output[3:0] vga_blue,
                  output      vga_hsync,
                  output      vga_vsync,      
                  input      btn);
            
wire [18:0] frame_addr;
wire [11:0] frame_pixel;
wire [18:0] capture_addr;
wire [11:0] capture_data;
wire        capture_we;
wire [18:0] bram_addr;
wire [11:0]  bram_data;
wire [11:0] temp_bram_data;
wire        bram_we;
wire        resend;
wire        config_finished;
wire        capt_we;
wire        clk_feedback;
wire        clk50u;
wire        clk50;
wire        clk25;
wire        clk25u;   
wire        buffered_pclk;

//rgb2sl
wire [11:0] rgb2sl_d;
wire [18:0] rgb2sl_addr;
wire rgb2sl_we;
wire rgb2sl_clk;
wire [3:0] rgb2sl_L_out;
wire [3:0] rgb2sl_S_out;
wire [18:0]  rgb2sl_capt_addr;
wire rgb2sl_capt_we;

debounce btn_db(.clk(clk50),.i(btn),.o(resend));     
                
vga                 vga1(.clk25(clk25),.vga_red(vga_red),.vga_green(vga_green),
                           .vga_blue(vga_blue),.vga_hsync(vga_hsync),.vga_vsync(vga_vsync),
                          .frame_addr(frame_addr),.frame_pixel(frame_pixel));
                          
blk_mem_gen_0       bm(.clka(ov7670_pclk),.wea(bram_we),.addra(bram_addr),.dina(temp_bram_data),
                       .clkb(clk50),.addrb(frame_addr),.doutb(frame_pixel));
                       
assign temp_bram_data = bram_data; //{4'b0000,bram_data};
assign led = {7'b0000000, config_finished};

rgb2hls rgb2hls_1(capture_data, rgb2sl_L_out, rgb2sl_S_out, capture_addr, capture_we, rgb2sl_capt_addr, rgb2sl_capt_we, ov7670_pclk);
sobel_bitwise sobel_bitwise_1(.clk(ov7670_pclk),.capt_addr(rgb2sl_capt_addr),.S_data(rgb2sl_S_out), .L_data(rgb2sl_L_out),.capt_we(rgb2sl_capt_we),.bram_addr(bram_addr),.bram_data(bram_data),.bram_we(bram_we));
ov7670_controller camera_controller(.clk(clk50),.sioc(ov7670_sioc),.resend(resend),.config_finished(config_finished),.siod(ov7670_siod),.pwdn(ov7670_pwdn),.reset(ov7670_reset),.xclk(ov7670_xclk));
camera_capture capture(.pclk(ov7670_pclk),.vsync(ov7670_vsync),.href(ov7670_href),.d(ov7670_d),.addr(capture_addr),.dout(capture_data),.we(capture_we));
clocking clock_divider(.CLK_100(clk100),.CLK_50(clk50),.CLK_25(clk25));

endmodule
