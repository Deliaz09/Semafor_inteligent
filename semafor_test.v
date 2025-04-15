

module semafor_test;
parameter WIDTH  =6 ;

wire clk       ;
wire rst_n     ;
reg  buton     ;
wire rosu      ;
wire galben    ;
wire verde     ;
wire rosu_p    ;
wire verde_p   ;

ck_rst_tb #(
.CK_SEMIPERIOD ('d10)
) i_ck_rst_tb (
.clk    (clk   ),
.rst_n  (rst_n )
);

initial begin
	buton <= 1'bx;
	@(negedge rst_n);
	@(posedge rst_n);
	@(posedge clk);
	buton <= 1'b0;
	repeat (65) @(posedge clk);
	buton <= 1'b1;
	@(posedge clk);
	buton <= 1'b0;
	repeat (80) @(posedge clk);
	buton <= 1'b1;
	@(posedge clk);
	buton <= 1'b0;
end

  
semafor #(
.WIDTH (WIDTH)
)  i_semafor (
.clk     (clk    ),
.rst_n   (rst_n  ),
.buton   (buton  ),
.rosu    (rosu   ),
.galben  (galben ),
.verde   (verde  ),
.rosu_p  (rosu_p ),
.verde_p (verde_p)
);

endmodule
