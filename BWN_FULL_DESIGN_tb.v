`timescale 1ns/1ns
module BWN_FULL_DESIGN_tb;
  parameter CLK_PERIOD  = 1500000 ;  //时钟频率1.5MHz
  parameter CLASS_NUM1  = 120    ;
  parameter CLASS_NUM2  = 80     ;
  parameter CLASS_NUM3  = 40     ;
  parameter CLASS_NUM4  = 3      ;
  parameter INPUT_SIZE1 = 1274   ;
  parameter INPUT_SIZE2 = 120    ;
  parameter INPUT_SIZE3 = 80     ;
  parameter INPUT_SIZE4 = 40     ;  
  parameter W_WL        = 1      ;
  parameter D_WL        = 16     ;
  parameter FL          = 8		 ;

reg    				clk          ;
reg   	 			rst_n        ;
reg    				in_valid     ;
reg [D_WL-1:0]      x_mem[0:INPUT_SIZE1-1];
wire  [1:0]			led       ;
reg   [11:0]		addr         ;


BWN_FULL_DESIGN #(
 .CLASS_NUM1     (CLASS_NUM1  ),
 .CLASS_NUM2     (CLASS_NUM2  ),
 .CLASS_NUM3     (CLASS_NUM3  ),
 .CLASS_NUM4     (CLASS_NUM4  ),
 .INPUT_SIZE1    (INPUT_SIZE1 ),
 .INPUT_SIZE2    (INPUT_SIZE2 ),
 .INPUT_SIZE3    (INPUT_SIZE3 ),
 .INPUT_SIZE4    (INPUT_SIZE4 ),
 .W_WL           (W_WL        ),
 .D_WL           (D_WL        ),
 .FL             (FL          )
 )BWN_FULL_DESIGN_inst(
  .clk           (clk         ),
  .rst_n         (rst_n       ),
  .in_valid      (in_valid    ),
  .data_in       (x_mem[addr] ),
  .led        	 (led         )
  );

always #(1000000000/(CLK_PERIOD*2)) clk=~clk;

initial begin
 $readmemh("E:\WORK\verilog_test\Network\BWN_3FC\verilog\data_unknown.txt",x_mem);
 end

initial begin
 clk = 0;
 rst_n = 0;
 in_valid = 0;
 #400
 rst_n = 1;
 in_valid = 1;
 # (INPUT_SIZE1*(1000000000/(CLK_PERIOD*2))*2)
 in_valid = 0;
end

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		addr<='h0;
	else if(in_valid) 
		addr<=addr+1'b1;
	else if(addr=='d1273)
		addr<='h0;
end
 
endmodule