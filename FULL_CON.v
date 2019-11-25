`timescale 1ns / 1ps
module FULL_CON #(
  parameter CLASS_NUM = 30,
  parameter W_WL = 1,
  parameter INPUT_SIZE=162,
  parameter D_WL      =16,
  parameter FL        =8
)(
    input                       clk      ,
    input                       rst_n    ,
    input                       in_valid ,
    input [D_WL-1:0]            x        ,
	input [CLASS_NUM*W_WL-1:0]  f_w      ,
	input [CLASS_NUM*D_WL-1:0]  f_b      ,
    output                      o_valid  ,
    output [CLASS_NUM*D_WL-1:0] f_o      
);

//reg  [CLASS_NUM*W_WL-1:0]fw_buffer [0:INPUT_SIZE-1];
wire [CLASS_NUM-1:0] full_o_valid;
wire [CLASS_NUM-1:0] pe_ready_p;


 genvar j;
    generate
      for(j=0;j<CLASS_NUM;j=j+1)
      begin:full_connect_cell
        PE #(
          .INPUT_SIZE(INPUT_SIZE),
          .FL        (FL        ),
          .D_WL      (D_WL      ),
		  .W_WL      (W_WL      )
        )
        full_connect_cell
        (
           .clk     ( clk      ),
           .rst_n   ( rst_n    ),
           .x       ( x   ),
           .w       ( f_w[j]),
           .b       ( f_b[j*D_WL+D_WL-1:j*D_WL] ),
           .d_o     ( f_o[(CLASS_NUM-j)*D_WL-1:(CLASS_NUM-j-1)*D_WL] ),
                              
           .in_valid( in_valid       ),
           .o_valid ( full_o_valid[j]),
		   .ready   ( pe_ready_p[j] )
        );
      end  
    endgenerate 
    assign pe_ready = &pe_ready_p;
//	assign ready = pe_ready&fw_load_finish;
    assign o_valid = full_o_valid[0];    
    
endmodule
