/*
date:2018/5/8
公众号：小鱼FPGA
公众号上《基2频率FFT实现-verilog篇2》有例程讲解
*/

module fw_sram_4 #(
  parameter WIDTH_A = 12
)
(
   input [WIDTH_A-1:0] addr,
   
   output[2:0]  coef

);

       

wire [2:0] Coef [0:39];
assign Coef[0] = 'h7;
assign Coef[1] = 'h2;
assign Coef[2] = 'h6;
assign Coef[3] = 'h4;
assign Coef[4] = 'h0;
assign Coef[5] = 'h6;
assign Coef[6] = 'h2;
assign Coef[7] = 'h2;
assign Coef[8] = 'h5;
assign Coef[9] = 'h7;
assign Coef[10] = 'h5;
assign Coef[11] = 'h5;
assign Coef[12] = 'h6;
assign Coef[13] = 'h2;
assign Coef[14] = 'h2;
assign Coef[15] = 'h7;
assign Coef[16] = 'h7;
assign Coef[17] = 'h4;
assign Coef[18] = 'h5;
assign Coef[19] = 'h7;
assign Coef[20] = 'h3;
assign Coef[21] = 'h4;
assign Coef[22] = 'h7;
assign Coef[23] = 'h0;
assign Coef[24] = 'h2;
assign Coef[25] = 'h5;
assign Coef[26] = 'h2;
assign Coef[27] = 'h1;
assign Coef[28] = 'h4;
assign Coef[29] = 'h0;
assign Coef[30] = 'h7;
assign Coef[31] = 'h0;
assign Coef[32] = 'h4;
assign Coef[33] = 'h2;
assign Coef[34] = 'h1;
assign Coef[35] = 'h2;
assign Coef[36] = 'h7;
assign Coef[37] = 'h2;
assign Coef[38] = 'h6;
assign Coef[39] = 'h4;





assign   coef= Coef[addr];
endmodule