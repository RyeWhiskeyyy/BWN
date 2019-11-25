`timescale		1ns/1ns
module baudrate_tb;
parameter		CLK_Period = 50000000;	//the unit is Hz
parameter		Buad_Rate  = 9600    ;	//the unit is bits/s
reg				clk;
reg				rst_n;
reg				enable;
wire			baud_clk;

always #(1000000000/CLK_Period/2) clk=~clk;

initial
begin
	clk = 0;
	rst_n = 0;
	enable = 0;
	#20
	rst_n = 1;
	enable = 1;
end

BuadRate_set #(
  .CLK_Period 		 (CLK_Period),
  .Buad_Rate         (Buad_Rate)
)BuadRate_set_inst (
  .clk               (clk)       ,
  .rst_n             (rst_n)     ,
  .enable            (enable)    ,
  .Buad_clk          (baud_clk)
);
endmodule