`timescale 1ns / 1ps

module ov7670_controller(
    input clk,
    input resend,
    output sioc,
    inout siod,
    output config_finished,
    output reset,
    output pwdn,
    output xclk
    );
    
   
 reg sys_clk =0;
 wire [15:0] command;
 wire finished;
 wire taken;
 wire send;
 
   parameter  [7:0] camera_address =  8'h42; //   Device write ID   datasheet 11. sayfa 
   
   assign send =~finished;
   assign config_finished = finished;
 
   i2c_sender i2c(.clk(clk),.taken(taken),.siod(siod),.sioc(sioc),.send(send),.id(camera_address),.reg1(command[15:8]),.value(command [7:0]));
   
   assign reset=1;   //normal mod
   assign pwdn =0;   // power device up
   assign xclk = sys_clk;
   
   ov7670_register rg(.clk(clk),.advance(taken),.command(command),.finished(finished),.resend(resend));
   
   always @ (posedge clk)
   begin  
       sys_clk <= ~sys_clk;
   end 
 
endmodule
