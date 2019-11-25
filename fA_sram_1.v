/*
date:2018/5/8
公众号：小鱼FPGA
公众号上《基2频率FFT实现-verilog篇2》有例程讲解
*/

module fA_sram_1 #(
  parameter WIDTH_A = 12
)
(
   input [WIDTH_A-1:0] addr,
   
   output[15:0]  coef

);

wire [15:0] Coef [0:119];
assign Coef[0] = 'h0001;
assign Coef[1] = 'h0001;
assign Coef[2] = 'h0005;
assign Coef[3] = 'h0002;
assign Coef[4] = 'h0002;
assign Coef[5] = 'h0007;
assign Coef[6] = 'h0001;
assign Coef[7] = 'h0001;
assign Coef[8] = 'h0001;
assign Coef[9] = 'h0001;
assign Coef[10] = 'h0004;
assign Coef[11] = 'h0004;
assign Coef[12] = 'h0001;
assign Coef[13] = 'h0001;
assign Coef[14] = 'h0002;
assign Coef[15] = 'h0001;
assign Coef[16] = 'h0001;
assign Coef[17] = 'h0001;
assign Coef[18] = 'h0001;
assign Coef[19] = 'h0002;
assign Coef[20] = 'h0003;
assign Coef[21] = 'h0001;
assign Coef[22] = 'h0001;
assign Coef[23] = 'h0001;
assign Coef[24] = 'h0003;
assign Coef[25] = 'h0002;
assign Coef[26] = 'h0001;
assign Coef[27] = 'h0002;
assign Coef[28] = 'h0003;
assign Coef[29] = 'h0001;
assign Coef[30] = 'h0004;
assign Coef[31] = 'h0002;
assign Coef[32] = 'h0001;
assign Coef[33] = 'h0004;
assign Coef[34] = 'h0001;
assign Coef[35] = 'h0002;
assign Coef[36] = 'h0002;
assign Coef[37] = 'h0004;
assign Coef[38] = 'h0002;
assign Coef[39] = 'h0002;
assign Coef[40] = 'h0003;
assign Coef[41] = 'h0003;
assign Coef[42] = 'h0003;
assign Coef[43] = 'h0001;
assign Coef[44] = 'h0003;
assign Coef[45] = 'h0001;
assign Coef[46] = 'h0003;
assign Coef[47] = 'h0003;
assign Coef[48] = 'h0004;
assign Coef[49] = 'h0001;
assign Coef[50] = 'h0001;
assign Coef[51] = 'h0001;
assign Coef[52] = 'h0001;
assign Coef[53] = 'h0001;
assign Coef[54] = 'h0003;
assign Coef[55] = 'h0001;
assign Coef[56] = 'h0005;
assign Coef[57] = 'h0001;
assign Coef[58] = 'h0002;
assign Coef[59] = 'h0001;
assign Coef[60] = 'h0001;
assign Coef[61] = 'h0001;
assign Coef[62] = 'h0002;
assign Coef[63] = 'h0001;
assign Coef[64] = 'h0001;
assign Coef[65] = 'h0001;
assign Coef[66] = 'h0001;
assign Coef[67] = 'h0004;
assign Coef[68] = 'h0001;
assign Coef[69] = 'h0004;
assign Coef[70] = 'h0004;
assign Coef[71] = 'h0001;
assign Coef[72] = 'h0001;
assign Coef[73] = 'h0002;
assign Coef[74] = 'h0003;
assign Coef[75] = 'h0001;
assign Coef[76] = 'h0003;
assign Coef[77] = 'h0003;
assign Coef[78] = 'h0001;
assign Coef[79] = 'h0002;
assign Coef[80] = 'h0001;
assign Coef[81] = 'h0001;
assign Coef[82] = 'h0001;
assign Coef[83] = 'h0001;
assign Coef[84] = 'h0001;
assign Coef[85] = 'h0003;
assign Coef[86] = 'h0004;
assign Coef[87] = 'h0001;
assign Coef[88] = 'h0003;
assign Coef[89] = 'h0001;
assign Coef[90] = 'h0001;
assign Coef[91] = 'h0001;
assign Coef[92] = 'h0001;
assign Coef[93] = 'h0003;
assign Coef[94] = 'h0004;
assign Coef[95] = 'h0001;
assign Coef[96] = 'h0003;
assign Coef[97] = 'h0002;
assign Coef[98] = 'h0001;
assign Coef[99] = 'h0002;
assign Coef[100] = 'h0001;
assign Coef[101] = 'h0005;
assign Coef[102] = 'h0003;
assign Coef[103] = 'h0001;
assign Coef[104] = 'h0002;
assign Coef[105] = 'h0003;
assign Coef[106] = 'h0004;
assign Coef[107] = 'h0001;
assign Coef[108] = 'h0003;
assign Coef[109] = 'h0001;
assign Coef[110] = 'h0003;
assign Coef[111] = 'h0001;
assign Coef[112] = 'h0003;
assign Coef[113] = 'h0003;
assign Coef[114] = 'h0002;
assign Coef[115] = 'h0002;
assign Coef[116] = 'h0001;
assign Coef[117] = 'h0002;
assign Coef[118] = 'h0001;
assign Coef[119] = 'h0003;

assign   coef= Coef[addr];
endmodule