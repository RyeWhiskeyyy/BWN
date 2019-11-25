module BN #(
   parameter D_WL = 24,
   parameter FL = 16
)(D_IN,A,B,CLK,D_O,rst_n,bn_en,BN_o_valid
);
input CLK;
input signed [D_WL-1:0]D_IN;
input signed [D_WL-1:0]A;
input signed [D_WL-1:0]B;
input rst_n;
input bn_en;
output wire [D_WL-1:0]D_O;
output wire BN_o_valid;

reg signed [D_WL-1:0] D_IN_B;
reg signed [D_WL-1:0] A_B;
reg signed [D_WL-1:0] B_B;
reg signed [D_WL+D_WL-1:0] mul_next;
reg signed [D_WL-1:0] mul;
reg signed [D_WL-1:0] add;
reg signed [D_WL-1:0] add_next;
reg signed [D_WL-1:0] B_B1;
wire [D_WL-1:0]mul_next_round;
wire mul_next_sign;
reg signed [2:0] BN_o_valid_pp;
always @( posedge CLK or negedge rst_n)
  if( !rst_n )
    BN_o_valid_pp <= 'd0;
  else	  
    BN_o_valid_pp <= {BN_o_valid_pp[1:0],bn_en};

assign BN_o_valid = BN_o_valid_pp[2];

 always@(posedge CLK or negedge rst_n)
 begin 
    if (!rst_n)
	    D_IN_B <= 0;
	else if (bn_en)
	    D_IN_B <= D_IN;
 end
 
  always@(posedge CLK or negedge rst_n)   
 begin 
    if (!rst_n)
	    A_B <= 0;
	else if (bn_en)
	    A_B <= A;
 end
 
   always@(posedge CLK or negedge rst_n)   
 begin 
    if (!rst_n)
	    B_B1 <= 0;
	else if (bn_en)
	    B_B1 <= B;
 end
 
   always@(posedge CLK or negedge rst_n)
 begin 
    if (!rst_n)
	    B_B <= 0;
	else
	    B_B <= B_B1;
 end
 
   always@(posedge CLK or negedge rst_n) 
 begin 
    if (!rst_n)
	    mul<= 0;
	else
		begin
			mul[D_WL-1] <=mul_next_sign;
			mul[D_WL-2:0] <= mul_next_round[D_WL-2:0];
	    end
 end
 
    always@(posedge CLK or negedge rst_n)  
 begin 
    if (!rst_n)
	    add <= 0;
	else
	    add <= add_next;
 end
 
 always@(*)
 begin
   mul_next = D_IN_B*A_B;
 end 
 
 always@(*)
 begin
    add_next = mul+B_B;
 end 
 
 
 assign mul_next_round=(mul_next[FL-1])?(mul_next[D_WL+FL-2:FL]+1'b1):mul_next[D_WL+FL-2:FL];
 assign mul_next_sign=(mul_next_round[15])?'h0:mul_next[D_WL*2-1];
 assign D_O = add;

endmodule
    
    
    
    