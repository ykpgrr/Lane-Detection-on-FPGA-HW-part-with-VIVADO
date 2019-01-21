`timescale 1ns / 1ps

module ov7670_register( input clk,
                        input resend,
                        input advance,
                        output [15:0] command,
                        output reg finished);
                    
reg [15:0] sreg;
reg [7:0] address=0;
assign command=sreg;

always @ (*)
begin 
    if (sreg==16'hFFFF) begin
    finished<=1;
end 
else
    finished <=0;
end
 
always  @(posedge clk)
begin
    if  (resend==1) 
    begin
        address <=0;
    end 
    else if(advance==1) 
    begin 
        address <= address+1;      
    end

	case(address) 
        8'h00: sreg = 16'h1280; //COM7   Reset
        8'h01: sreg = 16'h1280; //COM7   Reset
        8'h02: sreg = 16'h1204; //COM7   Size & RGB output
        8'h03: sreg = 16'h1100; //CLKRC  Prescaler - Fin/(1+1)
        8'h04: sreg = 16'h0C00; //COM3   Lots of stuff, enable scaling, all others off
        8'h05: sreg = 16'h3E00; //COM14  PCLK scaling off        
        8'h06:   sreg = 16'h8C00; // RGB444 Set RGB format
        8'h07:   sreg = 16'h0400; // COM1   no CCIR601
        8'h08:   sreg = 16'h4010; // COM15  Full 0-255 output, RGB 565
        8'h09:   sreg = 16'h3a04; // TSLB   Set UV ordering,  do not auto-reset window
        8'h0A:   sreg = 16'h1438; // COM9  - AGC Celling
        8'h0B:   sreg = 16'h4fb3; // MTX1  - colour conversion matrix
        8'h0C:   sreg = 16'h50b3; // MTX2  - colour conversion matrix
        8'h0D:   sreg = 16'h5100; // MTX3  - colour conversion matrix
        8'h0E:   sreg = 16'h523d; // MTX4  - colour conversion matrix
        8'h0F:   sreg = 16'h53a7; // MTX5  - colour conversion matrix
        8'h10:   sreg = 16'h54e4; // MTX6  - colour conversion matrix
        8'h11:   sreg = 16'h589e; // MTXS  - Matrix sign and auto contrast
        8'h12:   sreg = 16'h3dc0; // COM13 - Turn on GAMMA and UV Auto adjust
        8'h13:   sreg = 16'h1100; // CLKRC  Prescaler - Fin/(1+1)        
        8'h14 :  sreg = 16'h1711; // HSTART HREF start (high 8 bits)
        8'h15 :  sreg = 16'h1861; // HSTOP  HREF stop (high 8 bits)
        8'h16 :  sreg = 16'h32A4; // HREF   Edge offset and low 3 bits of HSTART and HSTOP           
        8'h17 :   sreg = 16'h1903 ; // VSTART VSYNC start (high 8 bits)
        8'h18 :   sreg = 16'h1A7b ; // VSTOP  VSYNC stop (high 8 bits) 
        8'h19 :   sreg = 16'h030a ; // VREF   VSYNC low two bits

                    //when x"1A" => sreg <= x"1E20"; // Mirror enable
                
//                   8'h10 :   sreg <= 8'h703a"; -- SCALING_XSC
//                   8'h11 :   sreg <= 8'h7135"; -- SCALING_YSC
//                   8'h12 :   sreg <= 8'h7200"; -- SCALING_DCWCTR  -- zzz was 11 
//                   8'h13 :   sreg <= 8'h7300"; -- SCALING_PCLK_DIV
//                   8'h14 :   sreg <= 8'ha200"; -- SCALING_PCLK_DELAY  must match COM14
//                   when x"15"   sreg <= x"1500"; -- COM10 Use HREF not hSYNC
//                  
//                 8'h1D:   sreg  = 8'hB104; -- ABLC1 - Turn on auto black level
//                 8'h1F:   sreg  = 8'h138F; -- COM8  - AGC, White balance
//                 8'h21:   sreg  = 8'hFFFF; -- spare
//                 8'h22:   sreg  = 8'hFFFF; -- spare
//                 8'h23:   sreg  = 8'h0000; -- spare
//                 8'h24:   sreg  = 8'h0000; -- spare
//                 8'h25:   sreg  = 8'h138F; -- COM8 - AGC, White balance
//                 8'h26:   sreg  = 8'h0000; -- spare
//                 8'h27:   sreg  = 8'h1000; -- AECH Exposure
//                 8'h28:   sreg  = 8'h0D40; -- COMM4 - Window Size
//                 8'h29:   sreg  = 8'h0000; -- spare
//                 8'h2a:   sreg  = 8'ha505; -- AECGMAX banding filter step
//                 8'h2b:   sreg  = 8'h2495; -- AEW AGC Stable upper limite
//                 8'h2c:   sreg  = 8'h2533; -- AEB AGC Stable lower limi
//                 8'h2d:   sreg  = 8'h26e3; -- VPT AGC fast mode limits
//                 8'h2e:   sreg  = 8'h9f78; -- HRL High reference level
//                 8'h2f:   sreg  = 8'hA068; -- LRL low reference level
//                 8'h30:   sreg  = 8'ha103; -- DSPC3 DSP control
//                 8'h31:   sreg  = 8'hA6d8; -- LPH Lower Prob High
//                 8'h32:   sreg  = 8'hA7d8; -- UPL Upper Prob Low
//                 8'h33:   sreg  = 8'hA8f0; -- TPL Total Prob Low
//                 8'h34:   sreg  = 8'hA990; -- TPH Total Prob High
//                 8'h35:   sreg  = 8'hAA94; -- NALG AEC Algo select
//                 8'h36:   sreg  = 8'h13E5; -- COM8 AGC Settings
                      default  sreg = 16'hffff;      
               
        endcase       
end               
            
                                                                    	 
endmodule