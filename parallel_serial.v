module parallel_serial #(
	parameter  D_WL      = 24,
	parameter  CLASS_NUM = 2 
)(D_IN,rst_n,clk,parallel_serial_en,out,o_valid);

input [CLASS_NUM*D_WL-1:0] D_IN;
input rst_n;
input clk;
input parallel_serial_en;
output reg [D_WL-1:0] out;
output reg o_valid;

reg [CLASS_NUM*D_WL-1:0] D_IN_B;
reg [7:0]cnt;
reg [D_WL-1:0] out_B;
reg flag;

always @(posedge clk or negedge rst_n)
begin
	if (!rst_n)
	begin
		D_IN_B <= 0;
		cnt<=0;
	end
	else if (parallel_serial_en == 'b1) 
		D_IN_B <= D_IN;
	else if (!flag)
	begin
		D_IN_B <=0;
		cnt <=0;
	end
	else
	begin 
		cnt <= cnt+'b1;
		D_IN_B <= D_IN_B>>D_WL;
	end
end 

always @(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		flag <= 0;
	else if(parallel_serial_en=='b1)
		flag <= 'b1;
	else if (cnt==CLASS_NUM-1)
		flag <=0;
end

always @(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		out <= 0;
	else  
		out <= out_B;
end

always @(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		out_B <= 0;
	else  
		out_B <= D_IN_B[D_WL-1:0];
end

always @(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		o_valid <= 0;
	else if(cnt == 0)
		o_valid <= 0;
	else
		o_valid<='b1;
end


endmodule