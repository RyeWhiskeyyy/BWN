module	judge_tb;
parameter		CLASS_NUM=3			;
parameter		D_WL=16				;
reg  						clk     ;
reg  						rst_n   ;
reg  						in_valid;
reg  [CLASS_NUM*D_WL-1:0]	data    ;
wire  [1:0]					result  ;
wire  						o_valid  ;

judge #(
.CLASS_NUM				(CLASS_NUM),		
.D_WL					(D_WL	)
) inst1(
.clk					(clk     ),
.rst_n					(rst_n   ),
.in_valid				(in_valid),
.data					(data    ),
.result					(result  ),
.o_valid                (o_valid )
);

always #20 clk=~clk;

initial
begin
	clk=0;	
	rst_n = 1;
	in_valid =0;
	#10 rst_n = 0;
	#15 rst_n  = 1;
	#15 data = 48'h00fe07070f23;
		in_valid =1;
	#40 in_valid =0;
end
endmodule