`timescale 1ns / 1ps

module camera_capture(
    input pclk,
    input vsync,
    input href,
    input [7:0] d,
    output [18:0] addr,
    output reg [11:0] dout,
    output reg we
    );
    
reg [15:0] d_latch =0;
reg [18:0] address =0;
reg [18:0] address_next =0;
reg [1:0] wr_hold=0;


assign addr=address;

always @ (posedge pclk)
begin

      
//                This is a bit tricky href starts a pixel transfer that takes 3 cycles
//                       Input   | state after clock tick   
//                        href   | wr_hold    d_latch           d                 we address  address_next
//                cycle -1  x    |    xx      xxxxxxxxxxxxxxxx  xxxxxxxxxxxxxxxx  x   xxxx     xxxx
//                cycle 0   1    |    x1      xxxxxxxxRRRRRGGG  xxxxxxxxxxxxxxxx  x   xxxx     addr
//                cycle 1   0    |    10      RRRRRGGGGGGBBBBB  xxxxxxxxRRRRRGGG  x   addr     addr
//                cycle 2   x    |    0x      GGGBBBBBxxxxxxxx  RRRRRGGGGGGBBBBB  1   addr     addr+1
                
                if(vsync==1)begin
                    address <= 0;
                    address_next <= 0;
                    wr_hold <= 0;
                            end
                else begin
                    dout <={d_latch[10:7],d_latch[15:12],d_latch[4:1]}; 
                     address <= address_next;
                     we <= wr_hold[1];
                     wr_hold <= { wr_hold[0],(href & (~wr_hold[0]))};
                     d_latch <= { d_latch[7:0] , d};
                       
                       
                       if (wr_hold[1] == 1) begin
                        address_next <= address_next+1; 
                       end
                 end
   
        end            
    
endmodule
