


module semafor #(
parameter WIDTH = 6     // numar de biti pentru numarator de secvente
)
(
input   clk       , // ceas, 1 MHz
input   rst_n     , // reset asincron activ 1
input   buton     , //buton pietoni
output  rosu      , // rosu masini
output  galben    , //galben masini
output  verde     , //verde masini
output  rosu_p    , //rosu pietoni
output  verde_p     //verde pietoni
);

reg [WIDTH  -1:0]   num_secunde       ;
reg [WIDTH  -1:0]   num_secunde_val   ;
wire                num_secunde_zero  ;
wire                load_sec          ; // se incarca numaratorul cu valoarea secundelor ciclului               

reg [3      -1:0]   stare_prez        ;
reg [3      -1:0]   stare_viitoare    ;

reg                 buton_apasat      ;

localparam  ROSU_INIT     = 3'b000;
localparam  ROSU_CNT      = 3'b001;
localparam  GALBEN_INIT   = 3'b010;
localparam  GALBEN_CNT    = 3'b011;
localparam  VERDE_INIT    = 3'b100;
localparam  VERDE_CNT     = 3'b101;

// numarator de secunde presetabil
always @(posedge clk or negedge rst_n)
if (~rst_n)   num_secunde <= {WIDTH{1'b1}}; else
if (load_sec) num_secunde <= num_secunde_val; else
              num_secunde <= num_secunde - 1;

assign num_secunde_zero = ~|num_secunde;   // SAU-NU (=0)

// logica de stare
always @(*)
case (stare_prez)
ROSU_CNT    : stare_viitoare =  num_secunde_zero ?  VERDE_INIT  : ROSU_CNT;
VERDE_INIT  : stare_viitoare =  VERDE_CNT;
VERDE_CNT   : stare_viitoare =  num_secunde_zero ? (buton_apasat ? GALBEN_INIT : VERDE_CNT) : VERDE_CNT;
GALBEN_INIT : stare_viitoare =  GALBEN_CNT;
GALBEN_CNT  : stare_viitoare =  num_secunde_zero ?  ROSU_INIT   : GALBEN_CNT;
default     : stare_viitoare =  ROSU_CNT;      // ROSU_INIT
endcase

always @(*)
if(stare_prez == VERDE_CNT) begin
	if(buton) buton_apasat = 1; end
else buton_apasat = 0;

// registru de stare
always @(posedge clk or negedge rst_n)
if (~rst_n)   stare_prez <= ROSU_INIT; else
              stare_prez <= stare_viitoare;

// logica de iesire
always @(*)
  case (stare_prez)
  VERDE_INIT  : num_secunde_val =  'd60;
  GALBEN_INIT : num_secunde_val =  'd5 ;
  ROSU_INIT   : num_secunde_val =  'd30;
  default     : num_secunde_val =  'd0;
  endcase
  
assign load_sec   = (stare_prez == ROSU_INIT)   |
                    (stare_prez == GALBEN_INIT) |
                    (stare_prez == VERDE_INIT) ;

assign rosu   = (stare_prez == ROSU_INIT)     |
                (stare_prez == ROSU_CNT)      ;
assign galben = (stare_prez == GALBEN_INIT)   |
                (stare_prez == GALBEN_CNT)    ;
assign verde  = (stare_prez == VERDE_INIT)    |
                (stare_prez == VERDE_CNT)     ;
assign rosu_p = verde | galben;
assign verde_p=	rosu;			
                
endmodule
