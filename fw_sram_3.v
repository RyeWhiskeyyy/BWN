/*
date:2018/5/8
公众号：小鱼FPGA
公众号上《基2频率FFT实现-verilog篇2》有例程讲解
*/

module fw_sram_3 #(
  parameter WIDTH_A = 12
)
(
   input [WIDTH_A-1:0] addr,
   
   output[39:0]  coef

);

       

wire [39:0] Coef [0:79];
assign Coef[0] = 'hB9DDFBDFBF;
assign Coef[1] = 'h302628E0A3;
assign Coef[2] = 'hFFFFFBFFFD;
assign Coef[3] = 'hA501462643;
assign Coef[4] = 'hFB1EF2B74A;
assign Coef[5] = 'h00326808EA;
assign Coef[6] = 'h625579773F;
assign Coef[7] = 'hFDDDF7DF9F;
assign Coef[8] = 'h0222042002;
assign Coef[9] = 'h02024C2000;
assign Coef[10] = 'h0002002002;
assign Coef[11] = 'hDEEDD7DF95;
assign Coef[12] = 'h18020C0180;
assign Coef[13] = 'hCEDEC9B374;
assign Coef[14] = 'hBDDD77FF5D;
assign Coef[15] = 'hDDFFEBE7FD;
assign Coef[16] = 'hFDFDF7DFF9;
assign Coef[17] = 'hAD9DF656F3;
assign Coef[18] = 'hEE5FD7DF1F;
assign Coef[19] = 'hFFFDEFFF9D;
assign Coef[20] = 'hFECFD7D75F;
assign Coef[21] = 'hE30B1A2052;
assign Coef[22] = 'h6BD769378F;
assign Coef[23] = 'hFFFEFFDFFF;
assign Coef[24] = 'hFFFDF7DF8E;
assign Coef[25] = 'h040292A252;
assign Coef[26] = 'h3FFDDFD71F;
assign Coef[27] = 'hFFFDFFFF7D;
assign Coef[28] = 'hD8FC76DFEF;
assign Coef[29] = 'h8202780960;
assign Coef[30] = 'hDFF9FBFD9D;
assign Coef[31] = 'hF0208969C3;
assign Coef[32] = 'h00024C0080;
assign Coef[33] = 'hAD47028AC7;
assign Coef[34] = 'h14200400A0;
assign Coef[35] = 'hDFF8777FAD;
assign Coef[36] = 'hF1FDF74CE7;
assign Coef[37] = 'hCE9FCBFF7C;
assign Coef[38] = 'h2E20882022;
assign Coef[39] = 'h0826000982;
assign Coef[40] = 'hB1FDE1DFEF;
assign Coef[41] = 'h06024C0880;
assign Coef[42] = 'h56CFFF77BD;
assign Coef[43] = 'hE12008487A;
assign Coef[44] = 'hFBFF7FFF9F;
assign Coef[45] = 'h1408042083;
assign Coef[46] = 'h87BAE108B5;
assign Coef[47] = 'hFBF5FBF775;
assign Coef[48] = 'h7BEFBFD53E;
assign Coef[49] = 'h396C014CEB;
assign Coef[50] = 'hFFDFFFFF7F;
assign Coef[51] = 'hEAD7FBE31F;
assign Coef[52] = 'h32020400A2;
assign Coef[53] = 'h443135DEB2;
assign Coef[54] = 'hD9FDF3D5EF;
assign Coef[55] = 'h4043D48F05;
assign Coef[56] = 'h42260C2252;
assign Coef[57] = 'h00028C002A;
assign Coef[58] = 'h7BFF7FFF7D;
assign Coef[59] = 'hFFDDF6FFDF;
assign Coef[60] = 'h10802508A6;
assign Coef[61] = 'h1402040080;
assign Coef[62] = 'h060A0C40E4;
assign Coef[63] = 'hF5F5F7DF9F;
assign Coef[64] = 'h21212040E2;
assign Coef[65] = 'h0402082082;
assign Coef[66] = 'hF74BD6B65F;
assign Coef[67] = 'hFD9FFFDF7F;
assign Coef[68] = 'h0602402000;
assign Coef[69] = 'h77CDD2BF9F;
assign Coef[70] = 'hCFDF6AFD5C;
assign Coef[71] = 'h28461A2212;
assign Coef[72] = 'h14A0640080;
assign Coef[73] = 'h2396400052;
assign Coef[74] = 'h8CEC4B7EA5;
assign Coef[75] = 'h471A008054;
assign Coef[76] = 'h2413C0201C;
assign Coef[77] = 'hE3D700A04E;
assign Coef[78] = 'hCDDFD7975F;
assign Coef[79] = 'hF7CF5BD7FE;




assign   coef= Coef[addr];
endmodule