`timescale 1ns / 1ps

module i2c_sender(
    input clk,
    output reg sioc,
    inout siod,
    input send,
    output reg taken,
    input [7:0]id,
    input [7:0]reg1,
    input [7:0]value);
       
reg  [7:0]  divider=8'b0000_0001;
reg  [31:0] busy_sr =0;
reg  [31:0] data_sr =1; //burayý kontrol et !!!
reg  siod1;

always@(busy_sr or data_sr[31])
begin
    if (busy_sr[11:10]==2'b10 || busy_sr[20:19]==2'b10 || busy_sr[29:28]==2'b10)
        siod1 <= 1'bz; 
    else  
        siod1 <=data_sr[31];
end

always@(posedge clk)
begin

    taken <=0;
    
    case (busy_sr[31:0]) //case1 baþlangýç
       2'b00: begin
              //sioc=1;
              case (send) //case2 baþlangýç 
                     1'b1: begin 
                         data_sr<= {3'b100, id,1'b0,reg1,1'b0,value,1'b0,2'b01};
                         busy_sr<= {3'b111,9'b111111111,9'b111111111,9'b111111111,2'b11};
                         taken  <= 1'b1;
                         end
                    default: divider=divider+1;
                endcase    //case2 bitiþ
                end
       default : begin     
                case ({busy_sr[31:29], busy_sr[2:0]})
                         6'b111_111: 
                                   begin 
                                   case (divider[7:6])
                                   2'b00:  sioc=1;  
                                   2'b01:  sioc=1;  
                                   2'b10:  sioc=1; 
                                   default: sioc=1; 
                                   endcase
                                   end
                          6'b111_110:
                                   begin
                                   case (divider[7:6])
                                   2'b00: sioc=1; 
                                   2'b01: sioc=1; 
                                   2'b10: sioc=1; 
                                   default: sioc=1;
                                   endcase
                                   end
                          6'b111_100:  
                                   begin
                                   case (divider[7:6])                
                                   2'b00: sioc=0; 
                                   2'b01: sioc=0; 
                                   2'b10: sioc=0; 
                                   default: sioc=0;  
                                   endcase
                                   end
                                   
                           6'b110_000:  
                                   begin                  
                                   case (divider[7:6])
                                   2'b00: sioc=0; 
                                   2'b01: sioc=1; 
                                   2'b10: sioc=1; 
                                   default: sioc=1; 
                                   endcase
                                   end
                                   
                           6'b100_000:  
                                 begin                                    
                                 case (divider[7:6])
                                 2'b00: sioc=1; 
                                 2'b01: sioc=1; 
                                 2'b10: sioc=1; 
                                 default: sioc=1;
                                 endcase
                                 end
                                  
                           6'b000_000:  
                                  begin                                     
                                  case (divider[7:6])             
                                  2'b00: sioc=1; 
                                  2'b01: sioc=1; 
                                  2'b10: sioc=1; 
                                  default: sioc=1; 
                                  endcase 
                                  end
                                   
                              default: 
                                   begin      
                                   case (divider[7:6])        
                                   2'b00: sioc=0; 
                                   2'b01: sioc=1; 
                                   2'b10: sioc=1; 
                                   default: sioc=0;  
                                   endcase
                                   end
                      endcase
              end     
     endcase            
    
    if (divider == 8'b1111_1111) 
    begin 
        busy_sr<={busy_sr[30:0],1'b0};
        data_sr<={data_sr[30:0],1'b1};
        divider<=0;
    end
    else  
    begin
        divider<=divider+1;           
    end          
end 

assign siod=siod1;  
    
endmodule
