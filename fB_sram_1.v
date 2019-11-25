/*
date:2018/5/8
公众号：小鱼FPGA
公众号上《基2频率FFT实现-verilog篇2》有例程讲解
*/

module fB_sram_1 #(
  parameter WIDTH_A = 12
)
(
   input [WIDTH_A-1:0] addr,
   
   output[15:0]  coef

);

       

wire [15:0] Coef [0:119];
assign Coef[0] = 'h0066;
assign Coef[1] = 'hfef4;
assign Coef[2] = 'h0019;
assign Coef[3] = 'h0060;
assign Coef[4] = 'h0006;
assign Coef[5] = 'h0019;
assign Coef[6] = 'h0058;
assign Coef[7] = 'h006b;
assign Coef[8] = 'h00f1;
assign Coef[9] = 'h0044;
assign Coef[10] = 'hffcf;
assign Coef[11] = 'hff89;
assign Coef[12] = 'hfe5e;
assign Coef[13] = 'h0137;
assign Coef[14] = 'h005e;
assign Coef[15] = 'hfeb8;
assign Coef[16] = 'h0174;
assign Coef[17] = 'hff8c;
assign Coef[18] = 'h00c3;
assign Coef[19] = 'hff8d;
assign Coef[20] = 'h00f4;
assign Coef[21] = 'h00c5;
assign Coef[22] = 'h0035;
assign Coef[23] = 'h006f;
assign Coef[24] = 'hff82;
assign Coef[25] = 'h00af;
assign Coef[26] = 'h0034;
assign Coef[27] = 'hfea1;
assign Coef[28] = 'hff73;
assign Coef[29] = 'h00b2;
assign Coef[30] = 'h0061;
assign Coef[31] = 'hffdb;
assign Coef[32] = 'h00de;
assign Coef[33] = 'hffb1;
assign Coef[34] = 'h0070;
assign Coef[35] = 'h0038;
assign Coef[36] = 'h0127;
assign Coef[37] = 'hffad;
assign Coef[38] = 'hffcd;
assign Coef[39] = 'h0034;
assign Coef[40] = 'h003c;
assign Coef[41] = 'h0053;
assign Coef[42] = 'h00b7;
assign Coef[43] = 'h007e;
assign Coef[44] = 'h0021;
assign Coef[45] = 'hfdf8;
assign Coef[46] = 'h0026;
assign Coef[47] = 'h0048;
assign Coef[48] = 'h00a0;
assign Coef[49] = 'hfecf;
assign Coef[50] = 'hfecb;
assign Coef[51] = 'h00c9;
assign Coef[52] = 'hffd5;
assign Coef[53] = 'h010b;
assign Coef[54] = 'h0045;
assign Coef[55] = 'h000d;
assign Coef[56] = 'hffc3;
assign Coef[57] = 'hff06;
assign Coef[58] = 'h0004;
assign Coef[59] = 'h0047;
assign Coef[60] = 'h0111;
assign Coef[61] = 'h0123;
assign Coef[62] = 'hff3f;
assign Coef[63] = 'h0075;
assign Coef[64] = 'h0031;
assign Coef[65] = 'hffcf;
assign Coef[66] = 'h00b4;
assign Coef[67] = 'h002f;
assign Coef[68] = 'h0093;
assign Coef[69] = 'h0090;
assign Coef[70] = 'hff89;
assign Coef[71] = 'h0098;
assign Coef[72] = 'h004e;
assign Coef[73] = 'h007f;
assign Coef[74] = 'h00a8;
assign Coef[75] = 'h0029;
assign Coef[76] = 'hff89;
assign Coef[77] = 'h0032;
assign Coef[78] = 'hfdce;
assign Coef[79] = 'h004f;
assign Coef[80] = 'h008d;
assign Coef[81] = 'h0071;
assign Coef[82] = 'h0040;
assign Coef[83] = 'hffde;
assign Coef[84] = 'h000e;
assign Coef[85] = 'h0054;
assign Coef[86] = 'h003c;
assign Coef[87] = 'h0070;
assign Coef[88] = 'hff85;
assign Coef[89] = 'h008d;
assign Coef[90] = 'hff8a;
assign Coef[91] = 'h0107;
assign Coef[92] = 'hfe9a;
assign Coef[93] = 'h002c;
assign Coef[94] = 'hffcd;
assign Coef[95] = 'hffab;
assign Coef[96] = 'h008b;
assign Coef[97] = 'h0063;
assign Coef[98] = 'h0070;
assign Coef[99] = 'hffaf;
assign Coef[100] = 'hfff1;
assign Coef[101] = 'hffa9;
assign Coef[102] = 'hffa1;
assign Coef[103] = 'hff9e;
assign Coef[104] = 'hff48;
assign Coef[105] = 'hffcd;
assign Coef[106] = 'h000f;
assign Coef[107] = 'h0010;
assign Coef[108] = 'h0021;
assign Coef[109] = 'hff1f;
assign Coef[110] = 'h001b;
assign Coef[111] = 'h00fc;
assign Coef[112] = 'h0030;
assign Coef[113] = 'h007c;
assign Coef[114] = 'h0053;
assign Coef[115] = 'hffe7;
assign Coef[116] = 'h0041;
assign Coef[117] = 'h0028;
assign Coef[118] = 'h00d3;
assign Coef[119] = 'h0046;



assign   coef= Coef[addr];
endmodule