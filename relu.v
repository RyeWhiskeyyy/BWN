module relu #(
   parameter D_WL = 24,
   parameter FL = 16
)(data,CLK,out,rst_n,relu_en,relu_o_valid
);
input CLK;
input [D_WL-1:0]data;
input rst_n;
input relu_en;
output wire [D_WL-1:0]out;
output wire relu_o_valid;

reg [D_WL-1:0] max;
reg [D_WL-1:0] max_next;

 always@(posedge CLK or negedge rst_n)  
 begin 
    if (!rst_n)
	    max <= 0;
	else if (relu_en == 'd1 )
	    max <= max_next;
 end

 always@(*)
 begin
    if (data[D_WL-1] == 1)
	    max_next = 0;
	else 
	    max_next = data;
 end 

reg [5:0] relu_o_valid_p;
always @( posedge CLK or negedge rst_n)
  if(!rst_n)
    relu_o_valid_p <= 6'b000000;
  else	  
    relu_o_valid_p <= {relu_o_valid_p[4:0],relu_en};

assign relu_o_valid = relu_o_valid_p[0];

assign out = max;
endmodule