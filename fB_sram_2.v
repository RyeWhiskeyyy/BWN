/*
date:2018/5/8
公众号：小鱼FPGA
公众号上《基2频率FFT实现-verilog篇2》有例程讲解
*/

module fB_sram_2 #(
  parameter WIDTH_A = 12
)
(
   input [WIDTH_A-1:0] addr,
   
   output[15:0]  coef

);


wire [15:0] Coef [0:79];
assign Coef[0] = 'hfe0d;
assign Coef[1] = 'h000f;
assign Coef[2] = 'hff71;
assign Coef[3] = 'hff5b;
assign Coef[4] = 'hffb2;
assign Coef[5] = 'h0017;
assign Coef[6] = 'hfead;
assign Coef[7] = 'h0129;
assign Coef[8] = 'h007c;
assign Coef[9] = 'h0070;
assign Coef[10] = 'h0035;
assign Coef[11] = 'h0083;
assign Coef[12] = 'h0091;
assign Coef[13] = 'hff87;
assign Coef[14] = 'hff4e;
assign Coef[15] = 'hff99;
assign Coef[16] = 'h0057;
assign Coef[17] = 'h0061;
assign Coef[18] = 'h00b6;
assign Coef[19] = 'hfee5;
assign Coef[20] = 'h00a0;
assign Coef[21] = 'hffc1;
assign Coef[22] = 'h0155;
assign Coef[23] = 'hff38;
assign Coef[24] = 'hfed0;
assign Coef[25] = 'hfff5;
assign Coef[26] = 'hff2e;
assign Coef[27] = 'hfee3;
assign Coef[28] = 'hfeff;
assign Coef[29] = 'h00a5;
assign Coef[30] = 'hff37;
assign Coef[31] = 'h0042;
assign Coef[32] = 'h00c8;
assign Coef[33] = 'h0138;
assign Coef[34] = 'h00a0;
assign Coef[35] = 'h0008;
assign Coef[36] = 'hfeec;
assign Coef[37] = 'hffd0;
assign Coef[38] = 'hffd2;
assign Coef[39] = 'h0021;
assign Coef[40] = 'h003e;
assign Coef[41] = 'h00df;
assign Coef[42] = 'hff01;
assign Coef[43] = 'hff27;
assign Coef[44] = 'hfde8;
assign Coef[45] = 'h0018;
assign Coef[46] = 'h00a4;
assign Coef[47] = 'hff06;
assign Coef[48] = 'hff47;
assign Coef[49] = 'h0074;
assign Coef[50] = 'hfe49;
assign Coef[51] = 'hff9c;
assign Coef[52] = 'h000a;
assign Coef[53] = 'h0099;
assign Coef[54] = 'hff34;
assign Coef[55] = 'h0143;
assign Coef[56] = 'hffd0;
assign Coef[57] = 'h010e;
assign Coef[58] = 'hff6f;
assign Coef[59] = 'hfe91;
assign Coef[60] = 'h00a5;
assign Coef[61] = 'h0042;
assign Coef[62] = 'h0058;
assign Coef[63] = 'h0070;
assign Coef[64] = 'hff6e;
assign Coef[65] = 'h00a6;
assign Coef[66] = 'hff7d;
assign Coef[67] = 'hfd7d;
assign Coef[68] = 'h0092;
assign Coef[69] = 'hffc0;
assign Coef[70] = 'hff0a;
assign Coef[71] = 'h0045;
assign Coef[72] = 'h00c7;
assign Coef[73] = 'h004b;
assign Coef[74] = 'hff47;
assign Coef[75] = 'h0032;
assign Coef[76] = 'hffbc;
assign Coef[77] = 'h00ba;
assign Coef[78] = 'h0054;
assign Coef[79] = 'hfeba;


assign   coef= Coef[addr];
endmodule