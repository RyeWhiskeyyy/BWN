/*
date:2018/5/8
公众号：小鱼FPGA
公众号上《基2频率FFT实现-verilog篇2》有例程讲解
*/

module fA_sram_3 #(
  parameter WIDTH_A = 12
)
(
   input [WIDTH_A-1:0] addr,
   
   output[15:0]  coef

);

       

wire [15:0] Coef [0:39];
assign Coef[0] = 'h0013;
assign Coef[1] = 'h0011;
assign Coef[2] = 'h0014;
assign Coef[3] = 'h000c;
assign Coef[4] = 'h0017;
assign Coef[5] = 'h0014;
assign Coef[6] = 'h0017;
assign Coef[7] = 'h0012;
assign Coef[8] = 'h000e;
assign Coef[9] = 'h0011;
assign Coef[10] = 'h001c;
assign Coef[11] = 'h0011;
assign Coef[12] = 'h0011;
assign Coef[13] = 'h0010;
assign Coef[14] = 'h001d;
assign Coef[15] = 'h0011;
assign Coef[16] = 'h0019;
assign Coef[17] = 'h000f;
assign Coef[18] = 'h0013;
assign Coef[19] = 'h0014;
assign Coef[20] = 'h001c;
assign Coef[21] = 'h0014;
assign Coef[22] = 'h000e;
assign Coef[23] = 'h000b;
assign Coef[24] = 'h0012;
assign Coef[25] = 'h000e;
assign Coef[26] = 'h001a;
assign Coef[27] = 'h000f;
assign Coef[28] = 'h001f;
assign Coef[29] = 'h000d;
assign Coef[30] = 'h0014;
assign Coef[31] = 'h0010;
assign Coef[32] = 'h0015;
assign Coef[33] = 'h001c;
assign Coef[34] = 'h001f;
assign Coef[35] = 'h0011;
assign Coef[36] = 'h0012;
assign Coef[37] = 'h000e;
assign Coef[38] = 'h0013;
assign Coef[39] = 'h0015;


assign   coef= Coef[addr];
endmodule