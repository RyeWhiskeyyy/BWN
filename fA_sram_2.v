/*
date:2018/5/8
公众号：小鱼FPGA
公众号上《基2频率FFT实现-verilog篇2》有例程讲解
*/

module fA_sram_2 #(
  parameter WIDTH_A = 12
)
(
   input [WIDTH_A-1:0] addr,
   
   output[15:0]  coef

);
   

wire [15:0] Coef [0:79];
assign Coef[0] = 'h001e;
assign Coef[1] = 'h001f;
assign Coef[2] = 'h0024;
assign Coef[3] = 'h0022;
assign Coef[4] = 'h0018;
assign Coef[5] = 'h0018;
assign Coef[6] = 'h001a;
assign Coef[7] = 'h001a;
assign Coef[8] = 'h0027;
assign Coef[9] = 'h0022;
assign Coef[10] = 'h001c;
assign Coef[11] = 'h001e;
assign Coef[12] = 'h0021;
assign Coef[13] = 'h0014;
assign Coef[14] = 'h001e;
assign Coef[15] = 'h0017;
assign Coef[16] = 'h0026;
assign Coef[17] = 'h0015;
assign Coef[18] = 'h0019;
assign Coef[19] = 'h001f;
assign Coef[20] = 'h001a;
assign Coef[21] = 'h001c;
assign Coef[22] = 'h0014;
assign Coef[23] = 'h0019;
assign Coef[24] = 'h001d;
assign Coef[25] = 'h001c;
assign Coef[26] = 'h001b;
assign Coef[27] = 'h001b;
assign Coef[28] = 'h001e;
assign Coef[29] = 'h0018;
assign Coef[30] = 'h0017;
assign Coef[31] = 'h0015;
assign Coef[32] = 'h001f;
assign Coef[33] = 'h0013;
assign Coef[34] = 'h001e;
assign Coef[35] = 'h001c;
assign Coef[36] = 'h001e;
assign Coef[37] = 'h001c;
assign Coef[38] = 'h0020;
assign Coef[39] = 'h001a;
assign Coef[40] = 'h001c;
assign Coef[41] = 'h0021;
assign Coef[42] = 'h0016;
assign Coef[43] = 'h0024;
assign Coef[44] = 'h0018;
assign Coef[45] = 'h001f;
assign Coef[46] = 'h0022;
assign Coef[47] = 'h001d;
assign Coef[48] = 'h0017;
assign Coef[49] = 'h001b;
assign Coef[50] = 'h001e;
assign Coef[51] = 'h0021;
assign Coef[52] = 'h001c;
assign Coef[53] = 'h0014;
assign Coef[54] = 'h0016;
assign Coef[55] = 'h0015;
assign Coef[56] = 'h001b;
assign Coef[57] = 'h001e;
assign Coef[58] = 'h0019;
assign Coef[59] = 'h0017;
assign Coef[60] = 'h0016;
assign Coef[61] = 'h0026;
assign Coef[62] = 'h001b;
assign Coef[63] = 'h0020;
assign Coef[64] = 'h0025;
assign Coef[65] = 'h0020;
assign Coef[66] = 'h001d;
assign Coef[67] = 'h001b;
assign Coef[68] = 'h0021;
assign Coef[69] = 'h001c;
assign Coef[70] = 'h001b;
assign Coef[71] = 'h0018;
assign Coef[72] = 'h0018;
assign Coef[73] = 'h001e;
assign Coef[74] = 'h001b;
assign Coef[75] = 'h001e;
assign Coef[76] = 'h001f;
assign Coef[77] = 'h001a;
assign Coef[78] = 'h001d;
assign Coef[79] = 'h001b;


assign   coef= Coef[addr];
endmodule