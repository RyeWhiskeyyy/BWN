module BWN_FULL_DESIGN #(
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
  input               clk           ,
  input				  rst_n         ,
  input				  in_valid      ,
  input  [D_WL-1:0]   data_in       ,
  output  reg [1:0]      led         
  );

  wire fc1_to_ps_en;
  wire fc2_to_ps_en;
  wire fc3_to_ps_en;
  wire fc4_to_ps_en;
  wire ps1_to_bn_en;
  wire ps2_to_bn_en;
  wire ps3_to_bn_en;
  wire ps4_to_bn_en;
  wire fc1_to_relu_en;
  wire fc2_to_relu_en;
  wire fc3_to_relu_en;
  wire fc4_to_relu_en;
  wire fc1_to_bn_en;
  wire fc2_to_bn_en;
  wire fc3_to_bn_en;
  wire fc4_to_bn_en;
  wire relu_to_fc2_en;
  wire relu_to_fc3_en;
  wire relu_to_fc4_en;
  wire [1:0] result; 
  wire o_valid;
  
  wire [CLASS_NUM1*D_WL-1:0] fc1_to_ps_o;
  wire [CLASS_NUM2*D_WL-1:0] fc2_to_ps_o;
  wire [CLASS_NUM3*D_WL-1:0] fc3_to_ps_o;
  wire [CLASS_NUM4*D_WL-1:0] fc4_to_ps_o;
  wire [D_WL-1:0]           ps1_to_bn_o;
  wire [D_WL-1:0]           ps2_to_bn_o;
  wire [D_WL-1:0]           ps3_to_bn_o;
  wire [D_WL-1:0]           ps4_to_bn_o;
  wire [D_WL-1:0]           fc1_to_relu_o;  
  wire [D_WL-1:0]           fc2_to_relu_o;
  wire [D_WL-1:0]           fc3_to_relu_o;
  wire [D_WL-1:0]           fc4_to_relu_o;
  wire [D_WL-1:0]           relu_to_fc2_o;
  wire [D_WL-1:0]           relu_to_fc3_o;
  wire [D_WL-1:0]           relu_to_fc4_o;
  
 wire  [D_WL-1:0]            A_fc1         ;
 wire  [D_WL-1:0]            B_fc1         ;
 wire  [D_WL-1:0]            A_fc2         ;
 wire  [D_WL-1:0]            B_fc2         ;
 wire  [D_WL-1:0]            A_fc3         ;
 wire  [D_WL-1:0]            B_fc3         ;
 wire  [CLASS_NUM1*W_WL-1:0] f_w1          ;
 wire  [CLASS_NUM2*W_WL-1:0] f_w2          ;
 wire  [CLASS_NUM3*W_WL-1:0] f_w3          ;
 wire  [CLASS_NUM4*W_WL-1:0] f_w4          ;
 wire  [CLASS_NUM4*D_WL-1:0] f_b4          ;

assign f_b4=48'hfff4fff7000e;

reg [11:0]addr_1_w;
always @( posedge clk or negedge rst_n )
begin
  if(!rst_n )
    addr_1_w <= 'b0;
  else if(in_valid) 
    addr_1_w <= addr_1_w + 'b1; 
  else if(addr_1_w=='d1273) 
    addr_1_w <= 'd0;
end

fw_sram_1 weight1(
.addr           (addr_1_w),
.coef			(f_w1)
);


FULL_CON #(
  .CLASS_NUM     (CLASS_NUM1      ),
  .INPUT_SIZE    (INPUT_SIZE1     ),
  .D_WL          (D_WL            ),
  .W_WL          (W_WL            ),
  .FL            ( FL             )
)FULL_CON_INST1(
	.clk         ( clk            ),
	.rst_n       ( rst_n          ),
	.in_valid    ( in_valid       ),
	.x           ( data_in        ),
	.f_w         ( f_w1           ),
	.f_b         ( 1920'b0        ),
	
	.o_valid     ( fc1_to_ps_en   ),
	.f_o         ( fc1_to_ps_o    )
);

parallel_serial #(
  .CLASS_NUM                (CLASS_NUM1      ),
  .D_WL                     (D_WL            )
)parallel_serial_fc1(
	.clk                    ( clk            ),
	.rst_n                  ( rst_n          ),
	.parallel_serial_en     ( fc1_to_ps_en   ),
	.D_IN                   ( fc1_to_ps_o    ),
				            
	.o_valid                ( ps1_to_bn_en   ),
	.out                    ( ps1_to_bn_o    )       
);

