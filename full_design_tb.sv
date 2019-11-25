`timescale 1ns/1ns

module full_design_tb;
parameter  CLK_PERIOD=20000000;
parameter  TIME_STEP=3;
parameter  BAUD_RATE=115200;
parameter  INPUT_SIZE = 20;
parameter  UNITS_NUM  = 5;
parameter  CLASS_NUM  = 2 ;
parameter  D_WL       = 24;
parameter  FL         = 16;
reg       clk;
reg       rst_n;

reg[7:0]  tx_data;
reg       tx_en;

wire      result;
wire      o_valid;
//reg       d_ready;
wire      d_in;
wire tx_finish     ;
reg  tx_finish_d   ;
wire tx_finish_rise;
wire tx_finish_fall;

always #2 clk=~clk;

reg [7:0] x_in[0:INPUT_SIZE*TIME_STEP*3*33-1];
initial begin
   $readmemh("E:/deeplearning_python/LSTM/LSTM_V3.srcs/sources_1/imports/LSTM_NET_16K/useful/data.txt",x_in);
end

always @( posedge clk ) begin
  tx_finish_d<=tx_finish;
end

reg[13:0] addr;
assign tx_finish_rise=(!tx_finish_d)&tx_finish;
assign tx_finish_fall=(!tx_finish)&tx_finish_d;

initial begin
  clk  =0;
  rst_n=0;
  tx_en=0;
  #30;
  //d_ready=1'b1;
  rst_n=1;
end

always @( posedge clk )
  if( !rst_n )
    tx_en <= 1'b1;
  else 
    tx_en <= tx_finish;

always @( posedge clk )
  if( !rst_n )
    tx_data <= 'h00;
  else
    tx_data <= x_in[addr];

always @( posedge clk )
  if( !rst_n ) begin
    addr<='h0;
    //he<=1'b0;
  end
  else if(tx_finish_rise) begin
    addr<=addr+1'b1;
    //he<=1'b1;
  end


FULL_DESIGN # (
   .CLK_Period( CLK_PERIOD ),
   .TIME_STEP ( TIME_STEP  ),
   .Buad_Rate ( BAUD_RATE  ),
   .INPUT_SIZE( INPUT_SIZE ),  
   .UNITS_NUM ( UNITS_NUM  ),
   .CLASS_NUM ( CLASS_NUM  ),
   .D_WL      ( D_WL       ),
   .FL        ( FL         )

)full_design_inst(
    .clk    ( clk     ),
    .rst_n  ( rst_n   ),    
    .uart_rx( d_in ),
   // .d_ready( d_ready ), 
    .uart_tx(result_urat),
    .o_valid( o_valid ),
    .result    ( result     ) 
);                                
reg [7:0]rx_data;
UART #(
  .CLK_Period(CLK_PERIOD),//the unit is Hz
  .Buad_Rate(BAUD_RATE) //the unit is bits/s
)
UART_INST
(
    .clk       ( clk       ),
    .rst_n     ( rst_n     ),
                          
    .tx_data   ( tx_data   ),
    .tx_en     ( tx_en     ),
    .tx_finish ( tx_finish ),
    .uart_tx   ( d_in   ),
                          
    .uart_rx   ( result_urat  ),
    .rx_data   ( rx_data   ),
    .rx_finish ( rx_finish )
);                                         


endmodule


