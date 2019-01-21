`timescale 1ns / 1ps

module rgb2hls(d,L_out,S_out,addr,we,capt_addr,capt_we,clk);

input [11:0]d;
input[18:0] addr;
input we;
input clk;
wire [3:0] L;
reg  [3:0] S;
output reg [3:0] L_out;
output reg [3:0] S_out;
output reg [18:0]  capt_addr;
output reg capt_we;
reg [3:0] max;
reg[3:0] min;
wire [4:0] sub;
wire [4:0] L1;
wire [4:0] sum_maxmin;

always @(*) 
begin	
    if((d[11:8] >= d[7:4]) && (d[11:8] >= d[3:0])) 
        max <= d[11:8];
    else if((d[7:4] >= d[11:8]) && (d[7:4]>= d[3:0]))
        max <= d[7:4];
    else max <= d[3:0];
    
    if((d[11:8] <= d[7:4]) && (d[11:8] <= d[3:0])) 
        min <= d[11:8];
    else if((d[7:4]<= d[11:8]) && (d[7:4]<= d[3:0])) 
        min <= d[7:4];
    else
        min <= d[3:0];
end			

assign L1=((max+min)>>1); // L kanalýnýn hesaplanmasý (MAX+MÝN)/2
assign L=L1[3:0];

assign sub=max-min;         // bölme iþleminin üst kýsmý
assign sum_maxmin=max+min;

always @(*)
 begin

if (sub==0)
    S<=0;
else if (sum_maxmin==30)
	S<=4'd15;
else if (sum_maxmin==29)
	S<=4'd14;
else if (sum_maxmin==28)
    begin if(sub==2)
	 S<=4'd10;
	 end
else if (sum_maxmin==27)
    begin if (sub==2)
    S<=4'd8;
    else if (sub==4) 
	S<=4'd12;
	end
else if (sum_maxmin==26)
    begin if (sub==2)
    S<=4'd6;
    else if (sub==4)
	S<=4'd12;
	end   
else if (sum_maxmin==25)
	begin if (sub==5)
    S<=4'd14;
    else if (sub==3)
	S<=4'd8;
	else if (sub==1)
    S<=4'd6;
	end   
else if (sum_maxmin==24)
	begin if (sub==6)
    S<=4'd12;
    else if (sub==4)
	S<=4'd8;
	else if (sub==2)
    S<=4'd4;
	end  
else if (sum_maxmin==23)
	begin if (sub==7)
    S<=4'd13;
    else if (sub==5)
	S<=4'd9;
	else if (sub==3)
    S<=4'd5;
    else if (sub==1)
     S<=4'd1;
	end 
else if (sum_maxmin==22)
	begin if (sub==8)
    S<=4'd15;
    else if (sub==6)
	S<=4'd11;
	else if (sub==4)
    S<=4'd7;
    else if (sub==2)
    S<=4'd3;
    end
else if (sum_maxmin==21)
	begin if (sub==9)
    S<=4'd15;
    else if (sub==7)
	S<=4'd12;
	else if (sub==5)
    S<=4'd8;
    else if (sub==3)
    S<=4'd4;
    else if (sub==1)
    S<=4'd1;
     end
else if (sum_maxmin==20)
	begin if (sub==10)
    S<=4'd11;
    else if (sub==8)
	S<=4'd9;
	else if (sub==6)
    S<=4'd7;
    else if (sub==4)
    S<=4'd5;
    else if (sub==2)
    S<=4'd3;
    end
else if (sum_maxmin==19)
	begin if (sub==11)
    S<=4'd12;
    else if (sub==9)
	S<=4'd13;
	else if (sub==7)
    S<=4'd8;
    else if (sub==5)
    S<=4'd6;
    else if (sub==3)
    S<=4'd4;
    else if (sub==1)
    S<=4'd2;
    end
else if (sum_maxmin==18)
	begin if (sub==12)
    S<=4'd14;
    else if (sub==10)
	S<=4'd12;
	else if (sub==8)
    S<=4'd10;
    else if (sub==6)
    S<=4'd8;
    else if (sub==4)
    S<=4'd6;
    else if (sub==2)
    S<=4'd4;
    end
else if (sum_maxmin==17)
	S<=(sub);
else if (sum_maxmin==16)
	S<=(sub);
else if (sum_maxmin==15)
	S<=(sub);
else if (sum_maxmin==14)
	S<=(sub);
else if (sum_maxmin==13)
	S<=(sub);
else if (sum_maxmin==12)
	S<=(sub)+1;
else if (sum_maxmin==11)
	S<=(sub)+1;
else if (sum_maxmin==10)
	S<=(sub)+2;
else if (sum_maxmin==9)
	S<=(sub)+2;
else if (sum_maxmin==8)begin
      if (sub==8)
      S<=4'd15;
      else if (sub==6)
      S<=4'd12;
      else if (sub==4)
      S<=4'd8;
      else if(sub==2)
      S<=4'd4;
      end
else if (sum_maxmin==7)begin
     if (sub==7)
      S<=4'd14;
      else if (sub==5)
      S<=4'd10;
      else if (sub==3)
      S<=4'd6;
      else if(sub==1)
      S<=4'd2;
      end
else if (sum_maxmin==6)begin
      if (sub==4)
      S<=4'd8;
      else if (sub==2)
      S<=4'd4;
      end
else if (sum_maxmin==5)begin
	  if (sub==3)
      S<=4'd9;
      else if (sub==1)
      S<=4'd3;
      end
else if (sum_maxmin==4) begin
      if (sub==4)
      S<=4'd15;
      else if (sub==2)
      S<=4'd8;
      end
else if (sum_maxmin==3)
	  begin if (sub==3)
      S<=4'd15;
      else if (sub==1)
      S<=4'd5;
      end
else if (sum_maxmin==2)
     begin if (sub==2)
     S<=4'd15;
     end
else if (sum_maxmin==1)
	S<=4'd15;

end

always @(posedge clk)
begin
    L_out<=L;
    S_out<=S;
    capt_addr<=addr;
    capt_we<=we;
end 
endmodule