reg [11:0]addr_1_A;
always @( posedge clk or negedge rst_n )
begin
  if(!rst_n )
    addr_1_A <= 'b0;
  else if(ps1_to_bn_en) 
    addr_1_A <= addr_1_A + 'b1; 
  else if(addr_1_A=='d119) 
    addr_1_A <= 'd0;
end

fA_sram_1 A1(
.addr           (addr_1_A),
.coef			(A_fc1)
);

reg [11:0]addr_1_B;
always @( posedge clk or negedge rst_n )
begin
  if(!rst_n )
    addr_1_B <= 'b0;
  else if(ps1_to_bn_en)
    addr_1_B <= addr_1_B + 'b1; 
  else if(addr_1_B=='d119) 
    addr_1_B <= 'd0;
end

fB_sram_1 B1(
.addr           (addr_1_B),
.coef			(B_fc1)
);

BN #(
  .D_WL          ( D_WL           ),
  .FL            ( FL             )
)PS_to_BN1(
	.CLK         ( clk            ),
	.rst_n       ( rst_n          ),
	.bn_en       ( ps1_to_bn_en    ),
	.A           ( A_fc1          ),
	.B           ( B_fc1          ),
	.D_IN        ( ps1_to_bn_o     ),
	
	.BN_o_valid  ( fc1_to_relu_en ),
	.D_O         ( fc1_to_relu_o  )       
);

relu #(
  .D_WL          ( D_WL           ),
  .FL            ( FL             )
)BN_to_relu1(
	.CLK         ( clk            ),
	.rst_n       ( rst_n          ),
	.relu_en     ( fc1_to_relu_en ),
	.data        ( fc1_to_relu_o  ),
	
	.relu_o_valid( relu_to_fc2_en ),
	.out         ( relu_to_fc2_o  )       
);

reg [11:0]addr_2_w;
always @( posedge clk or negedge rst_n )
begin
  if(!rst_n )
    addr_2_w <= 'b0;
  else if(relu_to_fc2_en) 
    addr_2_w <= addr_2_w + 'b1; 
  else if(addr_2_w=='d119) 
    addr_2_w <= 'd0;
end

fw_sram_2 weight2(
.addr           (addr_2_w),
.coef			(f_w2)
);


FULL_CON #(
  .CLASS_NUM     (CLASS_NUM2      ),
  .INPUT_SIZE    (INPUT_SIZE2     ),
  .D_WL          (D_WL            ),
  .W_WL          (W_WL            ),
  .FL            (FL              )
)FULL_CON_INST2(
	.clk         ( clk            ),
	.rst_n       ( rst_n          ),
	.in_valid    ( relu_to_fc2_en ),
	.x           ( relu_to_fc2_o  ),
	.f_w         ( f_w2           ),
	.f_b         (  1280'b0       ),
	
	.o_valid     ( fc2_to_ps_en   ),
	.f_o         ( fc2_to_ps_o    )
);

parallel_serial #(
  .CLASS_NUM                (CLASS_NUM2      ),
  .D_WL                     (D_WL            )
)parallel_serial_fc2(
	.clk                    ( clk            ),
	.rst_n                  ( rst_n          ),
	.parallel_serial_en     ( fc2_to_ps_en   ),
	.D_IN                   ( fc2_to_ps_o    ),
				            
	.o_valid                ( ps2_to_bn_en    ),
	.out                    ( ps2_to_bn_o     )       
);

reg [11:0]addr_2_A;
always @( posedge clk or negedge rst_n )
begin
  if(!rst_n )
    addr_2_A <= 'b0;
  else if(ps2_to_bn_en) 
    addr_2_A <= addr_2_A + 'b1; 
  else if(addr_2_A=='d79) 
    addr_2_A <= 'd0;
end

fA_sram_2 A2(
.addr           (addr_2_A),
.coef			(A_fc2)
);

reg [11:0]addr_2_B;
always @( posedge clk or negedge rst_n )
begin
  if(!rst_n )
    addr_2_B <= 'b0;
  else if(ps2_to_bn_en) 
    addr_2_B <= addr_2_B + 'b1; 
  else if(addr_2_B=='d79) 
    addr_2_B <= 'd0;
end

fB_sram_2 B2(
.addr           (addr_2_B),
.coef			(B_fc2)
);

BN #(
  .D_WL          (D_WL            ),
  .FL            ( FL             )
)PS_to_BN2(
	.CLK         ( clk            ),
	.rst_n       ( rst_n          ),
	.bn_en       ( ps2_to_bn_en   ),
	.A           ( A_fc2          ),
	.B           ( B_fc2          ),
	.D_IN        ( ps2_to_bn_o    ),
	
	.BN_o_valid  ( fc2_to_relu_en ),
	.D_O         ( fc2_to_relu_o  )       
);

relu #(
  .D_WL          ( D_WL           ),
  .FL            ( FL             )
)BN_to_relu2(
	.CLK         ( clk            ),
	.rst_n       ( rst_n          ),
	.relu_en     ( fc2_to_relu_en ),
	.data        ( fc2_to_relu_o  ),
	
	.relu_o_valid( relu_to_fc3_en ),
	.out         ( relu_to_fc3_o  )       
);

