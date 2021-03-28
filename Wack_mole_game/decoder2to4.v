`timescale 1ns / 1ps

module decoder2to4 (
input [1:0] en,
output reg [3:0] an); 
always@(en) begin
 case (en)
//0: an=4'b1110;
//1: an=4'b1101;
//2: an=4'b1011;
//3: an=4'b0111;
0: an=4'b1000;
1: an=4'b0100;
2: an=4'b0010;
3: an=4'b0001;
 endcase
end
endmodule
