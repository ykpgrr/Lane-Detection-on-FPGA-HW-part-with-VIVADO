`timescale 1ns / 1ps
 

module sobel_bitwise(clk,capt_addr,S_data,L_data,capt_we,bram_addr,bram_data,bram_we);


input clk;
input [18:0] capt_addr;
input [3:0] S_data;
input [3:0] L_data;
input capt_we;
output reg [18:0] bram_addr;
output reg [11:0] bram_data;
output reg bram_we;

wire [7:0] capt_data;

reg [17279:0] lb1 = 17279'b0;
reg [17279:0] lb2 = 17279'b0;

//wire [26:0] w1, w4, w7;
reg [26:0] w1,w2,w3,w4,w5,w6,w7,w8,w9;

wire [7:0] b1,b2,b3,b4;
wire [3:0] result;
reg [7:0] reg_result;
wire signed [7:0] b5;
reg prev_capt_we;
wire or_result;
wire [3:0] total_result;

    assign b1 = w1[3:0] - w3[3:0];
    assign b2 = (w4[3:0] << 1) - (w6[3:0]<<1);
    assign b3 = w7[3:0] - w9[3:0];
    assign b4 = b1 + b2;
    assign b5 = b3 + b4;

    always@(*)
    begin
        if(b5 < 0)
        begin
            reg_result = (b5 * -1);
        end else
        begin
            reg_result = b5;
        end
    end
    
    assign result = reg_result[3:0];
    assign or_result = reg_result[3]|w5[7];
    assign total_result = {or_result, or_result, or_result, or_result};
    
   
always @ (posedge clk) begin
    if (capt_we==1) begin
        w1 <= {capt_addr, S_data, L_data};
        w2 <= w1;
        w3 <= w2;
        w4 <= lb1[17279:17253];
        w5 <= w4;
        w6 <= w5;
        w7 <= lb2[17279:17253];
        w8 <= w7;
        w9 <= w8;
        lb1 <= {lb1[17252:0],capt_addr,S_data, L_data};
        lb2 <= {lb2[17252:0],lb1[17279:17253]};
    end
    prev_capt_we <= capt_we;
    if (prev_capt_we == 1) begin
        bram_data <= {total_result, total_result, total_result};
        bram_addr <= w6[26:8];
        bram_we <= 1;
    end 
    else begin
        bram_data <= 12'b0;
        bram_addr <= 19'b0;
        bram_we <= 0;
    end
    bram_we <= prev_capt_we;
end    
   
endmodule