reg [11:0]addr_3_w;
always @( posedge clk or negedge rst_n )
begin
  if(!rst_n )
    addr_3_w <= 'b0;
  else if(relu_to_fc3_en) 
    addr_3_w <= addr_3_w + 'b1; 
  else if(addr_3_w=='d79) 
    addr_3_w <= 'd0;
end

fw_sram_3 weight3(
.addr           (addr_3_w),
.coef			(f_w3)
);

FULL_CON #(
  .CLASS_NUM     (CLASS_NUM3      ),
  .INPUT_SIZE    (INPUT_SIZE3     ),
  .D_WL          (D_WL            ),
  .W_WL          (W_WL            ),
  .FL            (FL              )
)FULL_CON_INST3(
	.clk         ( clk            ),
	.rst_n       ( rst_n          ),
	.in_valid    ( relu_to_fc3_en ),
	.x           ( relu_to_fc3_o  ),
	.f_w         ( f_w3           ),
	.f_b         ( 640'b0         ),
	
	.o_valid     ( fc3_to_ps_en   ),
	.f_o         ( fc3_to_ps_o    )
);

parallel_serial #(
  .CLASS_NUM                (CLASS_NUM3      ),
  .D_WL                     (D_WL            )
)parallel_serial_fc3(
	.clk                    ( clk            ),
	.rst_n                  ( rst_n          ),
	.parallel_serial_en     ( fc3_to_ps_en   ),
	.D_IN                   ( fc3_to_ps_o    ),
				            
	.o_valid                ( ps3_to_bn_en    ),
	.out                    ( ps3_to_bn_o     )       
);

reg [11:0]addr_3_A;
always @( posedge clk or negedge rst_n )
begin
  if(!rst_n )
    addr_3_A <= 'b0;
  else if(ps3_to_bn_en) 
    addr_3_A <= addr_3_A + 'b1; 
  else if(addr_3_A=='d39) 
    addr_3_A <= 'd0;
end

fA_sram_3 A3(
.addr           (addr_3_A),
.coef			(A_fc3)
);

reg [11:0]addr_3_B;
always @( posedge clk or negedge rst_n )
begin
  if(!rst_n )
    addr_3_B <= 'b0;
  else if(ps3_to_bn_en) 
    addr_3_B <= addr_3_B + 'b1; 
  else if(addr_3_B=='d39) 
    addr_3_B <= 'd0;
end

fB_sram_3 B3(
.addr           (addr_3_B),
.coef			(B_fc3)
);

BN #(
  .D_WL          (D_WL            ),
  .FL            ( FL             )
)PS_to_BN3(
	.CLK         ( clk            ),
	.rst_n       ( rst_n          ),
	.bn_en       ( ps3_to_bn_en   ),
	.A           ( A_fc3          ),
	.B           ( B_fc3          ),
	.D_IN        ( ps3_to_bn_o    ),
	
	.BN_o_valid  ( fc3_to_relu_en ),
	.D_O         ( fc3_to_relu_o  )       
);

relu #(
  .D_WL          ( D_WL           ),
  .FL            ( FL             )
)BN_to_relu3(
	.CLK         ( clk            ),
	.rst_n       ( rst_n          ),
	.relu_en     ( fc3_to_relu_en ),
	.data        ( fc3_to_relu_o  ),
	
	.relu_o_valid( relu_to_fc4_en ),
	.out         ( relu_to_fc4_o  )       
);

reg [11:0]addr_4_w;
always @( posedge clk or negedge rst_n )
begin
  if(!rst_n )
    addr_4_w <= 'b0;
  else if(relu_to_fc4_en) 
    addr_4_w <= addr_4_w + 'b1; 
  else if(addr_4_w=='d39) 
    addr_4_w <= 'd0;
end

fw_sram_4 weight4(
.addr           (addr_4_w),
.coef			(f_w4)
);

FULL_CON #(
  .CLASS_NUM     (CLASS_NUM4      ),
  .INPUT_SIZE    (INPUT_SIZE4     ),
  .W_WL          (W_WL            ),  
  .D_WL          (D_WL            ),
  .FL            (FL              )
)FULL_CON_INST4(
	.clk         ( clk            ),
	.rst_n       ( rst_n          ),
	.in_valid    ( relu_to_fc4_en ),
	.x           ( relu_to_fc4_o  ),
	.f_w         ( f_w4           ),
	.f_b         ( f_b4           ),
	
	.o_valid     ( fc4_to_ps_en   ),
	.f_o         ( fc4_to_ps_o    )	
);

judge #(
	.CLASS_NUM 	  (CLASS_NUM4),
	.D_WL 		  (D_WL)
)judge1(
.clk				(clk),
.rst_n				(rst_n),
.in_valid			(fc4_to_ps_en),
.data				(fc4_to_ps_o),
.result				(result),
.o_valid			(o_valid)
);

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		led<=2'b0;
	else if(o_valid)
		led <=result;
end
endmodule