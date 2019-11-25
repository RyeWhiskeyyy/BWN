`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/02 19:18:56
// Design Name: 
// Module Name: FULL_DESIGN
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


module FULL_DESIGN #(
  parameter CLK_Period  = 20000000  ,
  parameter Buad_Rate   = 115200    ,
  parameter CLASS_NUM1  = 120       ,
  parameter CLASS_NUM2  = 80        ,
  parameter CLASS_NUM3  = 40        ,
  parameter CLASS_NUM4  = 3         ,
  parameter INPUT_SIZE1 = 1274      ,
  parameter INPUT_SIZE2 = 120       ,
  parameter INPUT_SIZE3 = 80        ,
  parameter INPUT_SIZE4 = 40        ,  
  parameter W_WL        = 1         ,
  parameter D_WL        = 16        ,
  parameter FL          = 8
)(
    input                clk         ,
    input                rst_n       ,
    input                uart_rx     ,    
    output               o_valid     ,
    output               led              
);

wire                     f_in_valid ;
wire [D_WL-1:0]          feature_in ;
wire                     w_x_en     ;



Interface #(
   .CLK_Period(CLK_Period),//the unit is Hz 
   .Buad_Rate (Buad_Rate    ), //the unit is bits/s
   .D_WL      ( D_WL        ),
   .INPUT_SIZE( INPUT_SIZE1 )
)Interface_inst( 
     .clk      (clk      ),
     .rst_n    (rst_n    ),
     .w_x_en   (w_x_en   ),
	 .tx_data  (		 ),
	 .tx_en    (	     ),
     .uart_rx  (uart_rx  ),
     .uart_tx  ( 		 ),
          
     .d_o_valid(f_in_valid),
     .d_o      (feature_in )
);

BWN_FULL_DESIGN #(
  .CLASS_NUM1          (CLASS_NUM1 ),
  .CLASS_NUM2          (CLASS_NUM2 ),
  .CLASS_NUM3          (CLASS_NUM3 ),
  .CLASS_NUM4          (CLASS_NUM4 ),
  .INPUT_SIZE1         (INPUT_SIZE1),
  .INPUT_SIZE2         (INPUT_SIZE2),
  .INPUT_SIZE3         (INPUT_SIZE3),
  .INPUT_SIZE4         (INPUT_SIZE4),  
  .W_WL                (W_WL       ),
  .D_WL                (D_WL       ),
  .FL                  (FL         )
  )BWN_FULL_DESIGN_inst(
  .clk                 (clk 	   ),
  .rst_n               (rst_n      ),
  .in_valid            (f_in_valid ),
  .data_in             (feature_in ),
  .led                 (led		   )
  );

endmodule
