/*
date:2018/5/8
公众号：小鱼FPGA
公众号上《基2频率FFT实现-verilog篇2》有例程讲解
*/

module fB_sram_3 #(
  parameter WIDTH_A = 12
)
(
   input [WIDTH_A-1:0] addr,
   
   output[15:0]  coef

);  

wire [15:0] Coef [0:39];
assign Coef[0] = 'h0010;
assign Coef[1] = 'h0003;
assign Coef[2] = 'h0017;
assign Coef[3] = 'hfffc;
assign Coef[4] = 'hffe0;
assign Coef[5] = 'h003e;
assign Coef[6] = 'h0006;
assign Coef[7] = 'hfff7;
assign Coef[8] = 'hfff3;
assign Coef[9] = 'hfff6;
assign Coef[10] = 'hff7f;
assign Coef[11] = 'hffec;
assign Coef[12] = 'h000b;
assign Coef[13] = 'h001b;
assign Coef[14] = 'h008f;
assign Coef[15] = 'h0000;
assign Coef[16] = 'hffd6;
assign Coef[17] = 'h006b;
assign Coef[18] = 'hffca;
assign Coef[19] = 'hffcd;
assign Coef[20] = 'hffd5;
assign Coef[21] = 'h000e;
assign Coef[22] = 'hfff8;
assign Coef[23] = 'hffed;
assign Coef[24] = 'hffe7;
assign Coef[25] = 'hffef;
assign Coef[26] = 'hffd9;
assign Coef[27] = 'hffc7;
assign Coef[28] = 'hffb6;
assign Coef[29] = 'hffea;
assign Coef[30] = 'h0005;
assign Coef[31] = 'hfff4;
assign Coef[32] = 'h003a;
assign Coef[33] = 'hffd7;
assign Coef[34] = 'hff9a;
assign Coef[35] = 'hfffb;
assign Coef[36] = 'hffee;
assign Coef[37] = 'h0027;
assign Coef[38] = 'h0075;
assign Coef[39] = 'h0006;


assign   coef= Coef[addr];
endmodule