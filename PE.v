module PE #(
  parameter INPUT_SIZE=226,
  parameter FL=12,
  parameter D_WL=16,
  parameter W_WL=1  
)(
   input                 clk,
   input                 rst_n,
   input [D_WL-1:0]      x,
   input [W_WL-1:0]      w,
   input [D_WL-1:0]      b,
   output  [D_WL-1:0]    d_o,

   input                 in_valid,
   output wire            o_valid,
   output wire           ready
);                             

reg [11:0] cnt;
wire signed [D_WL+1:0] add_result;
wire signed [D_WL+1:0] x_reg;
wire signed [D_WL+1:0] b_reg;
reg signed [D_WL+1:0] d_o_reg;

assign x_reg = (x[D_WL-1]==1'b1)?({{2{1'b1}},x}):({{2{1'b0}},x});
assign add_result=(w=='b1)?(~x_reg+'b1):x_reg;
assign b_reg = (b[D_WL-1]==1'b1)?({{2{1'b1}},b}):({{2{1'b0}},b});

always @( posedge clk or negedge rst_n) 
  if( !rst_n )
    cnt<='h0;
  else if( cnt==INPUT_SIZE )	  
      cnt<='b0;
  else if(in_valid)
      cnt<=cnt+'b1;	    
  
always @( posedge clk or negedge rst_n)
	if( !rst_n )
		d_o_reg<=0;
	else 
		begin
		    if (in_valid)
			if( cnt=='h0 )
			  d_o_reg <= b_reg+add_result;
			else
			  d_o_reg <= d_o_reg+add_result;
		end
		
assign ready = (cnt==INPUT_SIZE)?'d0:'d1;
assign o_valid = ~ready;
wire neg_overflow;
wire pose_overflow;
assign neg_overflow=d_o_reg[D_WL]&d_o_reg[D_WL-1];
assign pose_overflow=d_o_reg[D_WL]|d_o_reg[D_WL-1];
assign d_o = (d_o_reg[D_WL+1])?
							((neg_overflow)?({d_o_reg[D_WL+1],d_o_reg[D_WL-2:0]}):({d_o_reg[D_WL+1],{(D_WL-1){1'b0}}})):
							((pose_overflow)?({d_o_reg[D_WL+1],{(D_WL-1){1'b1}}}):({d_o_reg[D_WL+1],d_o_reg[D_WL-2:0]}));
endmodule	 