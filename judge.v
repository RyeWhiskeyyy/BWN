module judge#(
parameter		CLASS_NUM = 3,
parameter		D_WL = 16 
)(
input							clk,
input							rst_n,
input							in_valid,
input	[CLASS_NUM*D_WL-1:0]	data,
output	[1:0]					result,
output	  reg 					o_valid
);

reg		[D_WL-1:0]				data1;
reg		[D_WL-1:0]				data2;
reg		[D_WL-1:0]				data3;
wire	[D_WL-1:0]				diff1;
wire	[D_WL-1:0]				diff2;
wire	[D_WL-1:0]				diff3;

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		data1<='b0;
		data2<='b0;
		data3<='b0;
	end
	else if(in_valid)
	begin
		data1<= data[D_WL-1:0];
		data2<= data[2*D_WL-1:D_WL];
		data3<= data[3*D_WL-1:2*D_WL];
	end
end

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		o_valid<='b0;
	else
		o_valid<=in_valid;
end

assign	diff1=data1-data2;
assign	diff2=data1-data3;
assign	diff3=data2-data3;

assign  result = (diff1[D_WL-1]=='b1)?((diff3[D_WL-1]=='b1)?(2'b11):(2'b10)):((diff2[D_WL-1]=='b1)?(2'b11):(2'b01));

endmodule
