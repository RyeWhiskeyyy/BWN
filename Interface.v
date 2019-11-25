`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/04 21:38:25
// Design Name: 
// Module Name: Interface
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Interface #(
   parameter CLK_Period= 20000000 ,//the unit is Hz 
   parameter Buad_Rate = 115200   , //the unit is bits/s
   parameter D_WL      = 24       ,
   parameter INPUT_SIZE= 20       
)( 
     input              clk       ,
     input              rst_n     ,
     input              w_x_en    ,
     input              uart_rx   ,
	 input [7:0]        tx_data   ,
	 input              tx_en     ,
     output             uart_tx   ,
     output             d_o_valid ,
     output [D_WL-1:0]  d_o       
);
wire tx_finish;
wire [7:0] rx_data;
wire rx_finish;
  
UART #(
  .CLK_Period(CLK_Period),//the unit is Hz
  .Buad_Rate (Buad_Rate ) //the unit is bits/s
)UART_INST(
    .clk      (clk      ),
    .rst_n    (rst_n    ),
          
    .tx_data  (tx_data  ),
    .tx_en    (tx_en    ),
    .tx_finish(tx_finish),
    .uart_tx  (uart_tx  ),
            
    .uart_rx  (uart_rx  ),
    .rx_data  ( rx_data ),
    .rx_finish(rx_finish)
);                     



RAM #(
   .DEPTH   (INPUT_SIZE ),
   .WIDTH_A (12),
   .WIDTH_D (D_WL)
)RAM_INST(
   .clk     (clk ),
   .rst_n   (rst_n ),

   .w_addr  (cnt2  ) ,   
   .w_data  (data_rev) ,
   .w_en    (get_full_d ) ,

   .r_addr  (cnt3  ) ,
   .r_en    (  ) ,
   .r_data  ( d_o  )
);               
    
endmodule
