module CSR(
  input         clock,
  input         reset,
  input         io_stall,
  input  [2:0]  io_cmd,
  input  [31:0] io_in,
  output [31:0] io_out,
  input  [31:0] io_pc,
  input  [31:0] io_addr,
  input  [31:0] io_inst,
  input         io_illegal,
  input  [1:0]  io_st_type,
  input  [2:0]  io_ld_type,
  input         io_pc_check,
  output        io_expt,
  output [31:0] io_evec,
  output [31:0] io_epc
);
  reg [31:0] time$; // @[CSR.scala 104:25]
  reg [31:0] _RAND_0;
  reg [31:0] timeh; // @[CSR.scala 105:25]
  reg [31:0] _RAND_1;
  reg [31:0] cycle; // @[CSR.scala 106:25]
  reg [31:0] _RAND_2;
  reg [31:0] cycleh; // @[CSR.scala 107:25]
  reg [31:0] _RAND_3;
  reg [31:0] instret; // @[CSR.scala 108:25]
  reg [31:0] _RAND_4;
  reg [31:0] instreth; // @[CSR.scala 109:25]
  reg [31:0] _RAND_5;
  reg [1:0] PRV; // @[CSR.scala 118:21]
  reg [31:0] _RAND_6;
  reg [1:0] PRV1; // @[CSR.scala 119:21]
  reg [31:0] _RAND_7;
  reg  IE; // @[CSR.scala 122:20]
  reg [31:0] _RAND_8;
  reg  IE1; // @[CSR.scala 123:20]
  reg [31:0] _RAND_9;
  reg  MTIP; // @[CSR.scala 139:21]
  reg [31:0] _RAND_10;
  reg  MTIE; // @[CSR.scala 142:21]
  reg [31:0] _RAND_11;
  reg  MSIP; // @[CSR.scala 145:21]
  reg [31:0] _RAND_12;
  reg  MSIE; // @[CSR.scala 148:21]
  reg [31:0] _RAND_13;
  reg [31:0] mtimecmp; // @[CSR.scala 154:21]
  reg [31:0] _RAND_14;
  reg [31:0] mscratch; // @[CSR.scala 156:21]
  reg [31:0] _RAND_15;
  reg [31:0] mepc; // @[CSR.scala 158:17]
  reg [31:0] _RAND_16;
  reg [31:0] mcause; // @[CSR.scala 159:19]
  reg [31:0] _RAND_17;
  reg [31:0] mbadaddr; // @[CSR.scala 160:21]
  reg [31:0] _RAND_18;
  wire [11:0] csr_addr; // @[CSR.scala 100:25]
  wire [4:0] rs1_addr; // @[CSR.scala 101:25]
  wire [2:0] _T_90; // @[Cat.scala 30:58]
  wire [3:0] _T_91; // @[Cat.scala 30:58]
  wire [2:0] _T_92; // @[Cat.scala 30:58]
  wire [5:0] _T_94; // @[Cat.scala 30:58]
  wire [9:0] _T_95; // @[Cat.scala 30:58]
  wire [31:0] mstatus; // @[Cat.scala 30:58]
  wire [1:0] _T_114; // @[Cat.scala 30:58]
  wire [3:0] _T_115; // @[Cat.scala 30:58]
  wire [24:0] _T_117; // @[Cat.scala 30:58]
  wire [25:0] _T_118; // @[Cat.scala 30:58]
  wire [27:0] _T_119; // @[Cat.scala 30:58]
  wire [31:0] mip; // @[Cat.scala 30:58]
  wire [1:0] _T_124; // @[Cat.scala 30:58]
  wire [3:0] _T_125; // @[Cat.scala 30:58]
  wire [24:0] _T_127; // @[Cat.scala 30:58]
  wire [25:0] _T_128; // @[Cat.scala 30:58]
  wire [27:0] _T_129; // @[Cat.scala 30:58]
  wire [31:0] mie; // @[Cat.scala 30:58]
  wire  _T_139; // @[Lookup.scala 9:38]
  wire  _T_143; // @[Lookup.scala 9:38]
  wire  _T_147; // @[Lookup.scala 9:38]
  wire  _T_151; // @[Lookup.scala 9:38]
  wire  _T_155; // @[Lookup.scala 9:38]
  wire  _T_159; // @[Lookup.scala 9:38]
  wire  _T_163; // @[Lookup.scala 9:38]
  wire  _T_167; // @[Lookup.scala 9:38]
  wire  _T_171; // @[Lookup.scala 9:38]
  wire  _T_175; // @[Lookup.scala 9:38]
  wire  _T_179; // @[Lookup.scala 9:38]
  wire  _T_183; // @[Lookup.scala 9:38]
  wire  _T_187; // @[Lookup.scala 9:38]
  wire  _T_191; // @[Lookup.scala 9:38]
  wire  _T_195; // @[Lookup.scala 9:38]
  wire  _T_199; // @[Lookup.scala 9:38]
  wire  _T_203; // @[Lookup.scala 9:38]
  wire  _T_207; // @[Lookup.scala 9:38]
  wire  _T_211; // @[Lookup.scala 9:38]
  wire  _T_215; // @[Lookup.scala 9:38]
  wire  _T_219; // @[Lookup.scala 9:38]
  wire  _T_223; // @[Lookup.scala 9:38]
  wire  _T_227; // @[Lookup.scala 9:38]
  wire  _T_231; // @[Lookup.scala 9:38]
  wire  _T_235; // @[Lookup.scala 9:38]
  wire  _T_239; // @[Lookup.scala 9:38]
  wire  _T_243; // @[Lookup.scala 9:38]
  wire [31:0] _T_244; // @[Lookup.scala 11:37]
  wire [31:0] _T_245; // @[Lookup.scala 11:37]
  wire [31:0] _T_246; // @[Lookup.scala 11:37]
  wire [31:0] _T_247; // @[Lookup.scala 11:37]
  wire [31:0] _T_248; // @[Lookup.scala 11:37]
  wire [31:0] _T_249; // @[Lookup.scala 11:37]
  wire [31:0] _T_250; // @[Lookup.scala 11:37]
  wire [31:0] _T_251; // @[Lookup.scala 11:37]
  wire [31:0] _T_252; // @[Lookup.scala 11:37]
  wire [31:0] _T_253; // @[Lookup.scala 11:37]
  wire [31:0] _T_254; // @[Lookup.scala 11:37]
  wire [31:0] _T_255; // @[Lookup.scala 11:37]
  wire [31:0] _T_256; // @[Lookup.scala 11:37]
  wire [31:0] _T_257; // @[Lookup.scala 11:37]
  wire [31:0] _T_258; // @[Lookup.scala 11:37]
  wire [31:0] _T_259; // @[Lookup.scala 11:37]
  wire [31:0] _T_260; // @[Lookup.scala 11:37]
  wire [31:0] _T_261; // @[Lookup.scala 11:37]
  wire [31:0] _T_262; // @[Lookup.scala 11:37]
  wire [31:0] _T_263; // @[Lookup.scala 11:37]
  wire [31:0] _T_264; // @[Lookup.scala 11:37]
  wire [31:0] _T_265; // @[Lookup.scala 11:37]
  wire [31:0] _T_266; // @[Lookup.scala 11:37]
  wire [31:0] _T_267; // @[Lookup.scala 11:37]
  wire [31:0] _T_268; // @[Lookup.scala 11:37]
  wire [31:0] _T_269; // @[Lookup.scala 11:37]
  wire [31:0] _T_270; // @[Lookup.scala 11:37]
  wire [1:0] _T_271; // @[CSR.scala 203:27]
  wire  privValid; // @[CSR.scala 203:34]
  wire  privInst; // @[CSR.scala 204:26]
  wire  _T_272; // @[CSR.scala 205:40]
  wire  _T_274; // @[CSR.scala 205:31]
  wire  _T_275; // @[CSR.scala 205:28]
  wire  _T_276; // @[CSR.scala 205:56]
  wire  _T_278; // @[CSR.scala 205:47]
  wire  isEcall; // @[CSR.scala 205:44]
  wire  _T_280; // @[CSR.scala 206:28]
  wire  isEbreak; // @[CSR.scala 206:44]
  wire  isEret; // @[CSR.scala 207:44]
  wire  _T_397; // @[CSR.scala 208:61]
  wire  _T_398; // @[CSR.scala 208:61]
  wire  _T_399; // @[CSR.scala 208:61]
  wire  _T_400; // @[CSR.scala 208:61]
  wire  _T_401; // @[CSR.scala 208:61]
  wire  _T_402; // @[CSR.scala 208:61]
  wire  _T_403; // @[CSR.scala 208:61]
  wire  _T_404; // @[CSR.scala 208:61]
  wire  _T_405; // @[CSR.scala 208:61]
  wire  _T_406; // @[CSR.scala 208:61]
  wire  _T_407; // @[CSR.scala 208:61]
  wire  _T_408; // @[CSR.scala 208:61]
  wire  _T_409; // @[CSR.scala 208:61]
  wire  _T_410; // @[CSR.scala 208:61]
  wire  _T_411; // @[CSR.scala 208:61]
  wire  _T_412; // @[CSR.scala 208:61]
  wire  _T_413; // @[CSR.scala 208:61]
  wire  _T_414; // @[CSR.scala 208:61]
  wire  _T_415; // @[CSR.scala 208:61]
  wire  _T_416; // @[CSR.scala 208:61]
  wire  _T_417; // @[CSR.scala 208:61]
  wire  _T_418; // @[CSR.scala 208:61]
  wire  _T_419; // @[CSR.scala 208:61]
  wire  _T_420; // @[CSR.scala 208:61]
  wire  _T_421; // @[CSR.scala 208:61]
  wire  csrValid; // @[CSR.scala 208:61]
  wire [1:0] _T_422; // @[CSR.scala 209:27]
  wire [1:0] _T_423; // @[CSR.scala 209:36]
  wire  _T_425; // @[CSR.scala 209:36]
  wire  _T_426; // @[CSR.scala 209:53]
  wire  _T_427; // @[CSR.scala 209:41]
  wire  _T_428; // @[CSR.scala 209:79]
  wire  csrRO; // @[CSR.scala 209:67]
  wire  _T_429; // @[CSR.scala 210:26]
  wire  _T_430; // @[CSR.scala 210:45]
  wire  _T_432; // @[CSR.scala 210:61]
  wire  _T_433; // @[CSR.scala 210:49]
  wire  wen; // @[CSR.scala 210:36]
  wire [31:0] _T_435; // @[CSR.scala 213:22]
  wire [31:0] _T_436; // @[CSR.scala 214:24]
  wire [31:0] _T_437; // @[CSR.scala 214:22]
  wire  _T_438; // @[Mux.scala 46:19]
  wire [31:0] _T_439; // @[Mux.scala 46:16]
  wire  _T_440; // @[Mux.scala 46:19]
  wire [31:0] _T_441; // @[Mux.scala 46:16]
  wire  _T_442; // @[Mux.scala 46:19]
  wire [31:0] wdata; // @[Mux.scala 46:16]
  wire  _T_443; // @[CSR.scala 216:44]
  wire  iaddrInvalid; // @[CSR.scala 216:34]
  wire [1:0] _T_498; // @[CSR.scala 218:29]
  wire  _T_500; // @[CSR.scala 218:36]
  wire  _T_501; // @[CSR.scala 218:65]
  wire  _T_503; // @[Mux.scala 46:19]
  wire  _T_504; // @[Mux.scala 46:16]
  wire  _T_505; // @[Mux.scala 46:19]
  wire  _T_506; // @[Mux.scala 46:16]
  wire  _T_507; // @[Mux.scala 46:19]
  wire  laddrInvalid; // @[Mux.scala 46:16]
  wire  _T_513; // @[Mux.scala 46:19]
  wire  _T_514; // @[Mux.scala 46:16]
  wire  _T_515; // @[Mux.scala 46:19]
  wire  saddrInvalid; // @[Mux.scala 46:16]
  wire  _T_516; // @[CSR.scala 221:25]
  wire  _T_517; // @[CSR.scala 221:41]
  wire  _T_518; // @[CSR.scala 221:57]
  wire [1:0] _T_519; // @[CSR.scala 222:20]
  wire  _T_521; // @[CSR.scala 222:27]
  wire  _T_523; // @[CSR.scala 222:35]
  wire  _T_525; // @[CSR.scala 222:48]
  wire  _T_526; // @[CSR.scala 222:45]
  wire  _T_527; // @[CSR.scala 222:31]
  wire  _T_528; // @[CSR.scala 221:73]
  wire  _T_529; // @[CSR.scala 222:67]
  wire  _T_530; // @[CSR.scala 222:60]
  wire  _T_533; // @[CSR.scala 223:24]
  wire  _T_534; // @[CSR.scala 222:76]
  wire  _T_535; // @[CSR.scala 223:39]
  wire  _T_536; // @[CSR.scala 223:50]
  wire [7:0] _GEN_216; // @[CSR.scala 224:27]
  wire [7:0] _T_537; // @[CSR.scala 224:27]
  wire [31:0] _GEN_217; // @[CSR.scala 224:20]
  wire [32:0] _T_538; // @[CSR.scala 224:20]
  wire [31:0] _T_539; // @[CSR.scala 224:20]
  wire [32:0] _T_541; // @[CSR.scala 228:16]
  wire [31:0] _T_542; // @[CSR.scala 228:16]
  wire [31:0] _T_543; // @[CSR.scala 229:13]
  wire  _T_545; // @[CSR.scala 229:13]
  wire [32:0] _T_547; // @[CSR.scala 229:36]
  wire [31:0] _T_548; // @[CSR.scala 229:36]
  wire [31:0] _GEN_0; // @[CSR.scala 229:19]
  wire [32:0] _T_550; // @[CSR.scala 230:18]
  wire [31:0] _T_551; // @[CSR.scala 230:18]
  wire [31:0] _T_552; // @[CSR.scala 231:14]
  wire  _T_554; // @[CSR.scala 231:14]
  wire [32:0] _T_556; // @[CSR.scala 231:39]
  wire [31:0] _T_557; // @[CSR.scala 231:39]
  wire [31:0] _GEN_1; // @[CSR.scala 231:20]
  wire  _T_559; // @[CSR.scala 232:27]
  wire  _T_561; // @[CSR.scala 232:52]
  wire  _T_562; // @[CSR.scala 232:61]
  wire  _T_563; // @[CSR.scala 232:72]
  wire  _T_564; // @[CSR.scala 232:48]
  wire  _T_566; // @[CSR.scala 232:88]
  wire  isInstRet; // @[CSR.scala 232:85]
  wire [32:0] _T_568; // @[CSR.scala 233:40]
  wire [31:0] _T_569; // @[CSR.scala 233:40]
  wire [31:0] _GEN_2; // @[CSR.scala 233:19]
  wire [31:0] _T_570; // @[CSR.scala 234:29]
  wire  _T_572; // @[CSR.scala 234:29]
  wire  _T_573; // @[CSR.scala 234:18]
  wire [32:0] _T_575; // @[CSR.scala 234:58]
  wire [31:0] _T_576; // @[CSR.scala 234:58]
  wire [31:0] _GEN_3; // @[CSR.scala 234:35]
  wire [29:0] _T_579; // @[CSR.scala 238:23]
  wire [31:0] _GEN_218; // @[CSR.scala 238:28]
  wire [31:0] _T_580; // @[CSR.scala 238:28]
  wire [3:0] _GEN_219; // @[CSR.scala 242:47]
  wire [4:0] _T_587; // @[CSR.scala 242:47]
  wire [3:0] _T_588; // @[CSR.scala 242:47]
  wire [1:0] _T_589; // @[CSR.scala 243:20]
  wire [3:0] _T_590; // @[CSR.scala 242:20]
  wire [3:0] _T_591; // @[CSR.scala 241:20]
  wire [3:0] _T_592; // @[CSR.scala 240:20]
  wire [3:0] _T_593; // @[CSR.scala 239:20]
  wire  _T_595; // @[CSR.scala 248:25]
  wire  _T_596; // @[CSR.scala 248:41]
  wire [31:0] _GEN_4; // @[CSR.scala 248:58]
  wire  _T_598; // @[CSR.scala 255:21]
  wire [1:0] _T_599; // @[CSR.scala 256:22]
  wire  _T_600; // @[CSR.scala 257:22]
  wire [1:0] _T_601; // @[CSR.scala 258:22]
  wire  _T_602; // @[CSR.scala 259:22]
  wire  _T_603; // @[CSR.scala 261:26]
  wire  _T_604; // @[CSR.scala 262:22]
  wire  _T_606; // @[CSR.scala 265:26]
  wire  _T_609; // @[CSR.scala 269:26]
  wire  _T_610; // @[CSR.scala 270:26]
  wire  _T_611; // @[CSR.scala 271:26]
  wire  _T_612; // @[CSR.scala 272:26]
  wire  _T_613; // @[CSR.scala 273:26]
  wire [31:0] _T_615; // @[CSR.scala 273:56]
  wire [34:0] _GEN_220; // @[CSR.scala 273:63]
  wire [34:0] _T_617; // @[CSR.scala 273:63]
  wire  _T_618; // @[CSR.scala 274:26]
  wire [31:0] _T_620; // @[CSR.scala 274:60]
  wire  _T_621; // @[CSR.scala 275:26]
  wire  _T_622; // @[CSR.scala 278:26]
  wire  _T_623; // @[CSR.scala 279:26]
  wire  _T_624; // @[CSR.scala 280:26]
  wire  _T_625; // @[CSR.scala 281:26]
  wire  _T_626; // @[CSR.scala 282:26]
  wire  _T_627; // @[CSR.scala 283:26]
  wire [31:0] _GEN_5; // @[CSR.scala 283:45]
  wire [31:0] _GEN_6; // @[CSR.scala 282:42]
  wire [31:0] _GEN_7; // @[CSR.scala 282:42]
  wire [31:0] _GEN_8; // @[CSR.scala 281:43]
  wire [31:0] _GEN_9; // @[CSR.scala 281:43]
  wire [31:0] _GEN_10; // @[CSR.scala 281:43]
  wire [31:0] _GEN_11; // @[CSR.scala 280:44]
  wire [31:0] _GEN_12; // @[CSR.scala 280:44]
  wire [31:0] _GEN_13; // @[CSR.scala 280:44]
  wire [31:0] _GEN_14; // @[CSR.scala 280:44]
  wire [31:0] _GEN_15; // @[CSR.scala 279:41]
  wire [31:0] _GEN_16; // @[CSR.scala 279:41]
  wire [31:0] _GEN_17; // @[CSR.scala 279:41]
  wire [31:0] _GEN_18; // @[CSR.scala 279:41]
  wire [31:0] _GEN_19; // @[CSR.scala 279:41]
  wire [31:0] _GEN_20; // @[CSR.scala 278:42]
  wire [31:0] _GEN_21; // @[CSR.scala 278:42]
  wire [31:0] _GEN_22; // @[CSR.scala 278:42]
  wire [31:0] _GEN_23; // @[CSR.scala 278:42]
  wire [31:0] _GEN_24; // @[CSR.scala 278:42]
  wire [31:0] _GEN_25; // @[CSR.scala 278:42]
  wire [31:0] _GEN_26; // @[CSR.scala 275:44]
  wire [31:0] _GEN_27; // @[CSR.scala 275:44]
  wire [31:0] _GEN_28; // @[CSR.scala 275:44]
  wire [31:0] _GEN_29; // @[CSR.scala 275:44]
  wire [31:0] _GEN_30; // @[CSR.scala 275:44]
  wire [31:0] _GEN_31; // @[CSR.scala 275:44]
  wire [31:0] _GEN_32; // @[CSR.scala 275:44]
  wire [31:0] _GEN_33; // @[CSR.scala 274:42]
  wire [31:0] _GEN_34; // @[CSR.scala 274:42]
  wire [31:0] _GEN_35; // @[CSR.scala 274:42]
  wire [31:0] _GEN_36; // @[CSR.scala 274:42]
  wire [31:0] _GEN_37; // @[CSR.scala 274:42]
  wire [31:0] _GEN_38; // @[CSR.scala 274:42]
  wire [31:0] _GEN_39; // @[CSR.scala 274:42]
  wire [31:0] _GEN_40; // @[CSR.scala 274:42]
  wire [34:0] _GEN_41; // @[CSR.scala 273:40]
  wire [31:0] _GEN_42; // @[CSR.scala 273:40]
  wire [31:0] _GEN_43; // @[CSR.scala 273:40]
  wire [31:0] _GEN_44; // @[CSR.scala 273:40]
  wire [31:0] _GEN_45; // @[CSR.scala 273:40]
  wire [31:0] _GEN_46; // @[CSR.scala 273:40]
  wire [31:0] _GEN_47; // @[CSR.scala 273:40]
  wire [31:0] _GEN_48; // @[CSR.scala 273:40]
  wire [31:0] _GEN_49; // @[CSR.scala 273:40]
  wire [31:0] _GEN_50; // @[CSR.scala 272:44]
  wire [34:0] _GEN_51; // @[CSR.scala 272:44]
  wire [31:0] _GEN_52; // @[CSR.scala 272:44]
  wire [31:0] _GEN_53; // @[CSR.scala 272:44]
  wire [31:0] _GEN_54; // @[CSR.scala 272:44]
  wire [31:0] _GEN_55; // @[CSR.scala 272:44]
  wire [31:0] _GEN_56; // @[CSR.scala 272:44]
  wire [31:0] _GEN_57; // @[CSR.scala 272:44]
  wire [31:0] _GEN_58; // @[CSR.scala 272:44]
  wire [31:0] _GEN_59; // @[CSR.scala 272:44]
  wire [31:0] _GEN_60; // @[CSR.scala 271:44]
  wire [31:0] _GEN_61; // @[CSR.scala 271:44]
  wire [34:0] _GEN_62; // @[CSR.scala 271:44]
  wire [31:0] _GEN_63; // @[CSR.scala 271:44]
  wire [31:0] _GEN_64; // @[CSR.scala 271:44]
  wire [31:0] _GEN_65; // @[CSR.scala 271:44]
  wire [31:0] _GEN_66; // @[CSR.scala 271:44]
  wire [31:0] _GEN_67; // @[CSR.scala 271:44]
  wire [31:0] _GEN_68; // @[CSR.scala 271:44]
  wire [31:0] _GEN_69; // @[CSR.scala 271:44]
  wire [31:0] _GEN_70; // @[CSR.scala 271:44]
  wire [31:0] _GEN_71; // @[CSR.scala 270:42]
  wire [31:0] _GEN_72; // @[CSR.scala 270:42]
  wire [31:0] _GEN_73; // @[CSR.scala 270:42]
  wire [34:0] _GEN_74; // @[CSR.scala 270:42]
  wire [31:0] _GEN_75; // @[CSR.scala 270:42]
  wire [31:0] _GEN_76; // @[CSR.scala 270:42]
  wire [31:0] _GEN_77; // @[CSR.scala 270:42]
  wire [31:0] _GEN_78; // @[CSR.scala 270:42]
  wire [31:0] _GEN_79; // @[CSR.scala 270:42]
  wire [31:0] _GEN_80; // @[CSR.scala 270:42]
  wire [31:0] _GEN_81; // @[CSR.scala 270:42]
  wire [31:0] _GEN_82; // @[CSR.scala 269:41]
  wire [31:0] _GEN_83; // @[CSR.scala 269:41]
  wire [31:0] _GEN_84; // @[CSR.scala 269:41]
  wire [31:0] _GEN_85; // @[CSR.scala 269:41]
  wire [34:0] _GEN_86; // @[CSR.scala 269:41]
  wire [31:0] _GEN_87; // @[CSR.scala 269:41]
  wire [31:0] _GEN_88; // @[CSR.scala 269:41]
  wire [31:0] _GEN_89; // @[CSR.scala 269:41]
  wire [31:0] _GEN_90; // @[CSR.scala 269:41]
  wire [31:0] _GEN_91; // @[CSR.scala 269:41]
  wire [31:0] _GEN_92; // @[CSR.scala 269:41]
  wire  _GEN_93; // @[CSR.scala 265:39]
  wire  _GEN_94; // @[CSR.scala 265:39]
  wire [31:0] _GEN_95; // @[CSR.scala 265:39]
  wire [31:0] _GEN_96; // @[CSR.scala 265:39]
  wire [31:0] _GEN_97; // @[CSR.scala 265:39]
  wire [31:0] _GEN_98; // @[CSR.scala 265:39]
  wire [34:0] _GEN_99; // @[CSR.scala 265:39]
  wire [31:0] _GEN_100; // @[CSR.scala 265:39]
  wire [31:0] _GEN_101; // @[CSR.scala 265:39]
  wire [31:0] _GEN_102; // @[CSR.scala 265:39]
  wire [31:0] _GEN_103; // @[CSR.scala 265:39]
  wire [31:0] _GEN_104; // @[CSR.scala 265:39]
  wire [31:0] _GEN_105; // @[CSR.scala 265:39]
  wire  _GEN_106; // @[CSR.scala 261:39]
  wire  _GEN_107; // @[CSR.scala 261:39]
  wire  _GEN_108; // @[CSR.scala 261:39]
  wire  _GEN_109; // @[CSR.scala 261:39]
  wire [31:0] _GEN_110; // @[CSR.scala 261:39]
  wire [31:0] _GEN_111; // @[CSR.scala 261:39]
  wire [31:0] _GEN_112; // @[CSR.scala 261:39]
  wire [31:0] _GEN_113; // @[CSR.scala 261:39]
  wire [34:0] _GEN_114; // @[CSR.scala 261:39]
  wire [31:0] _GEN_115; // @[CSR.scala 261:39]
  wire [31:0] _GEN_116; // @[CSR.scala 261:39]
  wire [31:0] _GEN_117; // @[CSR.scala 261:39]
  wire [31:0] _GEN_118; // @[CSR.scala 261:39]
  wire [31:0] _GEN_119; // @[CSR.scala 261:39]
  wire [31:0] _GEN_120; // @[CSR.scala 261:39]
  wire [1:0] _GEN_121; // @[CSR.scala 255:38]
  wire  _GEN_122; // @[CSR.scala 255:38]
  wire [1:0] _GEN_123; // @[CSR.scala 255:38]
  wire  _GEN_124; // @[CSR.scala 255:38]
  wire  _GEN_125; // @[CSR.scala 255:38]
  wire  _GEN_126; // @[CSR.scala 255:38]
  wire  _GEN_127; // @[CSR.scala 255:38]
  wire  _GEN_128; // @[CSR.scala 255:38]
  wire [31:0] _GEN_129; // @[CSR.scala 255:38]
  wire [31:0] _GEN_130; // @[CSR.scala 255:38]
  wire [31:0] _GEN_131; // @[CSR.scala 255:38]
  wire [31:0] _GEN_132; // @[CSR.scala 255:38]
  wire [34:0] _GEN_133; // @[CSR.scala 255:38]
  wire [31:0] _GEN_134; // @[CSR.scala 255:38]
  wire [31:0] _GEN_135; // @[CSR.scala 255:38]
  wire [31:0] _GEN_136; // @[CSR.scala 255:38]
  wire [31:0] _GEN_137; // @[CSR.scala 255:38]
  wire [31:0] _GEN_138; // @[CSR.scala 255:38]
  wire [31:0] _GEN_139; // @[CSR.scala 255:38]
  wire [1:0] _GEN_140; // @[CSR.scala 254:21]
  wire  _GEN_141; // @[CSR.scala 254:21]
  wire [1:0] _GEN_142; // @[CSR.scala 254:21]
  wire  _GEN_143; // @[CSR.scala 254:21]
  wire  _GEN_144; // @[CSR.scala 254:21]
  wire  _GEN_145; // @[CSR.scala 254:21]
  wire  _GEN_146; // @[CSR.scala 254:21]
  wire  _GEN_147; // @[CSR.scala 254:21]
  wire [31:0] _GEN_148; // @[CSR.scala 254:21]
  wire [31:0] _GEN_149; // @[CSR.scala 254:21]
  wire [31:0] _GEN_150; // @[CSR.scala 254:21]
  wire [31:0] _GEN_151; // @[CSR.scala 254:21]
  wire [34:0] _GEN_152; // @[CSR.scala 254:21]
  wire [31:0] _GEN_153; // @[CSR.scala 254:21]
  wire [31:0] _GEN_154; // @[CSR.scala 254:21]
  wire [31:0] _GEN_155; // @[CSR.scala 254:21]
  wire [31:0] _GEN_156; // @[CSR.scala 254:21]
  wire [31:0] _GEN_157; // @[CSR.scala 254:21]
  wire [31:0] _GEN_158; // @[CSR.scala 254:21]
  wire [1:0] _GEN_159; // @[CSR.scala 249:24]
  wire  _GEN_160; // @[CSR.scala 249:24]
  wire [1:0] _GEN_161; // @[CSR.scala 249:24]
  wire  _GEN_162; // @[CSR.scala 249:24]
  wire  _GEN_163; // @[CSR.scala 249:24]
  wire  _GEN_164; // @[CSR.scala 249:24]
  wire  _GEN_165; // @[CSR.scala 249:24]
  wire  _GEN_166; // @[CSR.scala 249:24]
  wire [31:0] _GEN_167; // @[CSR.scala 249:24]
  wire [31:0] _GEN_168; // @[CSR.scala 249:24]
  wire [31:0] _GEN_169; // @[CSR.scala 249:24]
  wire [31:0] _GEN_170; // @[CSR.scala 249:24]
  wire [34:0] _GEN_171; // @[CSR.scala 249:24]
  wire [31:0] _GEN_172; // @[CSR.scala 249:24]
  wire [31:0] _GEN_173; // @[CSR.scala 249:24]
  wire [31:0] _GEN_174; // @[CSR.scala 249:24]
  wire [31:0] _GEN_175; // @[CSR.scala 249:24]
  wire [31:0] _GEN_176; // @[CSR.scala 249:24]
  wire [31:0] _GEN_177; // @[CSR.scala 249:24]
  wire [34:0] _GEN_178; // @[CSR.scala 237:19]
  wire [31:0] _GEN_179; // @[CSR.scala 237:19]
  wire [1:0] _GEN_180; // @[CSR.scala 237:19]
  wire  _GEN_181; // @[CSR.scala 237:19]
  wire [1:0] _GEN_182; // @[CSR.scala 237:19]
  wire  _GEN_183; // @[CSR.scala 237:19]
  wire [31:0] _GEN_184; // @[CSR.scala 237:19]
  wire  _GEN_185; // @[CSR.scala 237:19]
  wire  _GEN_186; // @[CSR.scala 237:19]
  wire  _GEN_187; // @[CSR.scala 237:19]
  wire  _GEN_188; // @[CSR.scala 237:19]
  wire [31:0] _GEN_189; // @[CSR.scala 237:19]
  wire [31:0] _GEN_190; // @[CSR.scala 237:19]
  wire [31:0] _GEN_191; // @[CSR.scala 237:19]
  wire [31:0] _GEN_192; // @[CSR.scala 237:19]
  wire [31:0] _GEN_193; // @[CSR.scala 237:19]
  wire [31:0] _GEN_194; // @[CSR.scala 237:19]
  wire [31:0] _GEN_195; // @[CSR.scala 237:19]
  wire [31:0] _GEN_196; // @[CSR.scala 237:19]
  wire [34:0] _GEN_197; // @[CSR.scala 236:19]
  wire [31:0] _GEN_198; // @[CSR.scala 236:19]
  wire [1:0] _GEN_199; // @[CSR.scala 236:19]
  wire  _GEN_200; // @[CSR.scala 236:19]
  wire [1:0] _GEN_201; // @[CSR.scala 236:19]
  wire  _GEN_202; // @[CSR.scala 236:19]
  wire [31:0] _GEN_203; // @[CSR.scala 236:19]
  wire  _GEN_204; // @[CSR.scala 236:19]
  wire  _GEN_205; // @[CSR.scala 236:19]
  wire  _GEN_206; // @[CSR.scala 236:19]
  wire  _GEN_207; // @[CSR.scala 236:19]
  wire [31:0] _GEN_208; // @[CSR.scala 236:19]
  wire [31:0] _GEN_209; // @[CSR.scala 236:19]
  wire [31:0] _GEN_210; // @[CSR.scala 236:19]
  wire [31:0] _GEN_211; // @[CSR.scala 236:19]
  wire [31:0] _GEN_212; // @[CSR.scala 236:19]
  wire [31:0] _GEN_213; // @[CSR.scala 236:19]
  wire [31:0] _GEN_214; // @[CSR.scala 236:19]
  wire [31:0] _GEN_215; // @[CSR.scala 236:19]
  assign csr_addr = io_inst[31:20]; // @[CSR.scala 100:25]
  assign rs1_addr = io_inst[19:15]; // @[CSR.scala 101:25]
  assign _T_90 = {IE1,PRV}; // @[Cat.scala 30:58]
  assign _T_91 = {_T_90,IE}; // @[Cat.scala 30:58]
  assign _T_92 = {1'h0,PRV1}; // @[Cat.scala 30:58]
  assign _T_94 = {3'h0,_T_92}; // @[Cat.scala 30:58]
  assign _T_95 = {_T_94,_T_91}; // @[Cat.scala 30:58]
  assign mstatus = {22'h0,_T_95}; // @[Cat.scala 30:58]
  assign _T_114 = {MSIP,1'h0}; // @[Cat.scala 30:58]
  assign _T_115 = {_T_114,2'h0}; // @[Cat.scala 30:58]
  assign _T_117 = {24'h0,MTIP}; // @[Cat.scala 30:58]
  assign _T_118 = {_T_117,1'h0}; // @[Cat.scala 30:58]
  assign _T_119 = {_T_118,2'h0}; // @[Cat.scala 30:58]
  assign mip = {_T_119,_T_115}; // @[Cat.scala 30:58]
  assign _T_124 = {MSIE,1'h0}; // @[Cat.scala 30:58]
  assign _T_125 = {_T_124,2'h0}; // @[Cat.scala 30:58]
  assign _T_127 = {24'h0,MTIE}; // @[Cat.scala 30:58]
  assign _T_128 = {_T_127,1'h0}; // @[Cat.scala 30:58]
  assign _T_129 = {_T_128,2'h0}; // @[Cat.scala 30:58]
  assign mie = {_T_129,_T_125}; // @[Cat.scala 30:58]
  assign _T_139 = 12'hc00 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_143 = 12'hc01 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_147 = 12'hc02 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_151 = 12'hc80 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_155 = 12'hc81 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_159 = 12'hc82 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_163 = 12'h900 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_167 = 12'h901 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_171 = 12'h902 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_175 = 12'h980 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_179 = 12'h981 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_183 = 12'h982 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_187 = 12'hf00 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_191 = 12'hf01 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_195 = 12'hf10 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_199 = 12'h301 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_203 = 12'h302 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_207 = 12'h304 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_211 = 12'h321 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_215 = 12'h701 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_219 = 12'h741 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_223 = 12'h340 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_227 = 12'h341 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_231 = 12'h342 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_235 = 12'h343 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_239 = 12'h344 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_243 = 12'h300 == csr_addr; // @[Lookup.scala 9:38]
  assign _T_244 = _T_243 ? mstatus : 32'h0; // @[Lookup.scala 11:37]
  assign _T_245 = _T_239 ? mip : _T_244; // @[Lookup.scala 11:37]
  assign _T_246 = _T_235 ? mbadaddr : _T_245; // @[Lookup.scala 11:37]
  assign _T_247 = _T_231 ? mcause : _T_246; // @[Lookup.scala 11:37]
  assign _T_248 = _T_227 ? mepc : _T_247; // @[Lookup.scala 11:37]
  assign _T_249 = _T_223 ? mscratch : _T_248; // @[Lookup.scala 11:37]
  assign _T_250 = _T_219 ? timeh : _T_249; // @[Lookup.scala 11:37]
  assign _T_251 = _T_215 ? time$ : _T_250; // @[Lookup.scala 11:37]
  assign _T_252 = _T_211 ? mtimecmp : _T_251; // @[Lookup.scala 11:37]
  assign _T_253 = _T_207 ? mie : _T_252; // @[Lookup.scala 11:37]
  assign _T_254 = _T_203 ? 32'h0 : _T_253; // @[Lookup.scala 11:37]
  assign _T_255 = _T_199 ? 32'h100 : _T_254; // @[Lookup.scala 11:37]
  assign _T_256 = _T_195 ? 32'h0 : _T_255; // @[Lookup.scala 11:37]
  assign _T_257 = _T_191 ? 32'h0 : _T_256; // @[Lookup.scala 11:37]
  assign _T_258 = _T_187 ? 32'h100100 : _T_257; // @[Lookup.scala 11:37]
  assign _T_259 = _T_183 ? instreth : _T_258; // @[Lookup.scala 11:37]
  assign _T_260 = _T_179 ? timeh : _T_259; // @[Lookup.scala 11:37]
  assign _T_261 = _T_175 ? cycleh : _T_260; // @[Lookup.scala 11:37]
  assign _T_262 = _T_171 ? instret : _T_261; // @[Lookup.scala 11:37]
  assign _T_263 = _T_167 ? time$ : _T_262; // @[Lookup.scala 11:37]
  assign _T_264 = _T_163 ? cycle : _T_263; // @[Lookup.scala 11:37]
  assign _T_265 = _T_159 ? instreth : _T_264; // @[Lookup.scala 11:37]
  assign _T_266 = _T_155 ? timeh : _T_265; // @[Lookup.scala 11:37]
  assign _T_267 = _T_151 ? cycleh : _T_266; // @[Lookup.scala 11:37]
  assign _T_268 = _T_147 ? instret : _T_267; // @[Lookup.scala 11:37]
  assign _T_269 = _T_143 ? time$ : _T_268; // @[Lookup.scala 11:37]
  assign _T_270 = _T_139 ? cycle : _T_269; // @[Lookup.scala 11:37]
  assign _T_271 = csr_addr[9:8]; // @[CSR.scala 203:27]
  assign privValid = _T_271 <= PRV; // @[CSR.scala 203:34]
  assign privInst = io_cmd == 3'h4; // @[CSR.scala 204:26]
  assign _T_272 = csr_addr[0]; // @[CSR.scala 205:40]
  assign _T_274 = _T_272 == 1'h0; // @[CSR.scala 205:31]
  assign _T_275 = privInst & _T_274; // @[CSR.scala 205:28]
  assign _T_276 = csr_addr[8]; // @[CSR.scala 205:56]
  assign _T_278 = _T_276 == 1'h0; // @[CSR.scala 205:47]
  assign isEcall = _T_275 & _T_278; // @[CSR.scala 205:44]
  assign _T_280 = privInst & _T_272; // @[CSR.scala 206:28]
  assign isEbreak = _T_280 & _T_278; // @[CSR.scala 206:44]
  assign isEret = _T_275 & _T_276; // @[CSR.scala 207:44]
  assign _T_397 = _T_139 | _T_143; // @[CSR.scala 208:61]
  assign _T_398 = _T_397 | _T_147; // @[CSR.scala 208:61]
  assign _T_399 = _T_398 | _T_151; // @[CSR.scala 208:61]
  assign _T_400 = _T_399 | _T_155; // @[CSR.scala 208:61]
  assign _T_401 = _T_400 | _T_159; // @[CSR.scala 208:61]
  assign _T_402 = _T_401 | _T_163; // @[CSR.scala 208:61]
  assign _T_403 = _T_402 | _T_167; // @[CSR.scala 208:61]
  assign _T_404 = _T_403 | _T_171; // @[CSR.scala 208:61]
  assign _T_405 = _T_404 | _T_175; // @[CSR.scala 208:61]
  assign _T_406 = _T_405 | _T_179; // @[CSR.scala 208:61]
  assign _T_407 = _T_406 | _T_183; // @[CSR.scala 208:61]
  assign _T_408 = _T_407 | _T_187; // @[CSR.scala 208:61]
  assign _T_409 = _T_408 | _T_191; // @[CSR.scala 208:61]
  assign _T_410 = _T_409 | _T_195; // @[CSR.scala 208:61]
  assign _T_411 = _T_410 | _T_199; // @[CSR.scala 208:61]
  assign _T_412 = _T_411 | _T_203; // @[CSR.scala 208:61]
  assign _T_413 = _T_412 | _T_207; // @[CSR.scala 208:61]
  assign _T_414 = _T_413 | _T_211; // @[CSR.scala 208:61]
  assign _T_415 = _T_414 | _T_215; // @[CSR.scala 208:61]
  assign _T_416 = _T_415 | _T_219; // @[CSR.scala 208:61]
  assign _T_417 = _T_416 | _T_223; // @[CSR.scala 208:61]
  assign _T_418 = _T_417 | _T_227; // @[CSR.scala 208:61]
  assign _T_419 = _T_418 | _T_231; // @[CSR.scala 208:61]
  assign _T_420 = _T_419 | _T_235; // @[CSR.scala 208:61]
  assign _T_421 = _T_420 | _T_239; // @[CSR.scala 208:61]
  assign csrValid = _T_421 | _T_243; // @[CSR.scala 208:61]
  assign _T_422 = csr_addr[11:10]; // @[CSR.scala 209:27]
  assign _T_423 = ~ _T_422; // @[CSR.scala 209:36]
  assign _T_425 = _T_423 == 2'h0; // @[CSR.scala 209:36]
  assign _T_426 = csr_addr == 12'h301; // @[CSR.scala 209:53]
  assign _T_427 = _T_425 | _T_426; // @[CSR.scala 209:41]
  assign _T_428 = csr_addr == 12'h302; // @[CSR.scala 209:79]
  assign csrRO = _T_427 | _T_428; // @[CSR.scala 209:67]
  assign _T_429 = io_cmd == 3'h1; // @[CSR.scala 210:26]
  assign _T_430 = io_cmd[1]; // @[CSR.scala 210:45]
  assign _T_432 = rs1_addr != 5'h0; // @[CSR.scala 210:61]
  assign _T_433 = _T_430 & _T_432; // @[CSR.scala 210:49]
  assign wen = _T_429 | _T_433; // @[CSR.scala 210:36]
  assign _T_435 = io_out | io_in; // @[CSR.scala 213:22]
  assign _T_436 = ~ io_in; // @[CSR.scala 214:24]
  assign _T_437 = io_out & _T_436; // @[CSR.scala 214:22]
  assign _T_438 = 3'h3 == io_cmd; // @[Mux.scala 46:19]
  assign _T_439 = _T_438 ? _T_437 : 32'h0; // @[Mux.scala 46:16]
  assign _T_440 = 3'h2 == io_cmd; // @[Mux.scala 46:19]
  assign _T_441 = _T_440 ? _T_435 : _T_439; // @[Mux.scala 46:16]
  assign _T_442 = 3'h1 == io_cmd; // @[Mux.scala 46:19]
  assign wdata = _T_442 ? io_in : _T_441; // @[Mux.scala 46:16]
  assign _T_443 = io_addr[1]; // @[CSR.scala 216:44]
  assign iaddrInvalid = io_pc_check & _T_443; // @[CSR.scala 216:34]
  assign _T_498 = io_addr[1:0]; // @[CSR.scala 218:29]
  assign _T_500 = _T_498 != 2'h0; // @[CSR.scala 218:36]
  assign _T_501 = io_addr[0]; // @[CSR.scala 218:65]
  assign _T_503 = 3'h4 == io_ld_type; // @[Mux.scala 46:19]
  assign _T_504 = _T_503 ? _T_501 : 1'h0; // @[Mux.scala 46:16]
  assign _T_505 = 3'h2 == io_ld_type; // @[Mux.scala 46:19]
  assign _T_506 = _T_505 ? _T_501 : _T_504; // @[Mux.scala 46:16]
  assign _T_507 = 3'h1 == io_ld_type; // @[Mux.scala 46:19]
  assign laddrInvalid = _T_507 ? _T_500 : _T_506; // @[Mux.scala 46:16]
  assign _T_513 = 2'h2 == io_st_type; // @[Mux.scala 46:19]
  assign _T_514 = _T_513 ? _T_501 : 1'h0; // @[Mux.scala 46:16]
  assign _T_515 = 2'h1 == io_st_type; // @[Mux.scala 46:19]
  assign saddrInvalid = _T_515 ? _T_500 : _T_514; // @[Mux.scala 46:16]
  assign _T_516 = io_illegal | iaddrInvalid; // @[CSR.scala 221:25]
  assign _T_517 = _T_516 | laddrInvalid; // @[CSR.scala 221:41]
  assign _T_518 = _T_517 | saddrInvalid; // @[CSR.scala 221:57]
  assign _T_519 = io_cmd[1:0]; // @[CSR.scala 222:20]
  assign _T_521 = _T_519 != 2'h0; // @[CSR.scala 222:27]
  assign _T_523 = csrValid == 1'h0; // @[CSR.scala 222:35]
  assign _T_525 = privValid == 1'h0; // @[CSR.scala 222:48]
  assign _T_526 = _T_523 | _T_525; // @[CSR.scala 222:45]
  assign _T_527 = _T_521 & _T_526; // @[CSR.scala 222:31]
  assign _T_528 = _T_518 | _T_527; // @[CSR.scala 221:73]
  assign _T_529 = wen & csrRO; // @[CSR.scala 222:67]
  assign _T_530 = _T_528 | _T_529; // @[CSR.scala 222:60]
  assign _T_533 = privInst & _T_525; // @[CSR.scala 223:24]
  assign _T_534 = _T_530 | _T_533; // @[CSR.scala 222:76]
  assign _T_535 = _T_534 | isEcall; // @[CSR.scala 223:39]
  assign _T_536 = _T_535 | isEbreak; // @[CSR.scala 223:50]
  assign _GEN_216 = {{6'd0}, PRV}; // @[CSR.scala 224:27]
  assign _T_537 = _GEN_216 << 6; // @[CSR.scala 224:27]
  assign _GEN_217 = {{24'd0}, _T_537}; // @[CSR.scala 224:20]
  assign _T_538 = 32'h100 + _GEN_217; // @[CSR.scala 224:20]
  assign _T_539 = _T_538[31:0]; // @[CSR.scala 224:20]
  assign _T_541 = time$ + 32'h1; // @[CSR.scala 228:16]
  assign _T_542 = _T_541[31:0]; // @[CSR.scala 228:16]
  assign _T_543 = ~ time$; // @[CSR.scala 229:13]
  assign _T_545 = _T_543 == 32'h0; // @[CSR.scala 229:13]
  assign _T_547 = timeh + 32'h1; // @[CSR.scala 229:36]
  assign _T_548 = _T_547[31:0]; // @[CSR.scala 229:36]
  assign _GEN_0 = _T_545 ? _T_548 : timeh; // @[CSR.scala 229:19]
  assign _T_550 = cycle + 32'h1; // @[CSR.scala 230:18]
  assign _T_551 = _T_550[31:0]; // @[CSR.scala 230:18]
  assign _T_552 = ~ cycle; // @[CSR.scala 231:14]
  assign _T_554 = _T_552 == 32'h0; // @[CSR.scala 231:14]
  assign _T_556 = cycleh + 32'h1; // @[CSR.scala 231:39]
  assign _T_557 = _T_556[31:0]; // @[CSR.scala 231:39]
  assign _GEN_1 = _T_554 ? _T_557 : cycleh; // @[CSR.scala 231:20]
  assign _T_559 = io_inst != 32'h13; // @[CSR.scala 232:27]
  assign _T_561 = io_expt == 1'h0; // @[CSR.scala 232:52]
  assign _T_562 = _T_561 | isEcall; // @[CSR.scala 232:61]
  assign _T_563 = _T_562 | isEbreak; // @[CSR.scala 232:72]
  assign _T_564 = _T_559 & _T_563; // @[CSR.scala 232:48]
  assign _T_566 = io_stall == 1'h0; // @[CSR.scala 232:88]
  assign isInstRet = _T_564 & _T_566; // @[CSR.scala 232:85]
  assign _T_568 = instret + 32'h1; // @[CSR.scala 233:40]
  assign _T_569 = _T_568[31:0]; // @[CSR.scala 233:40]
  assign _GEN_2 = isInstRet ? _T_569 : instret; // @[CSR.scala 233:19]
  assign _T_570 = ~ instret; // @[CSR.scala 234:29]
  assign _T_572 = _T_570 == 32'h0; // @[CSR.scala 234:29]
  assign _T_573 = isInstRet & _T_572; // @[CSR.scala 234:18]
  assign _T_575 = instreth + 32'h1; // @[CSR.scala 234:58]
  assign _T_576 = _T_575[31:0]; // @[CSR.scala 234:58]
  assign _GEN_3 = _T_573 ? _T_576 : instreth; // @[CSR.scala 234:35]
  assign _T_579 = io_pc[31:2]; // @[CSR.scala 238:23]
  assign _GEN_218 = {{2'd0}, _T_579}; // @[CSR.scala 238:28]
  assign _T_580 = _GEN_218 << 2; // @[CSR.scala 238:28]
  assign _GEN_219 = {{2'd0}, PRV}; // @[CSR.scala 242:47]
  assign _T_587 = 4'h8 + _GEN_219; // @[CSR.scala 242:47]
  assign _T_588 = _T_587[3:0]; // @[CSR.scala 242:47]
  assign _T_589 = isEbreak ? 2'h3 : 2'h2; // @[CSR.scala 243:20]
  assign _T_590 = isEcall ? _T_588 : {{2'd0}, _T_589}; // @[CSR.scala 242:20]
  assign _T_591 = saddrInvalid ? 4'h6 : _T_590; // @[CSR.scala 241:20]
  assign _T_592 = laddrInvalid ? 4'h4 : _T_591; // @[CSR.scala 240:20]
  assign _T_593 = iaddrInvalid ? 4'h0 : _T_592; // @[CSR.scala 239:20]
  assign _T_595 = iaddrInvalid | laddrInvalid; // @[CSR.scala 248:25]
  assign _T_596 = _T_595 | saddrInvalid; // @[CSR.scala 248:41]
  assign _GEN_4 = _T_596 ? io_addr : mbadaddr; // @[CSR.scala 248:58]
  assign _T_598 = csr_addr == 12'h300; // @[CSR.scala 255:21]
  assign _T_599 = wdata[5:4]; // @[CSR.scala 256:22]
  assign _T_600 = wdata[3]; // @[CSR.scala 257:22]
  assign _T_601 = wdata[2:1]; // @[CSR.scala 258:22]
  assign _T_602 = wdata[0]; // @[CSR.scala 259:22]
  assign _T_603 = csr_addr == 12'h344; // @[CSR.scala 261:26]
  assign _T_604 = wdata[7]; // @[CSR.scala 262:22]
  assign _T_606 = csr_addr == 12'h304; // @[CSR.scala 265:26]
  assign _T_609 = csr_addr == 12'h701; // @[CSR.scala 269:26]
  assign _T_610 = csr_addr == 12'h741; // @[CSR.scala 270:26]
  assign _T_611 = csr_addr == 12'h321; // @[CSR.scala 271:26]
  assign _T_612 = csr_addr == 12'h340; // @[CSR.scala 272:26]
  assign _T_613 = csr_addr == 12'h341; // @[CSR.scala 273:26]
  assign _T_615 = wdata >> 2'h2; // @[CSR.scala 273:56]
  assign _GEN_220 = {{3'd0}, _T_615}; // @[CSR.scala 273:63]
  assign _T_617 = _GEN_220 << 2'h2; // @[CSR.scala 273:63]
  assign _T_618 = csr_addr == 12'h342; // @[CSR.scala 274:26]
  assign _T_620 = wdata & 32'h8000000f; // @[CSR.scala 274:60]
  assign _T_621 = csr_addr == 12'h343; // @[CSR.scala 275:26]
  assign _T_622 = csr_addr == 12'h900; // @[CSR.scala 278:26]
  assign _T_623 = csr_addr == 12'h901; // @[CSR.scala 279:26]
  assign _T_624 = csr_addr == 12'h902; // @[CSR.scala 280:26]
  assign _T_625 = csr_addr == 12'h980; // @[CSR.scala 281:26]
  assign _T_626 = csr_addr == 12'h981; // @[CSR.scala 282:26]
  assign _T_627 = csr_addr == 12'h982; // @[CSR.scala 283:26]
  assign _GEN_5 = _T_627 ? wdata : _GEN_3; // @[CSR.scala 283:45]
  assign _GEN_6 = _T_626 ? wdata : _GEN_0; // @[CSR.scala 282:42]
  assign _GEN_7 = _T_626 ? _GEN_3 : _GEN_5; // @[CSR.scala 282:42]
  assign _GEN_8 = _T_625 ? wdata : _GEN_1; // @[CSR.scala 281:43]
  assign _GEN_9 = _T_625 ? _GEN_0 : _GEN_6; // @[CSR.scala 281:43]
  assign _GEN_10 = _T_625 ? _GEN_3 : _GEN_7; // @[CSR.scala 281:43]
  assign _GEN_11 = _T_624 ? wdata : _GEN_2; // @[CSR.scala 280:44]
  assign _GEN_12 = _T_624 ? _GEN_1 : _GEN_8; // @[CSR.scala 280:44]
  assign _GEN_13 = _T_624 ? _GEN_0 : _GEN_9; // @[CSR.scala 280:44]
  assign _GEN_14 = _T_624 ? _GEN_3 : _GEN_10; // @[CSR.scala 280:44]
  assign _GEN_15 = _T_623 ? wdata : _T_542; // @[CSR.scala 279:41]
  assign _GEN_16 = _T_623 ? _GEN_2 : _GEN_11; // @[CSR.scala 279:41]
  assign _GEN_17 = _T_623 ? _GEN_1 : _GEN_12; // @[CSR.scala 279:41]
  assign _GEN_18 = _T_623 ? _GEN_0 : _GEN_13; // @[CSR.scala 279:41]
  assign _GEN_19 = _T_623 ? _GEN_3 : _GEN_14; // @[CSR.scala 279:41]
  assign _GEN_20 = _T_622 ? wdata : _T_551; // @[CSR.scala 278:42]
  assign _GEN_21 = _T_622 ? _T_542 : _GEN_15; // @[CSR.scala 278:42]
  assign _GEN_22 = _T_622 ? _GEN_2 : _GEN_16; // @[CSR.scala 278:42]
  assign _GEN_23 = _T_622 ? _GEN_1 : _GEN_17; // @[CSR.scala 278:42]
  assign _GEN_24 = _T_622 ? _GEN_0 : _GEN_18; // @[CSR.scala 278:42]
  assign _GEN_25 = _T_622 ? _GEN_3 : _GEN_19; // @[CSR.scala 278:42]
  assign _GEN_26 = _T_621 ? wdata : mbadaddr; // @[CSR.scala 275:44]
  assign _GEN_27 = _T_621 ? _T_551 : _GEN_20; // @[CSR.scala 275:44]
  assign _GEN_28 = _T_621 ? _T_542 : _GEN_21; // @[CSR.scala 275:44]
  assign _GEN_29 = _T_621 ? _GEN_2 : _GEN_22; // @[CSR.scala 275:44]
  assign _GEN_30 = _T_621 ? _GEN_1 : _GEN_23; // @[CSR.scala 275:44]
  assign _GEN_31 = _T_621 ? _GEN_0 : _GEN_24; // @[CSR.scala 275:44]
  assign _GEN_32 = _T_621 ? _GEN_3 : _GEN_25; // @[CSR.scala 275:44]
  assign _GEN_33 = _T_618 ? _T_620 : mcause; // @[CSR.scala 274:42]
  assign _GEN_34 = _T_618 ? mbadaddr : _GEN_26; // @[CSR.scala 274:42]
  assign _GEN_35 = _T_618 ? _T_551 : _GEN_27; // @[CSR.scala 274:42]
  assign _GEN_36 = _T_618 ? _T_542 : _GEN_28; // @[CSR.scala 274:42]
  assign _GEN_37 = _T_618 ? _GEN_2 : _GEN_29; // @[CSR.scala 274:42]
  assign _GEN_38 = _T_618 ? _GEN_1 : _GEN_30; // @[CSR.scala 274:42]
  assign _GEN_39 = _T_618 ? _GEN_0 : _GEN_31; // @[CSR.scala 274:42]
  assign _GEN_40 = _T_618 ? _GEN_3 : _GEN_32; // @[CSR.scala 274:42]
  assign _GEN_41 = _T_613 ? _T_617 : {{3'd0}, mepc}; // @[CSR.scala 273:40]
  assign _GEN_42 = _T_613 ? mcause : _GEN_33; // @[CSR.scala 273:40]
  assign _GEN_43 = _T_613 ? mbadaddr : _GEN_34; // @[CSR.scala 273:40]
  assign _GEN_44 = _T_613 ? _T_551 : _GEN_35; // @[CSR.scala 273:40]
  assign _GEN_45 = _T_613 ? _T_542 : _GEN_36; // @[CSR.scala 273:40]
  assign _GEN_46 = _T_613 ? _GEN_2 : _GEN_37; // @[CSR.scala 273:40]
  assign _GEN_47 = _T_613 ? _GEN_1 : _GEN_38; // @[CSR.scala 273:40]
  assign _GEN_48 = _T_613 ? _GEN_0 : _GEN_39; // @[CSR.scala 273:40]
  assign _GEN_49 = _T_613 ? _GEN_3 : _GEN_40; // @[CSR.scala 273:40]
  assign _GEN_50 = _T_612 ? wdata : mscratch; // @[CSR.scala 272:44]
  assign _GEN_51 = _T_612 ? {{3'd0}, mepc} : _GEN_41; // @[CSR.scala 272:44]
  assign _GEN_52 = _T_612 ? mcause : _GEN_42; // @[CSR.scala 272:44]
  assign _GEN_53 = _T_612 ? mbadaddr : _GEN_43; // @[CSR.scala 272:44]
  assign _GEN_54 = _T_612 ? _T_551 : _GEN_44; // @[CSR.scala 272:44]
  assign _GEN_55 = _T_612 ? _T_542 : _GEN_45; // @[CSR.scala 272:44]
  assign _GEN_56 = _T_612 ? _GEN_2 : _GEN_46; // @[CSR.scala 272:44]
  assign _GEN_57 = _T_612 ? _GEN_1 : _GEN_47; // @[CSR.scala 272:44]
  assign _GEN_58 = _T_612 ? _GEN_0 : _GEN_48; // @[CSR.scala 272:44]
  assign _GEN_59 = _T_612 ? _GEN_3 : _GEN_49; // @[CSR.scala 272:44]
  assign _GEN_60 = _T_611 ? wdata : mtimecmp; // @[CSR.scala 271:44]
  assign _GEN_61 = _T_611 ? mscratch : _GEN_50; // @[CSR.scala 271:44]
  assign _GEN_62 = _T_611 ? {{3'd0}, mepc} : _GEN_51; // @[CSR.scala 271:44]
  assign _GEN_63 = _T_611 ? mcause : _GEN_52; // @[CSR.scala 271:44]
  assign _GEN_64 = _T_611 ? mbadaddr : _GEN_53; // @[CSR.scala 271:44]
  assign _GEN_65 = _T_611 ? _T_551 : _GEN_54; // @[CSR.scala 271:44]
  assign _GEN_66 = _T_611 ? _T_542 : _GEN_55; // @[CSR.scala 271:44]
  assign _GEN_67 = _T_611 ? _GEN_2 : _GEN_56; // @[CSR.scala 271:44]
  assign _GEN_68 = _T_611 ? _GEN_1 : _GEN_57; // @[CSR.scala 271:44]
  assign _GEN_69 = _T_611 ? _GEN_0 : _GEN_58; // @[CSR.scala 271:44]
  assign _GEN_70 = _T_611 ? _GEN_3 : _GEN_59; // @[CSR.scala 271:44]
  assign _GEN_71 = _T_610 ? wdata : _GEN_69; // @[CSR.scala 270:42]
  assign _GEN_72 = _T_610 ? mtimecmp : _GEN_60; // @[CSR.scala 270:42]
  assign _GEN_73 = _T_610 ? mscratch : _GEN_61; // @[CSR.scala 270:42]
  assign _GEN_74 = _T_610 ? {{3'd0}, mepc} : _GEN_62; // @[CSR.scala 270:42]
  assign _GEN_75 = _T_610 ? mcause : _GEN_63; // @[CSR.scala 270:42]
  assign _GEN_76 = _T_610 ? mbadaddr : _GEN_64; // @[CSR.scala 270:42]
  assign _GEN_77 = _T_610 ? _T_551 : _GEN_65; // @[CSR.scala 270:42]
  assign _GEN_78 = _T_610 ? _T_542 : _GEN_66; // @[CSR.scala 270:42]
  assign _GEN_79 = _T_610 ? _GEN_2 : _GEN_67; // @[CSR.scala 270:42]
  assign _GEN_80 = _T_610 ? _GEN_1 : _GEN_68; // @[CSR.scala 270:42]
  assign _GEN_81 = _T_610 ? _GEN_3 : _GEN_70; // @[CSR.scala 270:42]
  assign _GEN_82 = _T_609 ? wdata : _GEN_78; // @[CSR.scala 269:41]
  assign _GEN_83 = _T_609 ? _GEN_0 : _GEN_71; // @[CSR.scala 269:41]
  assign _GEN_84 = _T_609 ? mtimecmp : _GEN_72; // @[CSR.scala 269:41]
  assign _GEN_85 = _T_609 ? mscratch : _GEN_73; // @[CSR.scala 269:41]
  assign _GEN_86 = _T_609 ? {{3'd0}, mepc} : _GEN_74; // @[CSR.scala 269:41]
  assign _GEN_87 = _T_609 ? mcause : _GEN_75; // @[CSR.scala 269:41]
  assign _GEN_88 = _T_609 ? mbadaddr : _GEN_76; // @[CSR.scala 269:41]
  assign _GEN_89 = _T_609 ? _T_551 : _GEN_77; // @[CSR.scala 269:41]
  assign _GEN_90 = _T_609 ? _GEN_2 : _GEN_79; // @[CSR.scala 269:41]
  assign _GEN_91 = _T_609 ? _GEN_1 : _GEN_80; // @[CSR.scala 269:41]
  assign _GEN_92 = _T_609 ? _GEN_3 : _GEN_81; // @[CSR.scala 269:41]
  assign _GEN_93 = _T_606 ? _T_604 : MTIE; // @[CSR.scala 265:39]
  assign _GEN_94 = _T_606 ? _T_600 : MSIE; // @[CSR.scala 265:39]
  assign _GEN_95 = _T_606 ? _T_542 : _GEN_82; // @[CSR.scala 265:39]
  assign _GEN_96 = _T_606 ? _GEN_0 : _GEN_83; // @[CSR.scala 265:39]
  assign _GEN_97 = _T_606 ? mtimecmp : _GEN_84; // @[CSR.scala 265:39]
  assign _GEN_98 = _T_606 ? mscratch : _GEN_85; // @[CSR.scala 265:39]
  assign _GEN_99 = _T_606 ? {{3'd0}, mepc} : _GEN_86; // @[CSR.scala 265:39]
  assign _GEN_100 = _T_606 ? mcause : _GEN_87; // @[CSR.scala 265:39]
  assign _GEN_101 = _T_606 ? mbadaddr : _GEN_88; // @[CSR.scala 265:39]
  assign _GEN_102 = _T_606 ? _T_551 : _GEN_89; // @[CSR.scala 265:39]
  assign _GEN_103 = _T_606 ? _GEN_2 : _GEN_90; // @[CSR.scala 265:39]
  assign _GEN_104 = _T_606 ? _GEN_1 : _GEN_91; // @[CSR.scala 265:39]
  assign _GEN_105 = _T_606 ? _GEN_3 : _GEN_92; // @[CSR.scala 265:39]
  assign _GEN_106 = _T_603 ? _T_604 : MTIP; // @[CSR.scala 261:39]
  assign _GEN_107 = _T_603 ? _T_600 : MSIP; // @[CSR.scala 261:39]
  assign _GEN_108 = _T_603 ? MTIE : _GEN_93; // @[CSR.scala 261:39]
  assign _GEN_109 = _T_603 ? MSIE : _GEN_94; // @[CSR.scala 261:39]
  assign _GEN_110 = _T_603 ? _T_542 : _GEN_95; // @[CSR.scala 261:39]
  assign _GEN_111 = _T_603 ? _GEN_0 : _GEN_96; // @[CSR.scala 261:39]
  assign _GEN_112 = _T_603 ? mtimecmp : _GEN_97; // @[CSR.scala 261:39]
  assign _GEN_113 = _T_603 ? mscratch : _GEN_98; // @[CSR.scala 261:39]
  assign _GEN_114 = _T_603 ? {{3'd0}, mepc} : _GEN_99; // @[CSR.scala 261:39]
  assign _GEN_115 = _T_603 ? mcause : _GEN_100; // @[CSR.scala 261:39]
  assign _GEN_116 = _T_603 ? mbadaddr : _GEN_101; // @[CSR.scala 261:39]
  assign _GEN_117 = _T_603 ? _T_551 : _GEN_102; // @[CSR.scala 261:39]
  assign _GEN_118 = _T_603 ? _GEN_2 : _GEN_103; // @[CSR.scala 261:39]
  assign _GEN_119 = _T_603 ? _GEN_1 : _GEN_104; // @[CSR.scala 261:39]
  assign _GEN_120 = _T_603 ? _GEN_3 : _GEN_105; // @[CSR.scala 261:39]
  assign _GEN_121 = _T_598 ? _T_599 : PRV1; // @[CSR.scala 255:38]
  assign _GEN_122 = _T_598 ? _T_600 : IE1; // @[CSR.scala 255:38]
  assign _GEN_123 = _T_598 ? _T_601 : PRV; // @[CSR.scala 255:38]
  assign _GEN_124 = _T_598 ? _T_602 : IE; // @[CSR.scala 255:38]
  assign _GEN_125 = _T_598 ? MTIP : _GEN_106; // @[CSR.scala 255:38]
  assign _GEN_126 = _T_598 ? MSIP : _GEN_107; // @[CSR.scala 255:38]
  assign _GEN_127 = _T_598 ? MTIE : _GEN_108; // @[CSR.scala 255:38]
  assign _GEN_128 = _T_598 ? MSIE : _GEN_109; // @[CSR.scala 255:38]
  assign _GEN_129 = _T_598 ? _T_542 : _GEN_110; // @[CSR.scala 255:38]
  assign _GEN_130 = _T_598 ? _GEN_0 : _GEN_111; // @[CSR.scala 255:38]
  assign _GEN_131 = _T_598 ? mtimecmp : _GEN_112; // @[CSR.scala 255:38]
  assign _GEN_132 = _T_598 ? mscratch : _GEN_113; // @[CSR.scala 255:38]
  assign _GEN_133 = _T_598 ? {{3'd0}, mepc} : _GEN_114; // @[CSR.scala 255:38]
  assign _GEN_134 = _T_598 ? mcause : _GEN_115; // @[CSR.scala 255:38]
  assign _GEN_135 = _T_598 ? mbadaddr : _GEN_116; // @[CSR.scala 255:38]
  assign _GEN_136 = _T_598 ? _T_551 : _GEN_117; // @[CSR.scala 255:38]
  assign _GEN_137 = _T_598 ? _GEN_2 : _GEN_118; // @[CSR.scala 255:38]
  assign _GEN_138 = _T_598 ? _GEN_1 : _GEN_119; // @[CSR.scala 255:38]
  assign _GEN_139 = _T_598 ? _GEN_3 : _GEN_120; // @[CSR.scala 255:38]
  assign _GEN_140 = wen ? _GEN_121 : PRV1; // @[CSR.scala 254:21]
  assign _GEN_141 = wen ? _GEN_122 : IE1; // @[CSR.scala 254:21]
  assign _GEN_142 = wen ? _GEN_123 : PRV; // @[CSR.scala 254:21]
  assign _GEN_143 = wen ? _GEN_124 : IE; // @[CSR.scala 254:21]
  assign _GEN_144 = wen ? _GEN_125 : MTIP; // @[CSR.scala 254:21]
  assign _GEN_145 = wen ? _GEN_126 : MSIP; // @[CSR.scala 254:21]
  assign _GEN_146 = wen ? _GEN_127 : MTIE; // @[CSR.scala 254:21]
  assign _GEN_147 = wen ? _GEN_128 : MSIE; // @[CSR.scala 254:21]
  assign _GEN_148 = wen ? _GEN_129 : _T_542; // @[CSR.scala 254:21]
  assign _GEN_149 = wen ? _GEN_130 : _GEN_0; // @[CSR.scala 254:21]
  assign _GEN_150 = wen ? _GEN_131 : mtimecmp; // @[CSR.scala 254:21]
  assign _GEN_151 = wen ? _GEN_132 : mscratch; // @[CSR.scala 254:21]
  assign _GEN_152 = wen ? _GEN_133 : {{3'd0}, mepc}; // @[CSR.scala 254:21]
  assign _GEN_153 = wen ? _GEN_134 : mcause; // @[CSR.scala 254:21]
  assign _GEN_154 = wen ? _GEN_135 : mbadaddr; // @[CSR.scala 254:21]
  assign _GEN_155 = wen ? _GEN_136 : _T_551; // @[CSR.scala 254:21]
  assign _GEN_156 = wen ? _GEN_137 : _GEN_2; // @[CSR.scala 254:21]
  assign _GEN_157 = wen ? _GEN_138 : _GEN_1; // @[CSR.scala 254:21]
  assign _GEN_158 = wen ? _GEN_139 : _GEN_3; // @[CSR.scala 254:21]
  assign _GEN_159 = isEret ? PRV1 : _GEN_142; // @[CSR.scala 249:24]
  assign _GEN_160 = isEret ? IE1 : _GEN_143; // @[CSR.scala 249:24]
  assign _GEN_161 = isEret ? 2'h0 : _GEN_140; // @[CSR.scala 249:24]
  assign _GEN_162 = isEret ? 1'h1 : _GEN_141; // @[CSR.scala 249:24]
  assign _GEN_163 = isEret ? MTIP : _GEN_144; // @[CSR.scala 249:24]
  assign _GEN_164 = isEret ? MSIP : _GEN_145; // @[CSR.scala 249:24]
  assign _GEN_165 = isEret ? MTIE : _GEN_146; // @[CSR.scala 249:24]
  assign _GEN_166 = isEret ? MSIE : _GEN_147; // @[CSR.scala 249:24]
  assign _GEN_167 = isEret ? _T_542 : _GEN_148; // @[CSR.scala 249:24]
  assign _GEN_168 = isEret ? _GEN_0 : _GEN_149; // @[CSR.scala 249:24]
  assign _GEN_169 = isEret ? mtimecmp : _GEN_150; // @[CSR.scala 249:24]
  assign _GEN_170 = isEret ? mscratch : _GEN_151; // @[CSR.scala 249:24]
  assign _GEN_171 = isEret ? {{3'd0}, mepc} : _GEN_152; // @[CSR.scala 249:24]
  assign _GEN_172 = isEret ? mcause : _GEN_153; // @[CSR.scala 249:24]
  assign _GEN_173 = isEret ? mbadaddr : _GEN_154; // @[CSR.scala 249:24]
  assign _GEN_174 = isEret ? _T_551 : _GEN_155; // @[CSR.scala 249:24]
  assign _GEN_175 = isEret ? _GEN_2 : _GEN_156; // @[CSR.scala 249:24]
  assign _GEN_176 = isEret ? _GEN_1 : _GEN_157; // @[CSR.scala 249:24]
  assign _GEN_177 = isEret ? _GEN_3 : _GEN_158; // @[CSR.scala 249:24]
  assign _GEN_178 = io_expt ? {{3'd0}, _T_580} : _GEN_171; // @[CSR.scala 237:19]
  assign _GEN_179 = io_expt ? {{28'd0}, _T_593} : _GEN_172; // @[CSR.scala 237:19]
  assign _GEN_180 = io_expt ? 2'h3 : _GEN_159; // @[CSR.scala 237:19]
  assign _GEN_181 = io_expt ? 1'h0 : _GEN_160; // @[CSR.scala 237:19]
  assign _GEN_182 = io_expt ? PRV : _GEN_161; // @[CSR.scala 237:19]
  assign _GEN_183 = io_expt ? IE : _GEN_162; // @[CSR.scala 237:19]
  assign _GEN_184 = io_expt ? _GEN_4 : _GEN_173; // @[CSR.scala 237:19]
  assign _GEN_185 = io_expt ? MTIP : _GEN_163; // @[CSR.scala 237:19]
  assign _GEN_186 = io_expt ? MSIP : _GEN_164; // @[CSR.scala 237:19]
  assign _GEN_187 = io_expt ? MTIE : _GEN_165; // @[CSR.scala 237:19]
  assign _GEN_188 = io_expt ? MSIE : _GEN_166; // @[CSR.scala 237:19]
  assign _GEN_189 = io_expt ? _T_542 : _GEN_167; // @[CSR.scala 237:19]
  assign _GEN_190 = io_expt ? _GEN_0 : _GEN_168; // @[CSR.scala 237:19]
  assign _GEN_191 = io_expt ? mtimecmp : _GEN_169; // @[CSR.scala 237:19]
  assign _GEN_192 = io_expt ? mscratch : _GEN_170; // @[CSR.scala 237:19]
  assign _GEN_193 = io_expt ? _T_551 : _GEN_174; // @[CSR.scala 237:19]
  assign _GEN_194 = io_expt ? _GEN_2 : _GEN_175; // @[CSR.scala 237:19]
  assign _GEN_195 = io_expt ? _GEN_1 : _GEN_176; // @[CSR.scala 237:19]
  assign _GEN_196 = io_expt ? _GEN_3 : _GEN_177; // @[CSR.scala 237:19]
  assign _GEN_197 = _T_566 ? _GEN_178 : {{3'd0}, mepc}; // @[CSR.scala 236:19]
  assign _GEN_198 = _T_566 ? _GEN_179 : mcause; // @[CSR.scala 236:19]
  assign _GEN_199 = _T_566 ? _GEN_180 : PRV; // @[CSR.scala 236:19]
  assign _GEN_200 = _T_566 ? _GEN_181 : IE; // @[CSR.scala 236:19]
  assign _GEN_201 = _T_566 ? _GEN_182 : PRV1; // @[CSR.scala 236:19]
  assign _GEN_202 = _T_566 ? _GEN_183 : IE1; // @[CSR.scala 236:19]
  assign _GEN_203 = _T_566 ? _GEN_184 : mbadaddr; // @[CSR.scala 236:19]
  assign _GEN_204 = _T_566 ? _GEN_185 : MTIP; // @[CSR.scala 236:19]
  assign _GEN_205 = _T_566 ? _GEN_186 : MSIP; // @[CSR.scala 236:19]
  assign _GEN_206 = _T_566 ? _GEN_187 : MTIE; // @[CSR.scala 236:19]
  assign _GEN_207 = _T_566 ? _GEN_188 : MSIE; // @[CSR.scala 236:19]
  assign _GEN_208 = _T_566 ? _GEN_189 : _T_542; // @[CSR.scala 236:19]
  assign _GEN_209 = _T_566 ? _GEN_190 : _GEN_0; // @[CSR.scala 236:19]
  assign _GEN_210 = _T_566 ? _GEN_191 : mtimecmp; // @[CSR.scala 236:19]
  assign _GEN_211 = _T_566 ? _GEN_192 : mscratch; // @[CSR.scala 236:19]
  assign _GEN_212 = _T_566 ? _GEN_193 : _T_551; // @[CSR.scala 236:19]
  assign _GEN_213 = _T_566 ? _GEN_194 : _GEN_2; // @[CSR.scala 236:19]
  assign _GEN_214 = _T_566 ? _GEN_195 : _GEN_1; // @[CSR.scala 236:19]
  assign _GEN_215 = _T_566 ? _GEN_196 : _GEN_3; // @[CSR.scala 236:19]
  assign io_out = _T_270;
  assign io_expt = _T_536;
  assign io_evec = _T_539;
  assign io_epc = mepc;
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  time$ = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  timeh = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  cycle = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  cycleh = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  instret = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  instreth = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  PRV = _RAND_6[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  PRV1 = _RAND_7[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  IE = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  IE1 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  MTIP = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  MTIE = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  MSIP = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  MSIE = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  mtimecmp = _RAND_14[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  mscratch = _RAND_15[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  mepc = _RAND_16[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  mcause = _RAND_17[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  mbadaddr = _RAND_18[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      time$ <= 32'h0;
    end else begin
      if (_T_566) begin
        if (io_expt) begin
          time$ <= _T_542;
        end else begin
          if (isEret) begin
            time$ <= _T_542;
          end else begin
            if (wen) begin
              if (_T_598) begin
                time$ <= _T_542;
              end else begin
                if (_T_603) begin
                  time$ <= _T_542;
                end else begin
                  if (_T_606) begin
                    time$ <= _T_542;
                  end else begin
                    if (_T_609) begin
                      if (_T_442) begin
                        time$ <= io_in;
                      end else begin
                        if (_T_440) begin
                          time$ <= _T_435;
                        end else begin
                          if (_T_438) begin
                            time$ <= _T_437;
                          end else begin
                            time$ <= 32'h0;
                          end
                        end
                      end
                    end else begin
                      if (_T_610) begin
                        time$ <= _T_542;
                      end else begin
                        if (_T_611) begin
                          time$ <= _T_542;
                        end else begin
                          if (_T_612) begin
                            time$ <= _T_542;
                          end else begin
                            if (_T_613) begin
                              time$ <= _T_542;
                            end else begin
                              if (_T_618) begin
                                time$ <= _T_542;
                              end else begin
                                if (_T_621) begin
                                  time$ <= _T_542;
                                end else begin
                                  if (_T_622) begin
                                    time$ <= _T_542;
                                  end else begin
                                    if (_T_623) begin
                                      if (_T_442) begin
                                        time$ <= io_in;
                                      end else begin
                                        if (_T_440) begin
                                          time$ <= _T_435;
                                        end else begin
                                          if (_T_438) begin
                                            time$ <= _T_437;
                                          end else begin
                                            time$ <= 32'h0;
                                          end
                                        end
                                      end
                                    end else begin
                                      time$ <= _T_542;
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              time$ <= _T_542;
            end
          end
        end
      end else begin
        time$ <= _T_542;
      end
    end
    if (reset) begin
      timeh <= 32'h0;
    end else begin
      if (_T_566) begin
        if (io_expt) begin
          if (_T_545) begin
            timeh <= _T_548;
          end
        end else begin
          if (isEret) begin
            if (_T_545) begin
              timeh <= _T_548;
            end
          end else begin
            if (wen) begin
              if (_T_598) begin
                if (_T_545) begin
                  timeh <= _T_548;
                end
              end else begin
                if (_T_603) begin
                  if (_T_545) begin
                    timeh <= _T_548;
                  end
                end else begin
                  if (_T_606) begin
                    timeh <= _GEN_0;
                  end else begin
                    if (_T_609) begin
                      timeh <= _GEN_0;
                    end else begin
                      if (_T_610) begin
                        if (_T_442) begin
                          timeh <= io_in;
                        end else begin
                          if (_T_440) begin
                            timeh <= _T_435;
                          end else begin
                            if (_T_438) begin
                              timeh <= _T_437;
                            end else begin
                              timeh <= 32'h0;
                            end
                          end
                        end
                      end else begin
                        if (_T_611) begin
                          timeh <= _GEN_0;
                        end else begin
                          if (_T_612) begin
                            timeh <= _GEN_0;
                          end else begin
                            if (_T_613) begin
                              timeh <= _GEN_0;
                            end else begin
                              if (_T_618) begin
                                timeh <= _GEN_0;
                              end else begin
                                if (_T_621) begin
                                  timeh <= _GEN_0;
                                end else begin
                                  if (_T_622) begin
                                    timeh <= _GEN_0;
                                  end else begin
                                    if (_T_623) begin
                                      timeh <= _GEN_0;
                                    end else begin
                                      if (_T_624) begin
                                        timeh <= _GEN_0;
                                      end else begin
                                        if (_T_625) begin
                                          timeh <= _GEN_0;
                                        end else begin
                                          if (_T_626) begin
                                            if (_T_442) begin
                                              timeh <= io_in;
                                            end else begin
                                              if (_T_440) begin
                                                timeh <= _T_435;
                                              end else begin
                                                if (_T_438) begin
                                                  timeh <= _T_437;
                                                end else begin
                                                  timeh <= 32'h0;
                                                end
                                              end
                                            end
                                          end else begin
                                            timeh <= _GEN_0;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              timeh <= _GEN_0;
            end
          end
        end
      end else begin
        timeh <= _GEN_0;
      end
    end
    if (reset) begin
      cycle <= 32'h0;
    end else begin
      if (_T_566) begin
        if (io_expt) begin
          cycle <= _T_551;
        end else begin
          if (isEret) begin
            cycle <= _T_551;
          end else begin
            if (wen) begin
              if (_T_598) begin
                cycle <= _T_551;
              end else begin
                if (_T_603) begin
                  cycle <= _T_551;
                end else begin
                  if (_T_606) begin
                    cycle <= _T_551;
                  end else begin
                    if (_T_609) begin
                      cycle <= _T_551;
                    end else begin
                      if (_T_610) begin
                        cycle <= _T_551;
                      end else begin
                        if (_T_611) begin
                          cycle <= _T_551;
                        end else begin
                          if (_T_612) begin
                            cycle <= _T_551;
                          end else begin
                            if (_T_613) begin
                              cycle <= _T_551;
                            end else begin
                              if (_T_618) begin
                                cycle <= _T_551;
                              end else begin
                                if (_T_621) begin
                                  cycle <= _T_551;
                                end else begin
                                  if (_T_622) begin
                                    if (_T_442) begin
                                      cycle <= io_in;
                                    end else begin
                                      if (_T_440) begin
                                        cycle <= _T_435;
                                      end else begin
                                        if (_T_438) begin
                                          cycle <= _T_437;
                                        end else begin
                                          cycle <= 32'h0;
                                        end
                                      end
                                    end
                                  end else begin
                                    cycle <= _T_551;
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              cycle <= _T_551;
            end
          end
        end
      end else begin
        cycle <= _T_551;
      end
    end
    if (reset) begin
      cycleh <= 32'h0;
    end else begin
      if (_T_566) begin
        if (io_expt) begin
          if (_T_554) begin
            cycleh <= _T_557;
          end
        end else begin
          if (isEret) begin
            if (_T_554) begin
              cycleh <= _T_557;
            end
          end else begin
            if (wen) begin
              if (_T_598) begin
                if (_T_554) begin
                  cycleh <= _T_557;
                end
              end else begin
                if (_T_603) begin
                  if (_T_554) begin
                    cycleh <= _T_557;
                  end
                end else begin
                  if (_T_606) begin
                    cycleh <= _GEN_1;
                  end else begin
                    if (_T_609) begin
                      cycleh <= _GEN_1;
                    end else begin
                      if (_T_610) begin
                        cycleh <= _GEN_1;
                      end else begin
                        if (_T_611) begin
                          cycleh <= _GEN_1;
                        end else begin
                          if (_T_612) begin
                            cycleh <= _GEN_1;
                          end else begin
                            if (_T_613) begin
                              cycleh <= _GEN_1;
                            end else begin
                              if (_T_618) begin
                                cycleh <= _GEN_1;
                              end else begin
                                if (_T_621) begin
                                  cycleh <= _GEN_1;
                                end else begin
                                  if (_T_622) begin
                                    cycleh <= _GEN_1;
                                  end else begin
                                    if (_T_623) begin
                                      cycleh <= _GEN_1;
                                    end else begin
                                      if (_T_624) begin
                                        cycleh <= _GEN_1;
                                      end else begin
                                        if (_T_625) begin
                                          if (_T_442) begin
                                            cycleh <= io_in;
                                          end else begin
                                            if (_T_440) begin
                                              cycleh <= _T_435;
                                            end else begin
                                              if (_T_438) begin
                                                cycleh <= _T_437;
                                              end else begin
                                                cycleh <= 32'h0;
                                              end
                                            end
                                          end
                                        end else begin
                                          cycleh <= _GEN_1;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              cycleh <= _GEN_1;
            end
          end
        end
      end else begin
        cycleh <= _GEN_1;
      end
    end
    if (reset) begin
      instret <= 32'h0;
    end else begin
      if (_T_566) begin
        if (io_expt) begin
          if (isInstRet) begin
            instret <= _T_569;
          end
        end else begin
          if (isEret) begin
            if (isInstRet) begin
              instret <= _T_569;
            end
          end else begin
            if (wen) begin
              if (_T_598) begin
                if (isInstRet) begin
                  instret <= _T_569;
                end
              end else begin
                if (_T_603) begin
                  if (isInstRet) begin
                    instret <= _T_569;
                  end
                end else begin
                  if (_T_606) begin
                    instret <= _GEN_2;
                  end else begin
                    if (_T_609) begin
                      instret <= _GEN_2;
                    end else begin
                      if (_T_610) begin
                        instret <= _GEN_2;
                      end else begin
                        if (_T_611) begin
                          instret <= _GEN_2;
                        end else begin
                          if (_T_612) begin
                            instret <= _GEN_2;
                          end else begin
                            if (_T_613) begin
                              instret <= _GEN_2;
                            end else begin
                              if (_T_618) begin
                                instret <= _GEN_2;
                              end else begin
                                if (_T_621) begin
                                  instret <= _GEN_2;
                                end else begin
                                  if (_T_622) begin
                                    instret <= _GEN_2;
                                  end else begin
                                    if (_T_623) begin
                                      instret <= _GEN_2;
                                    end else begin
                                      if (_T_624) begin
                                        if (_T_442) begin
                                          instret <= io_in;
                                        end else begin
                                          if (_T_440) begin
                                            instret <= _T_435;
                                          end else begin
                                            if (_T_438) begin
                                              instret <= _T_437;
                                            end else begin
                                              instret <= 32'h0;
                                            end
                                          end
                                        end
                                      end else begin
                                        instret <= _GEN_2;
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              instret <= _GEN_2;
            end
          end
        end
      end else begin
        instret <= _GEN_2;
      end
    end
    if (reset) begin
      instreth <= 32'h0;
    end else begin
      if (_T_566) begin
        if (io_expt) begin
          if (_T_573) begin
            instreth <= _T_576;
          end
        end else begin
          if (isEret) begin
            if (_T_573) begin
              instreth <= _T_576;
            end
          end else begin
            if (wen) begin
              if (_T_598) begin
                if (_T_573) begin
                  instreth <= _T_576;
                end
              end else begin
                if (_T_603) begin
                  if (_T_573) begin
                    instreth <= _T_576;
                  end
                end else begin
                  if (_T_606) begin
                    instreth <= _GEN_3;
                  end else begin
                    if (_T_609) begin
                      instreth <= _GEN_3;
                    end else begin
                      if (_T_610) begin
                        instreth <= _GEN_3;
                      end else begin
                        if (_T_611) begin
                          instreth <= _GEN_3;
                        end else begin
                          if (_T_612) begin
                            instreth <= _GEN_3;
                          end else begin
                            if (_T_613) begin
                              instreth <= _GEN_3;
                            end else begin
                              if (_T_618) begin
                                instreth <= _GEN_3;
                              end else begin
                                if (_T_621) begin
                                  instreth <= _GEN_3;
                                end else begin
                                  if (_T_622) begin
                                    instreth <= _GEN_3;
                                  end else begin
                                    if (_T_623) begin
                                      instreth <= _GEN_3;
                                    end else begin
                                      if (_T_624) begin
                                        instreth <= _GEN_3;
                                      end else begin
                                        if (_T_625) begin
                                          instreth <= _GEN_3;
                                        end else begin
                                          if (_T_626) begin
                                            instreth <= _GEN_3;
                                          end else begin
                                            if (_T_627) begin
                                              if (_T_442) begin
                                                instreth <= io_in;
                                              end else begin
                                                if (_T_440) begin
                                                  instreth <= _T_435;
                                                end else begin
                                                  if (_T_438) begin
                                                    instreth <= _T_437;
                                                  end else begin
                                                    instreth <= 32'h0;
                                                  end
                                                end
                                              end
                                            end else begin
                                              instreth <= _GEN_3;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              instreth <= _GEN_3;
            end
          end
        end
      end else begin
        instreth <= _GEN_3;
      end
    end
    if (reset) begin
      PRV <= 2'h3;
    end else begin
      if (_T_566) begin
        if (io_expt) begin
          PRV <= 2'h3;
        end else begin
          if (isEret) begin
            PRV <= PRV1;
          end else begin
            if (wen) begin
              if (_T_598) begin
                PRV <= _T_601;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      PRV1 <= 2'h3;
    end else begin
      if (_T_566) begin
        if (io_expt) begin
          PRV1 <= PRV;
        end else begin
          if (isEret) begin
            PRV1 <= 2'h0;
          end else begin
            if (wen) begin
              if (_T_598) begin
                PRV1 <= _T_599;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      IE <= 1'h0;
    end else begin
      if (_T_566) begin
        if (io_expt) begin
          IE <= 1'h0;
        end else begin
          if (isEret) begin
            IE <= IE1;
          end else begin
            if (wen) begin
              if (_T_598) begin
                IE <= _T_602;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      IE1 <= 1'h0;
    end else begin
      if (_T_566) begin
        if (io_expt) begin
          IE1 <= IE;
        end else begin
          if (isEret) begin
            IE1 <= 1'h1;
          end else begin
            if (wen) begin
              if (_T_598) begin
                IE1 <= _T_600;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      MTIP <= 1'h0;
    end else begin
      if (_T_566) begin
        if (!(io_expt)) begin
          if (!(isEret)) begin
            if (wen) begin
              if (!(_T_598)) begin
                if (_T_603) begin
                  MTIP <= _T_604;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      MTIE <= 1'h0;
    end else begin
      if (_T_566) begin
        if (!(io_expt)) begin
          if (!(isEret)) begin
            if (wen) begin
              if (!(_T_598)) begin
                if (!(_T_603)) begin
                  if (_T_606) begin
                    MTIE <= _T_604;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      MSIP <= 1'h0;
    end else begin
      if (_T_566) begin
        if (!(io_expt)) begin
          if (!(isEret)) begin
            if (wen) begin
              if (!(_T_598)) begin
                if (_T_603) begin
                  MSIP <= _T_600;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      MSIE <= 1'h0;
    end else begin
      if (_T_566) begin
        if (!(io_expt)) begin
          if (!(isEret)) begin
            if (wen) begin
              if (!(_T_598)) begin
                if (!(_T_603)) begin
                  if (_T_606) begin
                    MSIE <= _T_600;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_566) begin
      if (!(io_expt)) begin
        if (!(isEret)) begin
          if (wen) begin
            if (!(_T_598)) begin
              if (!(_T_603)) begin
                if (!(_T_606)) begin
                  if (!(_T_609)) begin
                    if (!(_T_610)) begin
                      if (_T_611) begin
                        if (_T_442) begin
                          mtimecmp <= io_in;
                        end else begin
                          if (_T_440) begin
                            mtimecmp <= _T_435;
                          end else begin
                            if (_T_438) begin
                              mtimecmp <= _T_437;
                            end else begin
                              mtimecmp <= 32'h0;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_566) begin
      if (!(io_expt)) begin
        if (!(isEret)) begin
          if (wen) begin
            if (!(_T_598)) begin
              if (!(_T_603)) begin
                if (!(_T_606)) begin
                  if (!(_T_609)) begin
                    if (!(_T_610)) begin
                      if (!(_T_611)) begin
                        if (_T_612) begin
                          if (_T_442) begin
                            mscratch <= io_in;
                          end else begin
                            if (_T_440) begin
                              mscratch <= _T_435;
                            end else begin
                              if (_T_438) begin
                                mscratch <= _T_437;
                              end else begin
                                mscratch <= 32'h0;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    mepc <= _GEN_197[31:0];
    if (_T_566) begin
      if (io_expt) begin
        mcause <= {{28'd0}, _T_593};
      end else begin
        if (!(isEret)) begin
          if (wen) begin
            if (!(_T_598)) begin
              if (!(_T_603)) begin
                if (!(_T_606)) begin
                  if (!(_T_609)) begin
                    if (!(_T_610)) begin
                      if (!(_T_611)) begin
                        if (!(_T_612)) begin
                          if (!(_T_613)) begin
                            if (_T_618) begin
                              mcause <= _T_620;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_566) begin
      if (io_expt) begin
        if (_T_596) begin
          mbadaddr <= io_addr;
        end
      end else begin
        if (!(isEret)) begin
          if (wen) begin
            if (!(_T_598)) begin
              if (!(_T_603)) begin
                if (!(_T_606)) begin
                  if (!(_T_609)) begin
                    if (!(_T_610)) begin
                      if (!(_T_611)) begin
                        if (!(_T_612)) begin
                          if (!(_T_613)) begin
                            if (!(_T_618)) begin
                              if (_T_621) begin
                                if (_T_442) begin
                                  mbadaddr <= io_in;
                                end else begin
                                  if (_T_440) begin
                                    mbadaddr <= _T_435;
                                  end else begin
                                    if (_T_438) begin
                                      mbadaddr <= _T_437;
                                    end else begin
                                      mbadaddr <= 32'h0;
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
endmodule
module RegFile(
  input         clock,
  input  [4:0]  io_raddr1,
  input  [4:0]  io_raddr2,
  output [31:0] io_rdata1,
  output [31:0] io_rdata2,
  input         io_wen,
  input  [4:0]  io_waddr,
  input  [31:0] io_wdata
);
  reg [31:0] regs [0:31]; // @[RegFile.scala 20:17]
  reg [31:0] _RAND_0;
  wire [31:0] regs__T_23_data; // @[RegFile.scala 20:17]
  wire [4:0] regs__T_23_addr; // @[RegFile.scala 20:17]
  wire [31:0] regs__T_28_data; // @[RegFile.scala 20:17]
  wire [4:0] regs__T_28_addr; // @[RegFile.scala 20:17]
  wire [31:0] regs__T_34_data; // @[RegFile.scala 20:17]
  wire [4:0] regs__T_34_addr; // @[RegFile.scala 20:17]
  wire  regs__T_34_mask; // @[RegFile.scala 20:17]
  wire  regs__T_34_en; // @[RegFile.scala 20:17]
  wire  _T_22; // @[RegFile.scala 21:30]
  wire [31:0] _T_25; // @[RegFile.scala 21:19]
  wire  _T_27; // @[RegFile.scala 22:30]
  wire [31:0] _T_30; // @[RegFile.scala 22:19]
  wire  _T_32; // @[RegFile.scala 23:26]
  wire  _T_33; // @[RegFile.scala 23:15]
  assign regs__T_23_addr = io_raddr1;
  assign regs__T_23_data = regs[regs__T_23_addr]; // @[RegFile.scala 20:17]
  assign regs__T_28_addr = io_raddr2;
  assign regs__T_28_data = regs[regs__T_28_addr]; // @[RegFile.scala 20:17]
  assign regs__T_34_data = io_wdata;
  assign regs__T_34_addr = io_waddr;
  assign regs__T_34_mask = _T_33;
  assign regs__T_34_en = _T_33;
  assign _T_22 = io_raddr1 != 5'h0; // @[RegFile.scala 21:30]
  assign _T_25 = _T_22 ? regs__T_23_data : 32'h0; // @[RegFile.scala 21:19]
  assign _T_27 = io_raddr2 != 5'h0; // @[RegFile.scala 22:30]
  assign _T_30 = _T_27 ? regs__T_28_data : 32'h0; // @[RegFile.scala 22:19]
  assign _T_32 = io_waddr != 5'h0; // @[RegFile.scala 23:26]
  assign _T_33 = io_wen & _T_32; // @[RegFile.scala 23:15]
  assign io_rdata1 = _T_25;
  assign io_rdata2 = _T_30;
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _RAND_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regs[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(regs__T_34_en & regs__T_34_mask) begin
      regs[regs__T_34_addr] <= regs__T_34_data; // @[RegFile.scala 20:17]
    end
  end
endmodule
module ALUArea(
  input  [31:0] io_A,
  input  [31:0] io_B,
  input  [3:0]  io_alu_op,
  output [31:0] io_out,
  output [31:0] io_sum
);
  wire  _T_15; // @[ALU.scala 59:33]
  wire [32:0] _T_17; // @[ALU.scala 59:38]
  wire [32:0] _T_18; // @[ALU.scala 59:38]
  wire [31:0] _T_19; // @[ALU.scala 59:38]
  wire [31:0] _T_20; // @[ALU.scala 59:23]
  wire [32:0] _T_21; // @[ALU.scala 59:18]
  wire [31:0] sum; // @[ALU.scala 59:18]
  wire  _T_22; // @[ALU.scala 60:21]
  wire  _T_23; // @[ALU.scala 60:38]
  wire  _T_24; // @[ALU.scala 60:30]
  wire  _T_25; // @[ALU.scala 60:51]
  wire  _T_26; // @[ALU.scala 61:26]
  wire  _T_29; // @[ALU.scala 61:16]
  wire  cmp; // @[ALU.scala 60:16]
  wire [4:0] shamt; // @[ALU.scala 62:20]
  wire  _T_30; // @[ALU.scala 63:29]
  wire [15:0] _T_35; // @[Bitwise.scala 103:21]
  wire [31:0] _T_36; // @[Bitwise.scala 103:31]
  wire [15:0] _T_37; // @[Bitwise.scala 103:46]
  wire [31:0] _GEN_0; // @[Bitwise.scala 103:65]
  wire [31:0] _T_38; // @[Bitwise.scala 103:65]
  wire [31:0] _T_40; // @[Bitwise.scala 103:75]
  wire [31:0] _T_41; // @[Bitwise.scala 103:39]
  wire [23:0] _T_45; // @[Bitwise.scala 103:21]
  wire [31:0] _GEN_1; // @[Bitwise.scala 103:31]
  wire [31:0] _T_46; // @[Bitwise.scala 103:31]
  wire [23:0] _T_47; // @[Bitwise.scala 103:46]
  wire [31:0] _GEN_2; // @[Bitwise.scala 103:65]
  wire [31:0] _T_48; // @[Bitwise.scala 103:65]
  wire [31:0] _T_50; // @[Bitwise.scala 103:75]
  wire [31:0] _T_51; // @[Bitwise.scala 103:39]
  wire [27:0] _T_55; // @[Bitwise.scala 103:21]
  wire [31:0] _GEN_3; // @[Bitwise.scala 103:31]
  wire [31:0] _T_56; // @[Bitwise.scala 103:31]
  wire [27:0] _T_57; // @[Bitwise.scala 103:46]
  wire [31:0] _GEN_4; // @[Bitwise.scala 103:65]
  wire [31:0] _T_58; // @[Bitwise.scala 103:65]
  wire [31:0] _T_60; // @[Bitwise.scala 103:75]
  wire [31:0] _T_61; // @[Bitwise.scala 103:39]
  wire [29:0] _T_65; // @[Bitwise.scala 103:21]
  wire [31:0] _GEN_5; // @[Bitwise.scala 103:31]
  wire [31:0] _T_66; // @[Bitwise.scala 103:31]
  wire [29:0] _T_67; // @[Bitwise.scala 103:46]
  wire [31:0] _GEN_6; // @[Bitwise.scala 103:65]
  wire [31:0] _T_68; // @[Bitwise.scala 103:65]
  wire [31:0] _T_70; // @[Bitwise.scala 103:75]
  wire [31:0] _T_71; // @[Bitwise.scala 103:39]
  wire [30:0] _T_75; // @[Bitwise.scala 103:21]
  wire [31:0] _GEN_7; // @[Bitwise.scala 103:31]
  wire [31:0] _T_76; // @[Bitwise.scala 103:31]
  wire [30:0] _T_77; // @[Bitwise.scala 103:46]
  wire [31:0] _GEN_8; // @[Bitwise.scala 103:65]
  wire [31:0] _T_78; // @[Bitwise.scala 103:65]
  wire [31:0] _T_80; // @[Bitwise.scala 103:75]
  wire [31:0] _T_81; // @[Bitwise.scala 103:39]
  wire [31:0] shin; // @[ALU.scala 63:19]
  wire  _T_83; // @[ALU.scala 64:41]
  wire  _T_84; // @[ALU.scala 64:34]
  wire [32:0] _T_85; // @[Cat.scala 30:58]
  wire [32:0] _T_86; // @[ALU.scala 64:57]
  wire [32:0] _T_87; // @[ALU.scala 64:64]
  wire [31:0] shiftr; // @[ALU.scala 64:73]
  wire [15:0] _T_92; // @[Bitwise.scala 103:21]
  wire [31:0] _T_93; // @[Bitwise.scala 103:31]
  wire [15:0] _T_94; // @[Bitwise.scala 103:46]
  wire [31:0] _GEN_9; // @[Bitwise.scala 103:65]
  wire [31:0] _T_95; // @[Bitwise.scala 103:65]
  wire [31:0] _T_97; // @[Bitwise.scala 103:75]
  wire [31:0] _T_98; // @[Bitwise.scala 103:39]
  wire [23:0] _T_102; // @[Bitwise.scala 103:21]
  wire [31:0] _GEN_10; // @[Bitwise.scala 103:31]
  wire [31:0] _T_103; // @[Bitwise.scala 103:31]
  wire [23:0] _T_104; // @[Bitwise.scala 103:46]
  wire [31:0] _GEN_11; // @[Bitwise.scala 103:65]
  wire [31:0] _T_105; // @[Bitwise.scala 103:65]
  wire [31:0] _T_107; // @[Bitwise.scala 103:75]
  wire [31:0] _T_108; // @[Bitwise.scala 103:39]
  wire [27:0] _T_112; // @[Bitwise.scala 103:21]
  wire [31:0] _GEN_12; // @[Bitwise.scala 103:31]
  wire [31:0] _T_113; // @[Bitwise.scala 103:31]
  wire [27:0] _T_114; // @[Bitwise.scala 103:46]
  wire [31:0] _GEN_13; // @[Bitwise.scala 103:65]
  wire [31:0] _T_115; // @[Bitwise.scala 103:65]
  wire [31:0] _T_117; // @[Bitwise.scala 103:75]
  wire [31:0] _T_118; // @[Bitwise.scala 103:39]
  wire [29:0] _T_122; // @[Bitwise.scala 103:21]
  wire [31:0] _GEN_14; // @[Bitwise.scala 103:31]
  wire [31:0] _T_123; // @[Bitwise.scala 103:31]
  wire [29:0] _T_124; // @[Bitwise.scala 103:46]
  wire [31:0] _GEN_15; // @[Bitwise.scala 103:65]
  wire [31:0] _T_125; // @[Bitwise.scala 103:65]
  wire [31:0] _T_127; // @[Bitwise.scala 103:75]
  wire [31:0] _T_128; // @[Bitwise.scala 103:39]
  wire [30:0] _T_132; // @[Bitwise.scala 103:21]
  wire [31:0] _GEN_16; // @[Bitwise.scala 103:31]
  wire [31:0] _T_133; // @[Bitwise.scala 103:31]
  wire [30:0] _T_134; // @[Bitwise.scala 103:46]
  wire [31:0] _GEN_17; // @[Bitwise.scala 103:65]
  wire [31:0] _T_135; // @[Bitwise.scala 103:65]
  wire [31:0] _T_137; // @[Bitwise.scala 103:75]
  wire [31:0] shiftl; // @[Bitwise.scala 103:39]
  wire  _T_138; // @[ALU.scala 68:19]
  wire  _T_139; // @[ALU.scala 68:44]
  wire  _T_140; // @[ALU.scala 68:31]
  wire  _T_141; // @[ALU.scala 69:19]
  wire  _T_142; // @[ALU.scala 69:44]
  wire  _T_143; // @[ALU.scala 69:31]
  wire  _T_144; // @[ALU.scala 70:19]
  wire  _T_145; // @[ALU.scala 70:44]
  wire  _T_146; // @[ALU.scala 70:31]
  wire  _T_147; // @[ALU.scala 71:19]
  wire  _T_148; // @[ALU.scala 72:19]
  wire [31:0] _T_149; // @[ALU.scala 72:38]
  wire  _T_150; // @[ALU.scala 73:19]
  wire [31:0] _T_151; // @[ALU.scala 73:38]
  wire  _T_152; // @[ALU.scala 74:19]
  wire [31:0] _T_153; // @[ALU.scala 74:38]
  wire  _T_154; // @[ALU.scala 75:19]
  wire [31:0] _T_155; // @[ALU.scala 75:8]
  wire [31:0] _T_156; // @[ALU.scala 74:8]
  wire [31:0] _T_157; // @[ALU.scala 73:8]
  wire [31:0] _T_158; // @[ALU.scala 72:8]
  wire [31:0] _T_159; // @[ALU.scala 71:8]
  wire [31:0] _T_160; // @[ALU.scala 70:8]
  wire [31:0] _T_161; // @[ALU.scala 69:8]
  wire [31:0] out; // @[ALU.scala 68:8]
  assign _T_15 = io_alu_op[0]; // @[ALU.scala 59:33]
  assign _T_17 = 32'h0 - io_B; // @[ALU.scala 59:38]
  assign _T_18 = $unsigned(_T_17); // @[ALU.scala 59:38]
  assign _T_19 = _T_18[31:0]; // @[ALU.scala 59:38]
  assign _T_20 = _T_15 ? _T_19 : io_B; // @[ALU.scala 59:23]
  assign _T_21 = io_A + _T_20; // @[ALU.scala 59:18]
  assign sum = _T_21[31:0]; // @[ALU.scala 59:18]
  assign _T_22 = io_A[31]; // @[ALU.scala 60:21]
  assign _T_23 = io_B[31]; // @[ALU.scala 60:38]
  assign _T_24 = _T_22 == _T_23; // @[ALU.scala 60:30]
  assign _T_25 = sum[31]; // @[ALU.scala 60:51]
  assign _T_26 = io_alu_op[1]; // @[ALU.scala 61:26]
  assign _T_29 = _T_26 ? _T_23 : _T_22; // @[ALU.scala 61:16]
  assign cmp = _T_24 ? _T_25 : _T_29; // @[ALU.scala 60:16]
  assign shamt = io_B[4:0]; // @[ALU.scala 62:20]
  assign _T_30 = io_alu_op[3]; // @[ALU.scala 63:29]
  assign _T_35 = io_A[31:16]; // @[Bitwise.scala 103:21]
  assign _T_36 = {{16'd0}, _T_35}; // @[Bitwise.scala 103:31]
  assign _T_37 = io_A[15:0]; // @[Bitwise.scala 103:46]
  assign _GEN_0 = {{16'd0}, _T_37}; // @[Bitwise.scala 103:65]
  assign _T_38 = _GEN_0 << 16; // @[Bitwise.scala 103:65]
  assign _T_40 = _T_38 & 32'hffff0000; // @[Bitwise.scala 103:75]
  assign _T_41 = _T_36 | _T_40; // @[Bitwise.scala 103:39]
  assign _T_45 = _T_41[31:8]; // @[Bitwise.scala 103:21]
  assign _GEN_1 = {{8'd0}, _T_45}; // @[Bitwise.scala 103:31]
  assign _T_46 = _GEN_1 & 32'hff00ff; // @[Bitwise.scala 103:31]
  assign _T_47 = _T_41[23:0]; // @[Bitwise.scala 103:46]
  assign _GEN_2 = {{8'd0}, _T_47}; // @[Bitwise.scala 103:65]
  assign _T_48 = _GEN_2 << 8; // @[Bitwise.scala 103:65]
  assign _T_50 = _T_48 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  assign _T_51 = _T_46 | _T_50; // @[Bitwise.scala 103:39]
  assign _T_55 = _T_51[31:4]; // @[Bitwise.scala 103:21]
  assign _GEN_3 = {{4'd0}, _T_55}; // @[Bitwise.scala 103:31]
  assign _T_56 = _GEN_3 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  assign _T_57 = _T_51[27:0]; // @[Bitwise.scala 103:46]
  assign _GEN_4 = {{4'd0}, _T_57}; // @[Bitwise.scala 103:65]
  assign _T_58 = _GEN_4 << 4; // @[Bitwise.scala 103:65]
  assign _T_60 = _T_58 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  assign _T_61 = _T_56 | _T_60; // @[Bitwise.scala 103:39]
  assign _T_65 = _T_61[31:2]; // @[Bitwise.scala 103:21]
  assign _GEN_5 = {{2'd0}, _T_65}; // @[Bitwise.scala 103:31]
  assign _T_66 = _GEN_5 & 32'h33333333; // @[Bitwise.scala 103:31]
  assign _T_67 = _T_61[29:0]; // @[Bitwise.scala 103:46]
  assign _GEN_6 = {{2'd0}, _T_67}; // @[Bitwise.scala 103:65]
  assign _T_68 = _GEN_6 << 2; // @[Bitwise.scala 103:65]
  assign _T_70 = _T_68 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  assign _T_71 = _T_66 | _T_70; // @[Bitwise.scala 103:39]
  assign _T_75 = _T_71[31:1]; // @[Bitwise.scala 103:21]
  assign _GEN_7 = {{1'd0}, _T_75}; // @[Bitwise.scala 103:31]
  assign _T_76 = _GEN_7 & 32'h55555555; // @[Bitwise.scala 103:31]
  assign _T_77 = _T_71[30:0]; // @[Bitwise.scala 103:46]
  assign _GEN_8 = {{1'd0}, _T_77}; // @[Bitwise.scala 103:65]
  assign _T_78 = _GEN_8 << 1; // @[Bitwise.scala 103:65]
  assign _T_80 = _T_78 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  assign _T_81 = _T_76 | _T_80; // @[Bitwise.scala 103:39]
  assign shin = _T_30 ? io_A : _T_81; // @[ALU.scala 63:19]
  assign _T_83 = shin[31]; // @[ALU.scala 64:41]
  assign _T_84 = _T_15 & _T_83; // @[ALU.scala 64:34]
  assign _T_85 = {_T_84,shin}; // @[Cat.scala 30:58]
  assign _T_86 = $signed(_T_85); // @[ALU.scala 64:57]
  assign _T_87 = $signed(_T_86) >>> shamt; // @[ALU.scala 64:64]
  assign shiftr = _T_87[31:0]; // @[ALU.scala 64:73]
  assign _T_92 = shiftr[31:16]; // @[Bitwise.scala 103:21]
  assign _T_93 = {{16'd0}, _T_92}; // @[Bitwise.scala 103:31]
  assign _T_94 = shiftr[15:0]; // @[Bitwise.scala 103:46]
  assign _GEN_9 = {{16'd0}, _T_94}; // @[Bitwise.scala 103:65]
  assign _T_95 = _GEN_9 << 16; // @[Bitwise.scala 103:65]
  assign _T_97 = _T_95 & 32'hffff0000; // @[Bitwise.scala 103:75]
  assign _T_98 = _T_93 | _T_97; // @[Bitwise.scala 103:39]
  assign _T_102 = _T_98[31:8]; // @[Bitwise.scala 103:21]
  assign _GEN_10 = {{8'd0}, _T_102}; // @[Bitwise.scala 103:31]
  assign _T_103 = _GEN_10 & 32'hff00ff; // @[Bitwise.scala 103:31]
  assign _T_104 = _T_98[23:0]; // @[Bitwise.scala 103:46]
  assign _GEN_11 = {{8'd0}, _T_104}; // @[Bitwise.scala 103:65]
  assign _T_105 = _GEN_11 << 8; // @[Bitwise.scala 103:65]
  assign _T_107 = _T_105 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  assign _T_108 = _T_103 | _T_107; // @[Bitwise.scala 103:39]
  assign _T_112 = _T_108[31:4]; // @[Bitwise.scala 103:21]
  assign _GEN_12 = {{4'd0}, _T_112}; // @[Bitwise.scala 103:31]
  assign _T_113 = _GEN_12 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  assign _T_114 = _T_108[27:0]; // @[Bitwise.scala 103:46]
  assign _GEN_13 = {{4'd0}, _T_114}; // @[Bitwise.scala 103:65]
  assign _T_115 = _GEN_13 << 4; // @[Bitwise.scala 103:65]
  assign _T_117 = _T_115 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  assign _T_118 = _T_113 | _T_117; // @[Bitwise.scala 103:39]
  assign _T_122 = _T_118[31:2]; // @[Bitwise.scala 103:21]
  assign _GEN_14 = {{2'd0}, _T_122}; // @[Bitwise.scala 103:31]
  assign _T_123 = _GEN_14 & 32'h33333333; // @[Bitwise.scala 103:31]
  assign _T_124 = _T_118[29:0]; // @[Bitwise.scala 103:46]
  assign _GEN_15 = {{2'd0}, _T_124}; // @[Bitwise.scala 103:65]
  assign _T_125 = _GEN_15 << 2; // @[Bitwise.scala 103:65]
  assign _T_127 = _T_125 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  assign _T_128 = _T_123 | _T_127; // @[Bitwise.scala 103:39]
  assign _T_132 = _T_128[31:1]; // @[Bitwise.scala 103:21]
  assign _GEN_16 = {{1'd0}, _T_132}; // @[Bitwise.scala 103:31]
  assign _T_133 = _GEN_16 & 32'h55555555; // @[Bitwise.scala 103:31]
  assign _T_134 = _T_128[30:0]; // @[Bitwise.scala 103:46]
  assign _GEN_17 = {{1'd0}, _T_134}; // @[Bitwise.scala 103:65]
  assign _T_135 = _GEN_17 << 1; // @[Bitwise.scala 103:65]
  assign _T_137 = _T_135 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  assign shiftl = _T_133 | _T_137; // @[Bitwise.scala 103:39]
  assign _T_138 = io_alu_op == 4'h0; // @[ALU.scala 68:19]
  assign _T_139 = io_alu_op == 4'h1; // @[ALU.scala 68:44]
  assign _T_140 = _T_138 | _T_139; // @[ALU.scala 68:31]
  assign _T_141 = io_alu_op == 4'h5; // @[ALU.scala 69:19]
  assign _T_142 = io_alu_op == 4'h7; // @[ALU.scala 69:44]
  assign _T_143 = _T_141 | _T_142; // @[ALU.scala 69:31]
  assign _T_144 = io_alu_op == 4'h9; // @[ALU.scala 70:19]
  assign _T_145 = io_alu_op == 4'h8; // @[ALU.scala 70:44]
  assign _T_146 = _T_144 | _T_145; // @[ALU.scala 70:31]
  assign _T_147 = io_alu_op == 4'h6; // @[ALU.scala 71:19]
  assign _T_148 = io_alu_op == 4'h2; // @[ALU.scala 72:19]
  assign _T_149 = io_A & io_B; // @[ALU.scala 72:38]
  assign _T_150 = io_alu_op == 4'h3; // @[ALU.scala 73:19]
  assign _T_151 = io_A | io_B; // @[ALU.scala 73:38]
  assign _T_152 = io_alu_op == 4'h4; // @[ALU.scala 74:19]
  assign _T_153 = io_A ^ io_B; // @[ALU.scala 74:38]
  assign _T_154 = io_alu_op == 4'ha; // @[ALU.scala 75:19]
  assign _T_155 = _T_154 ? io_A : io_B; // @[ALU.scala 75:8]
  assign _T_156 = _T_152 ? _T_153 : _T_155; // @[ALU.scala 74:8]
  assign _T_157 = _T_150 ? _T_151 : _T_156; // @[ALU.scala 73:8]
  assign _T_158 = _T_148 ? _T_149 : _T_157; // @[ALU.scala 72:8]
  assign _T_159 = _T_147 ? shiftl : _T_158; // @[ALU.scala 71:8]
  assign _T_160 = _T_146 ? shiftr : _T_159; // @[ALU.scala 70:8]
  assign _T_161 = _T_143 ? {{31'd0}, cmp} : _T_160; // @[ALU.scala 69:8]
  assign out = _T_140 ? sum : _T_161; // @[ALU.scala 68:8]
  assign io_out = out;
  assign io_sum = sum;
endmodule
module ImmGenWire(
  input  [31:0] io_inst,
  input  [2:0]  io_sel,
  output [31:0] io_out
);
  wire [11:0] _T_11; // @[ImmGen.scala 21:21]
  wire [11:0] Iimm; // @[ImmGen.scala 21:30]
  wire [6:0] _T_12; // @[ImmGen.scala 22:25]
  wire [4:0] _T_13; // @[ImmGen.scala 22:42]
  wire [11:0] _T_14; // @[Cat.scala 30:58]
  wire [11:0] Simm; // @[ImmGen.scala 22:50]
  wire  _T_15; // @[ImmGen.scala 23:25]
  wire  _T_16; // @[ImmGen.scala 23:38]
  wire [5:0] _T_17; // @[ImmGen.scala 23:50]
  wire [3:0] _T_18; // @[ImmGen.scala 23:67]
  wire [4:0] _T_20; // @[Cat.scala 30:58]
  wire [1:0] _T_21; // @[Cat.scala 30:58]
  wire [7:0] _T_22; // @[Cat.scala 30:58]
  wire [12:0] _T_23; // @[Cat.scala 30:58]
  wire [12:0] Bimm; // @[ImmGen.scala 23:86]
  wire [19:0] _T_24; // @[ImmGen.scala 24:25]
  wire [31:0] _T_26; // @[Cat.scala 30:58]
  wire [31:0] Uimm; // @[ImmGen.scala 24:46]
  wire [7:0] _T_28; // @[ImmGen.scala 25:38]
  wire  _T_29; // @[ImmGen.scala 25:55]
  wire [3:0] _T_31; // @[ImmGen.scala 25:85]
  wire [9:0] _T_33; // @[Cat.scala 30:58]
  wire [10:0] _T_34; // @[Cat.scala 30:58]
  wire [8:0] _T_35; // @[Cat.scala 30:58]
  wire [9:0] _T_36; // @[Cat.scala 30:58]
  wire [20:0] _T_37; // @[Cat.scala 30:58]
  wire [20:0] Jimm; // @[ImmGen.scala 25:105]
  wire [4:0] _T_38; // @[ImmGen.scala 26:21]
  wire [5:0] Zimm; // @[ImmGen.scala 26:30]
  wire [11:0] _T_40; // @[ImmGen.scala 28:36]
  wire [11:0] _T_41; // @[ImmGen.scala 28:36]
  wire  _T_42; // @[Mux.scala 46:19]
  wire [11:0] _T_43; // @[Mux.scala 46:16]
  wire  _T_44; // @[Mux.scala 46:19]
  wire [20:0] _T_45; // @[Mux.scala 46:16]
  wire  _T_46; // @[Mux.scala 46:19]
  wire [31:0] _T_47; // @[Mux.scala 46:16]
  wire  _T_48; // @[Mux.scala 46:19]
  wire [31:0] _T_49; // @[Mux.scala 46:16]
  wire  _T_50; // @[Mux.scala 46:19]
  wire [31:0] _T_51; // @[Mux.scala 46:16]
  wire  _T_52; // @[Mux.scala 46:19]
  wire [31:0] _T_53; // @[Mux.scala 46:16]
  wire [31:0] _T_54; // @[ImmGen.scala 29:100]
  assign _T_11 = io_inst[31:20]; // @[ImmGen.scala 21:21]
  assign Iimm = $signed(_T_11); // @[ImmGen.scala 21:30]
  assign _T_12 = io_inst[31:25]; // @[ImmGen.scala 22:25]
  assign _T_13 = io_inst[11:7]; // @[ImmGen.scala 22:42]
  assign _T_14 = {_T_12,_T_13}; // @[Cat.scala 30:58]
  assign Simm = $signed(_T_14); // @[ImmGen.scala 22:50]
  assign _T_15 = io_inst[31]; // @[ImmGen.scala 23:25]
  assign _T_16 = io_inst[7]; // @[ImmGen.scala 23:38]
  assign _T_17 = io_inst[30:25]; // @[ImmGen.scala 23:50]
  assign _T_18 = io_inst[11:8]; // @[ImmGen.scala 23:67]
  assign _T_20 = {_T_18,1'h0}; // @[Cat.scala 30:58]
  assign _T_21 = {_T_15,_T_16}; // @[Cat.scala 30:58]
  assign _T_22 = {_T_21,_T_17}; // @[Cat.scala 30:58]
  assign _T_23 = {_T_22,_T_20}; // @[Cat.scala 30:58]
  assign Bimm = $signed(_T_23); // @[ImmGen.scala 23:86]
  assign _T_24 = io_inst[31:12]; // @[ImmGen.scala 24:25]
  assign _T_26 = {_T_24,12'h0}; // @[Cat.scala 30:58]
  assign Uimm = $signed(_T_26); // @[ImmGen.scala 24:46]
  assign _T_28 = io_inst[19:12]; // @[ImmGen.scala 25:38]
  assign _T_29 = io_inst[20]; // @[ImmGen.scala 25:55]
  assign _T_31 = io_inst[24:21]; // @[ImmGen.scala 25:85]
  assign _T_33 = {_T_17,_T_31}; // @[Cat.scala 30:58]
  assign _T_34 = {_T_33,1'h0}; // @[Cat.scala 30:58]
  assign _T_35 = {_T_15,_T_28}; // @[Cat.scala 30:58]
  assign _T_36 = {_T_35,_T_29}; // @[Cat.scala 30:58]
  assign _T_37 = {_T_36,_T_34}; // @[Cat.scala 30:58]
  assign Jimm = $signed(_T_37); // @[ImmGen.scala 25:105]
  assign _T_38 = io_inst[19:15]; // @[ImmGen.scala 26:21]
  assign Zimm = {1'b0,$signed(_T_38)}; // @[ImmGen.scala 26:30]
  assign _T_40 = $signed(Iimm) & $signed(-12'sh2); // @[ImmGen.scala 28:36]
  assign _T_41 = $signed(_T_40); // @[ImmGen.scala 28:36]
  assign _T_42 = 3'h6 == io_sel; // @[Mux.scala 46:19]
  assign _T_43 = _T_42 ? $signed({{6{Zimm[5]}},Zimm}) : $signed(_T_41); // @[Mux.scala 46:16]
  assign _T_44 = 3'h4 == io_sel; // @[Mux.scala 46:19]
  assign _T_45 = _T_44 ? $signed(Jimm) : $signed({{9{_T_43[11]}},_T_43}); // @[Mux.scala 46:16]
  assign _T_46 = 3'h3 == io_sel; // @[Mux.scala 46:19]
  assign _T_47 = _T_46 ? $signed(Uimm) : $signed({{11{_T_45[20]}},_T_45}); // @[Mux.scala 46:16]
  assign _T_48 = 3'h5 == io_sel; // @[Mux.scala 46:19]
  assign _T_49 = _T_48 ? $signed({{19{Bimm[12]}},Bimm}) : $signed(_T_47); // @[Mux.scala 46:16]
  assign _T_50 = 3'h2 == io_sel; // @[Mux.scala 46:19]
  assign _T_51 = _T_50 ? $signed({{20{Simm[11]}},Simm}) : $signed(_T_49); // @[Mux.scala 46:16]
  assign _T_52 = 3'h1 == io_sel; // @[Mux.scala 46:19]
  assign _T_53 = _T_52 ? $signed({{20{Iimm[11]}},Iimm}) : $signed(_T_51); // @[Mux.scala 46:16]
  assign _T_54 = $unsigned(_T_53); // @[ImmGen.scala 29:100]
  assign io_out = _T_54;
endmodule
module BrCondArea(
  input  [31:0] io_rs1,
  input  [31:0] io_rs2,
  input  [2:0]  io_br_type,
  output        io_taken
);
  wire [32:0] _T_13; // @[BrCond.scala 37:21]
  wire [32:0] _T_14; // @[BrCond.scala 37:21]
  wire [31:0] diff; // @[BrCond.scala 37:21]
  wire  neq; // @[BrCond.scala 38:19]
  wire  eq; // @[BrCond.scala 39:14]
  wire  _T_17; // @[BrCond.scala 40:26]
  wire  _T_18; // @[BrCond.scala 40:45]
  wire  isSameSign; // @[BrCond.scala 40:35]
  wire  _T_19; // @[BrCond.scala 41:34]
  wire  lt; // @[BrCond.scala 41:17]
  wire  ltu; // @[BrCond.scala 42:17]
  wire  ge; // @[BrCond.scala 43:14]
  wire  geu; // @[BrCond.scala 44:14]
  wire  _T_25; // @[BrCond.scala 46:18]
  wire  _T_26; // @[BrCond.scala 46:29]
  wire  _T_27; // @[BrCond.scala 47:18]
  wire  _T_28; // @[BrCond.scala 47:29]
  wire  _T_29; // @[BrCond.scala 46:36]
  wire  _T_30; // @[BrCond.scala 48:18]
  wire  _T_31; // @[BrCond.scala 48:29]
  wire  _T_32; // @[BrCond.scala 47:37]
  wire  _T_33; // @[BrCond.scala 49:18]
  wire  _T_34; // @[BrCond.scala 49:29]
  wire  _T_35; // @[BrCond.scala 48:36]
  wire  _T_36; // @[BrCond.scala 50:18]
  wire  _T_37; // @[BrCond.scala 50:30]
  wire  _T_38; // @[BrCond.scala 49:36]
  wire  _T_39; // @[BrCond.scala 51:18]
  wire  _T_40; // @[BrCond.scala 51:30]
  wire  _T_41; // @[BrCond.scala 50:38]
  assign _T_13 = io_rs1 - io_rs2; // @[BrCond.scala 37:21]
  assign _T_14 = $unsigned(_T_13); // @[BrCond.scala 37:21]
  assign diff = _T_14[31:0]; // @[BrCond.scala 37:21]
  assign neq = diff != 32'h0; // @[BrCond.scala 38:19]
  assign eq = neq == 1'h0; // @[BrCond.scala 39:14]
  assign _T_17 = io_rs1[31]; // @[BrCond.scala 40:26]
  assign _T_18 = io_rs2[31]; // @[BrCond.scala 40:45]
  assign isSameSign = _T_17 == _T_18; // @[BrCond.scala 40:35]
  assign _T_19 = diff[31]; // @[BrCond.scala 41:34]
  assign lt = isSameSign ? _T_19 : _T_17; // @[BrCond.scala 41:17]
  assign ltu = isSameSign ? _T_19 : _T_18; // @[BrCond.scala 42:17]
  assign ge = lt == 1'h0; // @[BrCond.scala 43:14]
  assign geu = ltu == 1'h0; // @[BrCond.scala 44:14]
  assign _T_25 = io_br_type == 3'h3; // @[BrCond.scala 46:18]
  assign _T_26 = _T_25 & eq; // @[BrCond.scala 46:29]
  assign _T_27 = io_br_type == 3'h6; // @[BrCond.scala 47:18]
  assign _T_28 = _T_27 & neq; // @[BrCond.scala 47:29]
  assign _T_29 = _T_26 | _T_28; // @[BrCond.scala 46:36]
  assign _T_30 = io_br_type == 3'h2; // @[BrCond.scala 48:18]
  assign _T_31 = _T_30 & lt; // @[BrCond.scala 48:29]
  assign _T_32 = _T_29 | _T_31; // @[BrCond.scala 47:37]
  assign _T_33 = io_br_type == 3'h5; // @[BrCond.scala 49:18]
  assign _T_34 = _T_33 & ge; // @[BrCond.scala 49:29]
  assign _T_35 = _T_32 | _T_34; // @[BrCond.scala 48:36]
  assign _T_36 = io_br_type == 3'h1; // @[BrCond.scala 50:18]
  assign _T_37 = _T_36 & ltu; // @[BrCond.scala 50:30]
  assign _T_38 = _T_35 | _T_37; // @[BrCond.scala 49:36]
  assign _T_39 = io_br_type == 3'h4; // @[BrCond.scala 51:18]
  assign _T_40 = _T_39 & geu; // @[BrCond.scala 51:30]
  assign _T_41 = _T_38 | _T_40; // @[BrCond.scala 50:38]
  assign io_taken = _T_41;
endmodule
module Datapath(
  input         clock,
  input         reset,
  output        io_imemory_req_valid,
  output [31:0] io_imemory_req_bits_addr,
  input         io_imemory_resp_valid,
  input  [31:0] io_imemory_resp_bits_data,
  output        io_dmemory_abort,
  output        io_dmemory_req_valid,
  output [31:0] io_dmemory_req_bits_addr,
  output [31:0] io_dmemory_req_bits_data,
  output [3:0]  io_dmemory_req_bits_mask,
  input         io_dmemory_resp_valid,
  input  [31:0] io_dmemory_resp_bits_data,
  output [31:0] io_ctrl_inst,
  input  [1:0]  io_ctrl_pc_sel,
  input         io_ctrl_inst_kill,
  input         io_ctrl_A_sel,
  input         io_ctrl_B_sel,
  input  [2:0]  io_ctrl_imm_sel,
  input  [3:0]  io_ctrl_alu_op,
  input  [2:0]  io_ctrl_br_type,
  input  [1:0]  io_ctrl_st_type,
  input  [2:0]  io_ctrl_ld_type,
  input  [1:0]  io_ctrl_wb_sel,
  input         io_ctrl_wb_en,
  input  [2:0]  io_ctrl_csr_cmd,
  input         io_ctrl_illegal,
  output        rvfi_valid,
  output [63:0] rvfi_order,
  output [31:0] rvfi_insn,
  output        rvfi_trap,
  output        rvfi_halt,
  output [4:0]  rvfi_rs1_addr,
  output [4:0]  rvfi_rs2_addr,
  output [31:0] rvfi_rs1_rdata,
  output [31:0] rvfi_rs2_rdata,
  output [4:0]  rvfi_rd_addr,
  output [31:0] rvfi_rd_wdata,
  output [31:0] rvfi_pc_rdata,
  output [31:0] rvfi_pc_wdata,
  output [31:0] rvfi_mem_addr,
  output [3:0]  rvfi_mem_rmask,
  output [3:0]  rvfi_mem_wmask,
  output [31:0] rvfi_mem_rdata,
  output [31:0] rvfi_mem_wdata
);
  wire  csr_clock; // @[Datapath.scala 24:23]
  wire  csr_reset; // @[Datapath.scala 24:23]
  wire  csr_io_stall; // @[Datapath.scala 24:23]
  wire [2:0] csr_io_cmd; // @[Datapath.scala 24:23]
  wire [31:0] csr_io_in; // @[Datapath.scala 24:23]
  wire [31:0] csr_io_out; // @[Datapath.scala 24:23]
  wire [31:0] csr_io_pc; // @[Datapath.scala 24:23]
  wire [31:0] csr_io_addr; // @[Datapath.scala 24:23]
  wire [31:0] csr_io_inst; // @[Datapath.scala 24:23]
  wire  csr_io_illegal; // @[Datapath.scala 24:23]
  wire [1:0] csr_io_st_type; // @[Datapath.scala 24:23]
  wire [2:0] csr_io_ld_type; // @[Datapath.scala 24:23]
  wire  csr_io_pc_check; // @[Datapath.scala 24:23]
  wire  csr_io_expt; // @[Datapath.scala 24:23]
  wire [31:0] csr_io_evec; // @[Datapath.scala 24:23]
  wire [31:0] csr_io_epc; // @[Datapath.scala 24:23]
  wire  regFile_clock; // @[Datapath.scala 25:23]
  wire [4:0] regFile_io_raddr1; // @[Datapath.scala 25:23]
  wire [4:0] regFile_io_raddr2; // @[Datapath.scala 25:23]
  wire [31:0] regFile_io_rdata1; // @[Datapath.scala 25:23]
  wire [31:0] regFile_io_rdata2; // @[Datapath.scala 25:23]
  wire  regFile_io_wen; // @[Datapath.scala 25:23]
  wire [4:0] regFile_io_waddr; // @[Datapath.scala 25:23]
  wire [31:0] regFile_io_wdata; // @[Datapath.scala 25:23]
  wire [31:0] alu_io_A; // @[Config.scala 19:50]
  wire [31:0] alu_io_B; // @[Config.scala 19:50]
  wire [3:0] alu_io_alu_op; // @[Config.scala 19:50]
  wire [31:0] alu_io_out; // @[Config.scala 19:50]
  wire [31:0] alu_io_sum; // @[Config.scala 19:50]
  wire [31:0] immGen_io_inst; // @[Config.scala 20:50]
  wire [2:0] immGen_io_sel; // @[Config.scala 20:50]
  wire [31:0] immGen_io_out; // @[Config.scala 20:50]
  wire [31:0] brCond_io_rs1; // @[Config.scala 21:50]
  wire [31:0] brCond_io_rs2; // @[Config.scala 21:50]
  wire [2:0] brCond_io_br_type; // @[Config.scala 21:50]
  wire  brCond_io_taken; // @[Config.scala 21:50]
  reg  rvfi_valid_reg; // @[Datapath.scala 35:31]
  reg [31:0] _RAND_0;
  reg [63:0] rvfi_order_reg; // @[Datapath.scala 36:31]
  reg [63:0] _RAND_1;
  reg [31:0] rvfi_insn_reg; // @[Datapath.scala 37:30]
  reg [31:0] _RAND_2;
  reg  rvfi_trap_reg; // @[Datapath.scala 38:30]
  reg [31:0] _RAND_3;
  reg  rvfi_halt_reg; // @[Datapath.scala 39:30]
  reg [31:0] _RAND_4;
  reg [4:0] rvfi_rs1_addr_reg; // @[Datapath.scala 43:34]
  reg [31:0] _RAND_5;
  reg [4:0] rvfi_rs2_addr_reg; // @[Datapath.scala 44:34]
  reg [31:0] _RAND_6;
  reg [31:0] rvfi_rs1_rdata_reg; // @[Datapath.scala 45:35]
  reg [31:0] _RAND_7;
  reg [31:0] rvfi_rs2_rdata_reg; // @[Datapath.scala 46:35]
  reg [31:0] _RAND_8;
  reg [4:0] rvfi_rd_addr_reg; // @[Datapath.scala 47:33]
  reg [31:0] _RAND_9;
  reg [31:0] rvfi_rd_wdata_reg; // @[Datapath.scala 48:34]
  reg [31:0] _RAND_10;
  reg [31:0] rvfi_pc_rdata_reg; // @[Datapath.scala 49:34]
  reg [31:0] _RAND_11;
  reg [31:0] rvfi_pc_wdata_reg; // @[Datapath.scala 50:34]
  reg [31:0] _RAND_12;
  reg [31:0] rvfi_mem_addr_reg; // @[Datapath.scala 51:34]
  reg [31:0] _RAND_13;
  reg [3:0] rvfi_mem_rmask_reg; // @[Datapath.scala 52:35]
  reg [31:0] _RAND_14;
  reg [3:0] rvfi_mem_wmask_reg; // @[Datapath.scala 53:35]
  reg [31:0] _RAND_15;
  reg [31:0] rvfi_mem_rdata_reg; // @[Datapath.scala 54:35]
  reg [31:0] _RAND_16;
  reg [31:0] rvfi_mem_wdata_reg; // @[Datapath.scala 55:35]
  reg [31:0] _RAND_17;
  reg [31:0] fe_inst; // @[Datapath.scala 81:24]
  reg [31:0] _RAND_18;
  reg [32:0] fe_pc; // @[Datapath.scala 82:20]
  reg [63:0] _RAND_19;
  reg [31:0] ew_inst; // @[Datapath.scala 85:24]
  reg [31:0] _RAND_20;
  reg [32:0] ew_pc; // @[Datapath.scala 86:20]
  reg [63:0] _RAND_21;
  reg [31:0] ew_alu; // @[Datapath.scala 87:20]
  reg [31:0] _RAND_22;
  reg [31:0] csr_in; // @[Datapath.scala 88:20]
  reg [31:0] _RAND_23;
  reg [4:0] ew_rs1_addr; // @[Datapath.scala 91:24]
  reg [31:0] _RAND_24;
  reg [4:0] ew_rs2_addr; // @[Datapath.scala 92:24]
  reg [31:0] _RAND_25;
  reg [31:0] ew_rs1_rdata; // @[Datapath.scala 93:25]
  reg [31:0] _RAND_26;
  reg [31:0] ew_rs2_rdata; // @[Datapath.scala 94:25]
  reg [31:0] _RAND_27;
  reg [31:0] ew_mem_addr; // @[Datapath.scala 95:24]
  reg [31:0] _RAND_28;
  reg [3:0] ew_mem_rmask; // @[Datapath.scala 96:25]
  reg [31:0] _RAND_29;
  reg [3:0] ew_mem_wmask; // @[Datapath.scala 97:25]
  reg [31:0] _RAND_30;
  reg [31:0] ew_mem_wdata; // @[Datapath.scala 98:25]
  reg [31:0] _RAND_31;
  reg [1:0] st_type; // @[Datapath.scala 101:21]
  reg [31:0] _RAND_32;
  reg [2:0] ld_type; // @[Datapath.scala 102:21]
  reg [31:0] _RAND_33;
  reg [1:0] wb_sel; // @[Datapath.scala 103:21]
  reg [31:0] _RAND_34;
  reg  wb_en; // @[Datapath.scala 104:21]
  reg [31:0] _RAND_35;
  reg [2:0] csr_cmd; // @[Datapath.scala 105:21]
  reg [31:0] _RAND_36;
  reg  illegal; // @[Datapath.scala 106:21]
  reg [31:0] _RAND_37;
  reg  pc_check; // @[Datapath.scala 107:21]
  reg [31:0] _RAND_38;
  reg  started; // @[Datapath.scala 110:24]
  reg [31:0] _RAND_39;
  reg [32:0] pc; // @[Datapath.scala 112:21]
  reg [63:0] _RAND_40;
  wire  _T_233; // @[Datapath.scala 111:15]
  wire  _T_235; // @[Datapath.scala 111:41]
  wire  stall; // @[Datapath.scala 111:38]
  wire [32:0] _T_238; // @[Datapath.scala 112:47]
  wire [32:0] _T_239; // @[Datapath.scala 112:47]
  wire [31:0] _T_240; // @[Datapath.scala 112:47]
  wire  _T_242; // @[Datapath.scala 114:33]
  wire  _T_243; // @[Datapath.scala 115:33]
  wire  _T_244; // @[Datapath.scala 115:44]
  wire [31:0] _T_246; // @[Datapath.scala 115:75]
  wire [32:0] _GEN_41; // @[Datapath.scala 115:82]
  wire [32:0] _T_248; // @[Datapath.scala 115:82]
  wire  _T_249; // @[Datapath.scala 116:33]
  wire [33:0] _T_251; // @[Datapath.scala 116:50]
  wire [32:0] _T_252; // @[Datapath.scala 116:50]
  wire [32:0] _T_253; // @[Datapath.scala 116:17]
  wire [32:0] _T_254; // @[Datapath.scala 115:17]
  wire [32:0] _T_255; // @[Datapath.scala 114:17]
  wire [32:0] _T_256; // @[Datapath.scala 113:32]
  wire [32:0] npc; // @[Datapath.scala 113:17]
  wire  _T_257; // @[Datapath.scala 117:26]
  wire  _T_258; // @[Datapath.scala 117:47]
  wire  _T_259; // @[Datapath.scala 117:66]
  wire [31:0] inst; // @[Datapath.scala 117:17]
  wire  _T_264; // @[Datapath.scala 122:31]
  wire [32:0] _GEN_0; // @[Datapath.scala 126:17]
  wire [31:0] _GEN_1; // @[Datapath.scala 126:17]
  wire [4:0] rs1_addr; // @[Datapath.scala 136:25]
  wire [4:0] rs2_addr; // @[Datapath.scala 137:25]
  wire [4:0] wb_rd_addr; // @[Datapath.scala 146:27]
  wire  _T_269; // @[Datapath.scala 147:37]
  wire  _T_270; // @[Datapath.scala 147:25]
  wire  _T_271; // @[Datapath.scala 147:54]
  wire  rs1hazard; // @[Datapath.scala 147:41]
  wire  _T_273; // @[Datapath.scala 148:37]
  wire  _T_274; // @[Datapath.scala 148:25]
  wire  _T_275; // @[Datapath.scala 148:54]
  wire  rs2hazard; // @[Datapath.scala 148:41]
  wire  _T_276; // @[Datapath.scala 149:24]
  wire  _T_277; // @[Datapath.scala 149:35]
  wire [31:0] rs1; // @[Datapath.scala 149:16]
  wire  _T_279; // @[Datapath.scala 150:35]
  wire [31:0] rs2; // @[Datapath.scala 150:16]
  wire [32:0] _T_281; // @[Datapath.scala 153:18]
  wire [31:0] _T_283; // @[Datapath.scala 154:18]
  wire [31:0] _T_284; // @[Datapath.scala 163:20]
  wire [31:0] _T_286; // @[Datapath.scala 163:48]
  wire [34:0] _GEN_42; // @[Datapath.scala 163:55]
  wire [34:0] daddr; // @[Datapath.scala 163:55]
  wire  _T_288; // @[Datapath.scala 164:27]
  wire [7:0] _GEN_43; // @[Datapath.scala 164:31]
  wire [7:0] _T_290; // @[Datapath.scala 164:31]
  wire  _T_291; // @[Datapath.scala 164:50]
  wire [3:0] _GEN_44; // @[Datapath.scala 164:54]
  wire [3:0] _T_293; // @[Datapath.scala 164:54]
  wire [7:0] _GEN_45; // @[Datapath.scala 164:38]
  wire [7:0] woffset; // @[Datapath.scala 164:38]
  wire [286:0] _GEN_46; // @[Datapath.scala 165:21]
  wire [286:0] ddata; // @[Datapath.scala 165:21]
  wire [1:0] _T_295; // @[Datapath.scala 167:29]
  wire [1:0] _T_299; // @[Datapath.scala 170:38]
  wire [4:0] _T_300; // @[Datapath.scala 170:25]
  wire [3:0] _T_303; // @[Datapath.scala 171:25]
  wire  _T_304; // @[Mux.scala 46:19]
  wire [3:0] _T_305; // @[Mux.scala 46:16]
  wire  _T_306; // @[Mux.scala 46:19]
  wire [4:0] _T_307; // @[Mux.scala 46:16]
  wire  _T_308; // @[Mux.scala 46:19]
  wire [4:0] _T_309; // @[Mux.scala 46:16]
  wire  _T_313; // @[Datapath.scala 172:58]
  wire  _T_315; // @[Datapath.scala 172:81]
  wire  _T_316; // @[Datapath.scala 172:62]
  wire  _T_317; // @[Datapath.scala 172:38]
  wire  _T_321; // @[Datapath.scala 180:31]
  wire  _T_322; // @[Datapath.scala 180:21]
  wire  _T_332; // @[Datapath.scala 187:24]
  wire  _T_333; // @[Datapath.scala 187:21]
  wire  _T_334; // @[Datapath.scala 191:38]
  wire [31:0] _T_335; // @[Datapath.scala 191:21]
  wire [3:0] mem_wmask; // @[Datapath.scala 166:23]
  wire  _T_338; // @[Datapath.scala 206:35]
  wire  _T_342; // @[Datapath.scala 206:24]
  wire [32:0] _GEN_2; // @[Datapath.scala 187:38]
  wire [31:0] _GEN_3; // @[Datapath.scala 187:38]
  wire [31:0] _GEN_4; // @[Datapath.scala 187:38]
  wire [31:0] _GEN_5; // @[Datapath.scala 187:38]
  wire [1:0] _GEN_6; // @[Datapath.scala 187:38]
  wire [2:0] _GEN_7; // @[Datapath.scala 187:38]
  wire [1:0] _GEN_8; // @[Datapath.scala 187:38]
  wire  _GEN_9; // @[Datapath.scala 187:38]
  wire [2:0] _GEN_10; // @[Datapath.scala 187:38]
  wire  _GEN_11; // @[Datapath.scala 187:38]
  wire  _GEN_12; // @[Datapath.scala 187:38]
  wire [4:0] _GEN_13; // @[Datapath.scala 187:38]
  wire [4:0] _GEN_14; // @[Datapath.scala 187:38]
  wire [31:0] _GEN_15; // @[Datapath.scala 187:38]
  wire [31:0] _GEN_16; // @[Datapath.scala 187:38]
  wire [34:0] _GEN_17; // @[Datapath.scala 187:38]
  wire [3:0] _GEN_18; // @[Datapath.scala 187:38]
  wire [3:0] _GEN_19; // @[Datapath.scala 187:38]
  wire [286:0] _GEN_20; // @[Datapath.scala 187:38]
  wire [1:0] _GEN_21; // @[Datapath.scala 180:47]
  wire [2:0] _GEN_22; // @[Datapath.scala 180:47]
  wire  _GEN_23; // @[Datapath.scala 180:47]
  wire [2:0] _GEN_24; // @[Datapath.scala 180:47]
  wire  _GEN_25; // @[Datapath.scala 180:47]
  wire  _GEN_26; // @[Datapath.scala 180:47]
  wire [32:0] _GEN_27; // @[Datapath.scala 180:47]
  wire [31:0] _GEN_28; // @[Datapath.scala 180:47]
  wire [31:0] _GEN_29; // @[Datapath.scala 180:47]
  wire [31:0] _GEN_30; // @[Datapath.scala 180:47]
  wire [1:0] _GEN_31; // @[Datapath.scala 180:47]
  wire [4:0] _GEN_32; // @[Datapath.scala 180:47]
  wire [4:0] _GEN_33; // @[Datapath.scala 180:47]
  wire [31:0] _GEN_34; // @[Datapath.scala 180:47]
  wire [31:0] _GEN_35; // @[Datapath.scala 180:47]
  wire [34:0] _GEN_36; // @[Datapath.scala 180:47]
  wire [3:0] _GEN_37; // @[Datapath.scala 180:47]
  wire [3:0] _GEN_38; // @[Datapath.scala 180:47]
  wire [286:0] _GEN_39; // @[Datapath.scala 180:47]
  wire  _T_343; // @[Datapath.scala 213:23]
  wire [7:0] _GEN_47; // @[Datapath.scala 213:27]
  wire [7:0] _T_345; // @[Datapath.scala 213:27]
  wire  _T_346; // @[Datapath.scala 213:42]
  wire [3:0] _GEN_48; // @[Datapath.scala 213:46]
  wire [3:0] _T_348; // @[Datapath.scala 213:46]
  wire [7:0] _GEN_49; // @[Datapath.scala 213:34]
  wire [7:0] loffset; // @[Datapath.scala 213:34]
  wire [31:0] lshift; // @[Datapath.scala 214:43]
  wire [32:0] _T_350; // @[Datapath.scala 216:56]
  wire [15:0] _T_351; // @[Datapath.scala 217:21]
  wire [15:0] _T_352; // @[Datapath.scala 217:29]
  wire [7:0] _T_353; // @[Datapath.scala 217:53]
  wire [7:0] _T_354; // @[Datapath.scala 217:60]
  wire [16:0] _T_356; // @[Datapath.scala 218:29]
  wire [8:0] _T_358; // @[Datapath.scala 218:60]
  wire  _T_359; // @[Mux.scala 46:19]
  wire [32:0] _T_360; // @[Mux.scala 46:16]
  wire  _T_361; // @[Mux.scala 46:19]
  wire [32:0] _T_362; // @[Mux.scala 46:16]
  wire  _T_363; // @[Mux.scala 46:19]
  wire [32:0] _T_364; // @[Mux.scala 46:16]
  wire  _T_365; // @[Mux.scala 46:19]
  wire [32:0] _T_366; // @[Mux.scala 46:16]
  wire [32:0] _T_368; // @[Datapath.scala 235:40]
  wire [33:0] _T_370; // @[Datapath.scala 237:22]
  wire [32:0] _T_371; // @[Datapath.scala 237:22]
  wire [33:0] _T_372; // @[Datapath.scala 237:29]
  wire [32:0] _T_373; // @[Datapath.scala 238:26]
  wire  _T_374; // @[Mux.scala 46:19]
  wire [32:0] _T_375; // @[Mux.scala 46:16]
  wire  _T_376; // @[Mux.scala 46:19]
  wire [33:0] _T_377; // @[Mux.scala 46:16]
  wire  _T_378; // @[Mux.scala 46:19]
  wire [31:0] _GEN_50; // @[Datapath.scala 215:21]
  wire [31:0] load; // @[Datapath.scala 215:21]
  wire [33:0] _T_379; // @[Mux.scala 46:16]
  wire [33:0] _T_380; // @[Datapath.scala 238:34]
  wire  _T_382; // @[Datapath.scala 240:19]
  wire [33:0] _GEN_40; // @[Datapath.scala 240:28]
  wire  _T_386; // @[Datapath.scala 244:29]
  wire  _T_389; // @[Datapath.scala 244:39]
  wire [4:0] _T_391; // @[Datapath.scala 253:10]
  wire [31:0] _T_393; // @[Datapath.scala 254:10]
  wire  _T_396; // @[Datapath.scala 252:11]
  wire  _T_403; // @[Datapath.scala 259:55]
  wire  _T_404; // @[Datapath.scala 259:44]
  wire [63:0] _GEN_51; // @[Datapath.scala 260:36]
  wire [64:0] _T_405; // @[Datapath.scala 260:36]
  wire [63:0] _T_406; // @[Datapath.scala 260:36]
  wire [4:0] _T_411; // @[Datapath.scala 273:26]
  wire [31:0] regWrite; // @[Datapath.scala 234:22]
  wire [31:0] _T_413; // @[Datapath.scala 274:27]
  wire  _T_415; // @[Datapath.scala 277:36]
  wire [32:0] _T_416; // @[Datapath.scala 277:27]
  wire [31:0] _T_417; // @[Datapath.scala 282:30]
  CSR csr ( // @[Datapath.scala 24:23]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_stall(csr_io_stall),
    .io_cmd(csr_io_cmd),
    .io_in(csr_io_in),
    .io_out(csr_io_out),
    .io_pc(csr_io_pc),
    .io_addr(csr_io_addr),
    .io_inst(csr_io_inst),
    .io_illegal(csr_io_illegal),
    .io_st_type(csr_io_st_type),
    .io_ld_type(csr_io_ld_type),
    .io_pc_check(csr_io_pc_check),
    .io_expt(csr_io_expt),
    .io_evec(csr_io_evec),
    .io_epc(csr_io_epc)
  );
  RegFile regFile ( // @[Datapath.scala 25:23]
    .clock(regFile_clock),
    .io_raddr1(regFile_io_raddr1),
    .io_raddr2(regFile_io_raddr2),
    .io_rdata1(regFile_io_rdata1),
    .io_rdata2(regFile_io_rdata2),
    .io_wen(regFile_io_wen),
    .io_waddr(regFile_io_waddr),
    .io_wdata(regFile_io_wdata)
  );
  ALUArea alu ( // @[Config.scala 19:50]
    .io_A(alu_io_A),
    .io_B(alu_io_B),
    .io_alu_op(alu_io_alu_op),
    .io_out(alu_io_out),
    .io_sum(alu_io_sum)
  );
  ImmGenWire immGen ( // @[Config.scala 20:50]
    .io_inst(immGen_io_inst),
    .io_sel(immGen_io_sel),
    .io_out(immGen_io_out)
  );
  BrCondArea brCond ( // @[Config.scala 21:50]
    .io_rs1(brCond_io_rs1),
    .io_rs2(brCond_io_rs2),
    .io_br_type(brCond_io_br_type),
    .io_taken(brCond_io_taken)
  );
  assign _T_233 = io_imemory_resp_valid == 1'h0; // @[Datapath.scala 111:15]
  assign _T_235 = io_dmemory_resp_valid == 1'h0; // @[Datapath.scala 111:41]
  assign stall = _T_233 | _T_235; // @[Datapath.scala 111:38]
  assign _T_238 = 32'h200 - 32'h4; // @[Datapath.scala 112:47]
  assign _T_239 = $unsigned(_T_238); // @[Datapath.scala 112:47]
  assign _T_240 = _T_239[31:0]; // @[Datapath.scala 112:47]
  assign _T_242 = io_ctrl_pc_sel == 2'h3; // @[Datapath.scala 114:33]
  assign _T_243 = io_ctrl_pc_sel == 2'h1; // @[Datapath.scala 115:33]
  assign _T_244 = _T_243 | brCond_io_taken; // @[Datapath.scala 115:44]
  assign _T_246 = alu_io_sum >> 1'h1; // @[Datapath.scala 115:75]
  assign _GEN_41 = {{1'd0}, _T_246}; // @[Datapath.scala 115:82]
  assign _T_248 = _GEN_41 << 1'h1; // @[Datapath.scala 115:82]
  assign _T_249 = io_ctrl_pc_sel == 2'h2; // @[Datapath.scala 116:33]
  assign _T_251 = pc + 33'h4; // @[Datapath.scala 116:50]
  assign _T_252 = _T_251[32:0]; // @[Datapath.scala 116:50]
  assign _T_253 = _T_249 ? pc : _T_252; // @[Datapath.scala 116:17]
  assign _T_254 = _T_244 ? _T_248 : _T_253; // @[Datapath.scala 115:17]
  assign _T_255 = _T_242 ? {{1'd0}, csr_io_epc} : _T_254; // @[Datapath.scala 114:17]
  assign _T_256 = csr_io_expt ? {{1'd0}, csr_io_evec} : _T_255; // @[Datapath.scala 113:32]
  assign npc = stall ? pc : _T_256; // @[Datapath.scala 113:17]
  assign _T_257 = started | io_ctrl_inst_kill; // @[Datapath.scala 117:26]
  assign _T_258 = _T_257 | brCond_io_taken; // @[Datapath.scala 117:47]
  assign _T_259 = _T_258 | csr_io_expt; // @[Datapath.scala 117:66]
  assign inst = _T_259 ? 32'h13 : io_imemory_resp_bits_data; // @[Datapath.scala 117:17]
  assign _T_264 = stall == 1'h0; // @[Datapath.scala 122:31]
  assign _GEN_0 = _T_264 ? pc : fe_pc; // @[Datapath.scala 126:17]
  assign _GEN_1 = _T_264 ? inst : fe_inst; // @[Datapath.scala 126:17]
  assign rs1_addr = fe_inst[19:15]; // @[Datapath.scala 136:25]
  assign rs2_addr = fe_inst[24:20]; // @[Datapath.scala 137:25]
  assign wb_rd_addr = ew_inst[11:7]; // @[Datapath.scala 146:27]
  assign _T_269 = rs1_addr != 5'h0; // @[Datapath.scala 147:37]
  assign _T_270 = wb_en & _T_269; // @[Datapath.scala 147:25]
  assign _T_271 = rs1_addr == wb_rd_addr; // @[Datapath.scala 147:54]
  assign rs1hazard = _T_270 & _T_271; // @[Datapath.scala 147:41]
  assign _T_273 = rs2_addr != 5'h0; // @[Datapath.scala 148:37]
  assign _T_274 = wb_en & _T_273; // @[Datapath.scala 148:25]
  assign _T_275 = rs2_addr == wb_rd_addr; // @[Datapath.scala 148:54]
  assign rs2hazard = _T_274 & _T_275; // @[Datapath.scala 148:41]
  assign _T_276 = wb_sel == 2'h0; // @[Datapath.scala 149:24]
  assign _T_277 = _T_276 & rs1hazard; // @[Datapath.scala 149:35]
  assign rs1 = _T_277 ? ew_alu : regFile_io_rdata1; // @[Datapath.scala 149:16]
  assign _T_279 = _T_276 & rs2hazard; // @[Datapath.scala 150:35]
  assign rs2 = _T_279 ? ew_alu : regFile_io_rdata2; // @[Datapath.scala 150:16]
  assign _T_281 = io_ctrl_A_sel ? {{1'd0}, rs1} : fe_pc; // @[Datapath.scala 153:18]
  assign _T_283 = io_ctrl_B_sel ? rs2 : immGen_io_out; // @[Datapath.scala 154:18]
  assign _T_284 = stall ? ew_alu : alu_io_sum; // @[Datapath.scala 163:20]
  assign _T_286 = _T_284 >> 2'h2; // @[Datapath.scala 163:48]
  assign _GEN_42 = {{3'd0}, _T_286}; // @[Datapath.scala 163:55]
  assign daddr = _GEN_42 << 2'h2; // @[Datapath.scala 163:55]
  assign _T_288 = alu_io_sum[1]; // @[Datapath.scala 164:27]
  assign _GEN_43 = {{7'd0}, _T_288}; // @[Datapath.scala 164:31]
  assign _T_290 = _GEN_43 << 3'h4; // @[Datapath.scala 164:31]
  assign _T_291 = alu_io_sum[0]; // @[Datapath.scala 164:50]
  assign _GEN_44 = {{3'd0}, _T_291}; // @[Datapath.scala 164:54]
  assign _T_293 = _GEN_44 << 2'h3; // @[Datapath.scala 164:54]
  assign _GEN_45 = {{4'd0}, _T_293}; // @[Datapath.scala 164:38]
  assign woffset = _T_290 | _GEN_45; // @[Datapath.scala 164:38]
  assign _GEN_46 = {{255'd0}, rs2}; // @[Datapath.scala 165:21]
  assign ddata = _GEN_46 << woffset; // @[Datapath.scala 165:21]
  assign _T_295 = stall ? st_type : io_ctrl_st_type; // @[Datapath.scala 167:29]
  assign _T_299 = alu_io_sum[1:0]; // @[Datapath.scala 170:38]
  assign _T_300 = 5'h3 << _T_299; // @[Datapath.scala 170:25]
  assign _T_303 = 4'h1 << _T_299; // @[Datapath.scala 171:25]
  assign _T_304 = 2'h3 == _T_295; // @[Mux.scala 46:19]
  assign _T_305 = _T_304 ? _T_303 : 4'h0; // @[Mux.scala 46:16]
  assign _T_306 = 2'h2 == _T_295; // @[Mux.scala 46:19]
  assign _T_307 = _T_306 ? _T_300 : {{1'd0}, _T_305}; // @[Mux.scala 46:16]
  assign _T_308 = 2'h1 == _T_295; // @[Mux.scala 46:19]
  assign _T_309 = _T_308 ? 5'hf : _T_307; // @[Mux.scala 46:16]
  assign _T_313 = io_ctrl_st_type != 2'h0; // @[Datapath.scala 172:58]
  assign _T_315 = io_ctrl_ld_type != 3'h0; // @[Datapath.scala 172:81]
  assign _T_316 = _T_313 | _T_315; // @[Datapath.scala 172:62]
  assign _T_317 = _T_264 & _T_316; // @[Datapath.scala 172:38]
  assign _T_321 = _T_264 & csr_io_expt; // @[Datapath.scala 180:31]
  assign _T_322 = reset | _T_321; // @[Datapath.scala 180:21]
  assign _T_332 = csr_io_expt == 1'h0; // @[Datapath.scala 187:24]
  assign _T_333 = _T_264 & _T_332; // @[Datapath.scala 187:21]
  assign _T_334 = io_ctrl_imm_sel == 3'h6; // @[Datapath.scala 191:38]
  assign _T_335 = _T_334 ? immGen_io_out : rs1; // @[Datapath.scala 191:21]
  assign mem_wmask = _T_309[3:0]; // @[Datapath.scala 166:23]
  assign _T_338 = mem_wmask != 4'h0; // @[Datapath.scala 206:35]
  assign _T_342 = _T_338 ? 1'h0 : 1'h1; // @[Datapath.scala 206:24]
  assign _GEN_2 = _T_333 ? fe_pc : ew_pc; // @[Datapath.scala 187:38]
  assign _GEN_3 = _T_333 ? fe_inst : ew_inst; // @[Datapath.scala 187:38]
  assign _GEN_4 = _T_333 ? alu_io_out : ew_alu; // @[Datapath.scala 187:38]
  assign _GEN_5 = _T_333 ? _T_335 : csr_in; // @[Datapath.scala 187:38]
  assign _GEN_6 = _T_333 ? io_ctrl_st_type : st_type; // @[Datapath.scala 187:38]
  assign _GEN_7 = _T_333 ? io_ctrl_ld_type : ld_type; // @[Datapath.scala 187:38]
  assign _GEN_8 = _T_333 ? io_ctrl_wb_sel : wb_sel; // @[Datapath.scala 187:38]
  assign _GEN_9 = _T_333 ? io_ctrl_wb_en : wb_en; // @[Datapath.scala 187:38]
  assign _GEN_10 = _T_333 ? io_ctrl_csr_cmd : csr_cmd; // @[Datapath.scala 187:38]
  assign _GEN_11 = _T_333 ? io_ctrl_illegal : illegal; // @[Datapath.scala 187:38]
  assign _GEN_12 = _T_333 ? _T_243 : pc_check; // @[Datapath.scala 187:38]
  assign _GEN_13 = _T_333 ? rs1_addr : ew_rs1_addr; // @[Datapath.scala 187:38]
  assign _GEN_14 = _T_333 ? rs2_addr : ew_rs2_addr; // @[Datapath.scala 187:38]
  assign _GEN_15 = _T_333 ? rs1 : ew_rs1_rdata; // @[Datapath.scala 187:38]
  assign _GEN_16 = _T_333 ? rs2 : ew_rs2_rdata; // @[Datapath.scala 187:38]
  assign _GEN_17 = _T_333 ? daddr : {{3'd0}, ew_mem_addr}; // @[Datapath.scala 187:38]
  assign _GEN_18 = _T_333 ? {{3'd0}, _T_342} : ew_mem_rmask; // @[Datapath.scala 187:38]
  assign _GEN_19 = _T_333 ? mem_wmask : ew_mem_wmask; // @[Datapath.scala 187:38]
  assign _GEN_20 = _T_333 ? ddata : {{255'd0}, ew_mem_wdata}; // @[Datapath.scala 187:38]
  assign _GEN_21 = _T_322 ? 2'h0 : _GEN_6; // @[Datapath.scala 180:47]
  assign _GEN_22 = _T_322 ? 3'h0 : _GEN_7; // @[Datapath.scala 180:47]
  assign _GEN_23 = _T_322 ? 1'h0 : _GEN_9; // @[Datapath.scala 180:47]
  assign _GEN_24 = _T_322 ? 3'h0 : _GEN_10; // @[Datapath.scala 180:47]
  assign _GEN_25 = _T_322 ? 1'h0 : _GEN_11; // @[Datapath.scala 180:47]
  assign _GEN_26 = _T_322 ? 1'h0 : _GEN_12; // @[Datapath.scala 180:47]
  assign _GEN_27 = _T_322 ? ew_pc : _GEN_2; // @[Datapath.scala 180:47]
  assign _GEN_28 = _T_322 ? ew_inst : _GEN_3; // @[Datapath.scala 180:47]
  assign _GEN_29 = _T_322 ? ew_alu : _GEN_4; // @[Datapath.scala 180:47]
  assign _GEN_30 = _T_322 ? csr_in : _GEN_5; // @[Datapath.scala 180:47]
  assign _GEN_31 = _T_322 ? wb_sel : _GEN_8; // @[Datapath.scala 180:47]
  assign _GEN_32 = _T_322 ? ew_rs1_addr : _GEN_13; // @[Datapath.scala 180:47]
  assign _GEN_33 = _T_322 ? ew_rs2_addr : _GEN_14; // @[Datapath.scala 180:47]
  assign _GEN_34 = _T_322 ? ew_rs1_rdata : _GEN_15; // @[Datapath.scala 180:47]
  assign _GEN_35 = _T_322 ? ew_rs2_rdata : _GEN_16; // @[Datapath.scala 180:47]
  assign _GEN_36 = _T_322 ? {{3'd0}, ew_mem_addr} : _GEN_17; // @[Datapath.scala 180:47]
  assign _GEN_37 = _T_322 ? ew_mem_rmask : _GEN_18; // @[Datapath.scala 180:47]
  assign _GEN_38 = _T_322 ? ew_mem_wmask : _GEN_19; // @[Datapath.scala 180:47]
  assign _GEN_39 = _T_322 ? {{255'd0}, ew_mem_wdata} : _GEN_20; // @[Datapath.scala 180:47]
  assign _T_343 = ew_alu[1]; // @[Datapath.scala 213:23]
  assign _GEN_47 = {{7'd0}, _T_343}; // @[Datapath.scala 213:27]
  assign _T_345 = _GEN_47 << 3'h4; // @[Datapath.scala 213:27]
  assign _T_346 = ew_alu[0]; // @[Datapath.scala 213:42]
  assign _GEN_48 = {{3'd0}, _T_346}; // @[Datapath.scala 213:46]
  assign _T_348 = _GEN_48 << 2'h3; // @[Datapath.scala 213:46]
  assign _GEN_49 = {{4'd0}, _T_348}; // @[Datapath.scala 213:34]
  assign loffset = _T_345 | _GEN_49; // @[Datapath.scala 213:34]
  assign lshift = io_dmemory_resp_bits_data >> loffset; // @[Datapath.scala 214:43]
  assign _T_350 = {1'b0,$signed(io_dmemory_resp_bits_data)}; // @[Datapath.scala 216:56]
  assign _T_351 = lshift[15:0]; // @[Datapath.scala 217:21]
  assign _T_352 = $signed(_T_351); // @[Datapath.scala 217:29]
  assign _T_353 = lshift[7:0]; // @[Datapath.scala 217:53]
  assign _T_354 = $signed(_T_353); // @[Datapath.scala 217:60]
  assign _T_356 = {1'b0,$signed(_T_351)}; // @[Datapath.scala 218:29]
  assign _T_358 = {1'b0,$signed(_T_353)}; // @[Datapath.scala 218:60]
  assign _T_359 = 3'h5 == ld_type; // @[Mux.scala 46:19]
  assign _T_360 = _T_359 ? $signed({{24{_T_358[8]}},_T_358}) : $signed(_T_350); // @[Mux.scala 46:16]
  assign _T_361 = 3'h4 == ld_type; // @[Mux.scala 46:19]
  assign _T_362 = _T_361 ? $signed({{16{_T_356[16]}},_T_356}) : $signed(_T_360); // @[Mux.scala 46:16]
  assign _T_363 = 3'h3 == ld_type; // @[Mux.scala 46:19]
  assign _T_364 = _T_363 ? $signed({{25{_T_354[7]}},_T_354}) : $signed(_T_362); // @[Mux.scala 46:16]
  assign _T_365 = 3'h2 == ld_type; // @[Mux.scala 46:19]
  assign _T_366 = _T_365 ? $signed({{17{_T_352[15]}},_T_352}) : $signed(_T_364); // @[Mux.scala 46:16]
  assign _T_368 = {1'b0,$signed(ew_alu)}; // @[Datapath.scala 235:40]
  assign _T_370 = ew_pc + 33'h4; // @[Datapath.scala 237:22]
  assign _T_371 = _T_370[32:0]; // @[Datapath.scala 237:22]
  assign _T_372 = {1'b0,$signed(_T_371)}; // @[Datapath.scala 237:29]
  assign _T_373 = {1'b0,$signed(csr_io_out)}; // @[Datapath.scala 238:26]
  assign _T_374 = 2'h3 == wb_sel; // @[Mux.scala 46:19]
  assign _T_375 = _T_374 ? $signed(_T_373) : $signed(_T_368); // @[Mux.scala 46:16]
  assign _T_376 = 2'h2 == wb_sel; // @[Mux.scala 46:19]
  assign _T_377 = _T_376 ? $signed(_T_372) : $signed({{1{_T_375[32]}},_T_375}); // @[Mux.scala 46:16]
  assign _T_378 = 2'h1 == wb_sel; // @[Mux.scala 46:19]
  assign _GEN_50 = _T_366[31:0]; // @[Datapath.scala 215:21]
  assign load = $signed(_GEN_50); // @[Datapath.scala 215:21]
  assign _T_379 = _T_378 ? $signed({{2{load[31]}},load}) : $signed(_T_377); // @[Mux.scala 46:16]
  assign _T_380 = $unsigned(_T_379); // @[Datapath.scala 238:34]
  assign _T_382 = wb_rd_addr == 5'h0; // @[Datapath.scala 240:19]
  assign _GEN_40 = _T_382 ? 34'h0 : _T_380; // @[Datapath.scala 240:28]
  assign _T_386 = wb_en & _T_264; // @[Datapath.scala 244:29]
  assign _T_389 = _T_386 & _T_332; // @[Datapath.scala 244:39]
  assign _T_391 = regFile_io_wen ? wb_rd_addr : 5'h0; // @[Datapath.scala 253:10]
  assign _T_393 = regFile_io_wen ? regFile_io_wdata : 32'h0; // @[Datapath.scala 254:10]
  assign _T_396 = reset == 1'h0; // @[Datapath.scala 252:11]
  assign _T_403 = ew_inst != 32'h13; // @[Datapath.scala 259:55]
  assign _T_404 = _T_333 & _T_403; // @[Datapath.scala 259:44]
  assign _GEN_51 = {{63'd0}, rvfi_valid_reg}; // @[Datapath.scala 260:36]
  assign _T_405 = rvfi_order_reg + _GEN_51; // @[Datapath.scala 260:36]
  assign _T_406 = _T_405[63:0]; // @[Datapath.scala 260:36]
  assign _T_411 = wb_en ? wb_rd_addr : 5'h0; // @[Datapath.scala 273:26]
  assign regWrite = _GEN_40[31:0]; // @[Datapath.scala 234:22]
  assign _T_413 = wb_en ? regWrite : 32'h0; // @[Datapath.scala 274:27]
  assign _T_415 = fe_inst == 32'h13; // @[Datapath.scala 277:36]
  assign _T_416 = _T_415 ? pc : fe_pc; // @[Datapath.scala 277:27]
  assign _T_417 = $unsigned(load); // @[Datapath.scala 282:30]
  assign io_imemory_req_valid = _T_264;
  assign io_imemory_req_bits_addr = npc[31:0];
  assign io_dmemory_abort = csr_io_expt;
  assign io_dmemory_req_valid = _T_317;
  assign io_dmemory_req_bits_addr = daddr[31:0];
  assign io_dmemory_req_bits_data = ddata[31:0];
  assign io_dmemory_req_bits_mask = mem_wmask;
  assign io_ctrl_inst = fe_inst;
  assign rvfi_valid = rvfi_valid_reg;
  assign rvfi_order = rvfi_order_reg;
  assign rvfi_insn = rvfi_insn_reg;
  assign rvfi_trap = rvfi_trap_reg;
  assign rvfi_halt = rvfi_halt_reg;
  assign rvfi_rs1_addr = rvfi_rs1_addr_reg;
  assign rvfi_rs2_addr = rvfi_rs2_addr_reg;
  assign rvfi_rs1_rdata = rvfi_rs1_rdata_reg;
  assign rvfi_rs2_rdata = rvfi_rs2_rdata_reg;
  assign rvfi_rd_addr = rvfi_rd_addr_reg;
  assign rvfi_rd_wdata = rvfi_rd_wdata_reg;
  assign rvfi_pc_rdata = rvfi_pc_rdata_reg;
  assign rvfi_pc_wdata = rvfi_pc_wdata_reg;
  assign rvfi_mem_addr = rvfi_mem_addr_reg;
  assign rvfi_mem_rmask = rvfi_mem_rmask_reg;
  assign rvfi_mem_wmask = rvfi_mem_wmask_reg;
  assign rvfi_mem_rdata = rvfi_mem_rdata_reg;
  assign rvfi_mem_wdata = rvfi_mem_wdata_reg;
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_stall = stall;
  assign csr_io_cmd = csr_cmd;
  assign csr_io_in = csr_in;
  assign csr_io_pc = ew_pc[31:0];
  assign csr_io_addr = ew_alu;
  assign csr_io_inst = ew_inst;
  assign csr_io_illegal = illegal;
  assign csr_io_st_type = st_type;
  assign csr_io_ld_type = ld_type;
  assign csr_io_pc_check = pc_check;
  assign regFile_clock = clock;
  assign regFile_io_raddr1 = rs1_addr;
  assign regFile_io_raddr2 = rs2_addr;
  assign regFile_io_wen = _T_389;
  assign regFile_io_waddr = wb_rd_addr;
  assign regFile_io_wdata = regWrite;
  assign alu_io_A = _T_281[31:0];
  assign alu_io_B = _T_283;
  assign alu_io_alu_op = io_ctrl_alu_op;
  assign immGen_io_inst = fe_inst;
  assign immGen_io_sel = io_ctrl_imm_sel;
  assign brCond_io_rs1 = rs1;
  assign brCond_io_rs2 = rs2;
  assign brCond_io_br_type = io_ctrl_br_type;
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  rvfi_valid_reg = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{$random}};
  rvfi_order_reg = _RAND_1[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  rvfi_insn_reg = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  rvfi_trap_reg = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  rvfi_halt_reg = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  rvfi_rs1_addr_reg = _RAND_5[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  rvfi_rs2_addr_reg = _RAND_6[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  rvfi_rs1_rdata_reg = _RAND_7[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  rvfi_rs2_rdata_reg = _RAND_8[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  rvfi_rd_addr_reg = _RAND_9[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  rvfi_rd_wdata_reg = _RAND_10[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  rvfi_pc_rdata_reg = _RAND_11[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  rvfi_pc_wdata_reg = _RAND_12[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  rvfi_mem_addr_reg = _RAND_13[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  rvfi_mem_rmask_reg = _RAND_14[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  rvfi_mem_wmask_reg = _RAND_15[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  rvfi_mem_rdata_reg = _RAND_16[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  rvfi_mem_wdata_reg = _RAND_17[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  fe_inst = _RAND_18[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {2{$random}};
  fe_pc = _RAND_19[32:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  ew_inst = _RAND_20[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {2{$random}};
  ew_pc = _RAND_21[32:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{$random}};
  ew_alu = _RAND_22[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{$random}};
  csr_in = _RAND_23[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{$random}};
  ew_rs1_addr = _RAND_24[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{$random}};
  ew_rs2_addr = _RAND_25[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{$random}};
  ew_rs1_rdata = _RAND_26[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{$random}};
  ew_rs2_rdata = _RAND_27[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{$random}};
  ew_mem_addr = _RAND_28[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{$random}};
  ew_mem_rmask = _RAND_29[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{$random}};
  ew_mem_wmask = _RAND_30[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{$random}};
  ew_mem_wdata = _RAND_31[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{$random}};
  st_type = _RAND_32[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{$random}};
  ld_type = _RAND_33[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{$random}};
  wb_sel = _RAND_34[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{$random}};
  wb_en = _RAND_35[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{$random}};
  csr_cmd = _RAND_36[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{$random}};
  illegal = _RAND_37[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{$random}};
  pc_check = _RAND_38[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{$random}};
  started = _RAND_39[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {2{$random}};
  pc = _RAND_40[32:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      rvfi_valid_reg <= 1'h0;
    end else begin
      rvfi_valid_reg <= _T_404;
    end
    if (reset) begin
      rvfi_order_reg <= 64'h0;
    end else begin
      rvfi_order_reg <= _T_406;
    end
    if (reset) begin
      rvfi_insn_reg <= 32'h0;
    end else begin
      rvfi_insn_reg <= ew_inst;
    end
    if (reset) begin
      rvfi_trap_reg <= 1'h0;
    end else begin
      rvfi_trap_reg <= stall;
    end
    if (reset) begin
      rvfi_halt_reg <= 1'h0;
    end else begin
      rvfi_halt_reg <= stall;
    end
    if (reset) begin
      rvfi_rs1_addr_reg <= 5'h0;
    end else begin
      rvfi_rs1_addr_reg <= ew_rs1_addr;
    end
    if (reset) begin
      rvfi_rs2_addr_reg <= 5'h0;
    end else begin
      rvfi_rs2_addr_reg <= ew_rs2_addr;
    end
    if (reset) begin
      rvfi_rs1_rdata_reg <= 32'h0;
    end else begin
      rvfi_rs1_rdata_reg <= ew_rs1_rdata;
    end
    if (reset) begin
      rvfi_rs2_rdata_reg <= 32'h0;
    end else begin
      rvfi_rs2_rdata_reg <= ew_rs2_rdata;
    end
    if (reset) begin
      rvfi_rd_addr_reg <= 5'h0;
    end else begin
      if (wb_en) begin
        rvfi_rd_addr_reg <= wb_rd_addr;
      end else begin
        rvfi_rd_addr_reg <= 5'h0;
      end
    end
    if (reset) begin
      rvfi_rd_wdata_reg <= 32'h0;
    end else begin
      if (wb_en) begin
        rvfi_rd_wdata_reg <= regWrite;
      end else begin
        rvfi_rd_wdata_reg <= 32'h0;
      end
    end
    if (reset) begin
      rvfi_pc_rdata_reg <= 32'h0;
    end else begin
      rvfi_pc_rdata_reg <= ew_pc[31:0];
    end
    if (reset) begin
      rvfi_pc_wdata_reg <= 32'h0;
    end else begin
      rvfi_pc_wdata_reg <= _T_416[31:0];
    end
    if (reset) begin
      rvfi_mem_addr_reg <= 32'h0;
    end else begin
      rvfi_mem_addr_reg <= ew_mem_addr;
    end
    if (reset) begin
      rvfi_mem_rmask_reg <= 4'h0;
    end else begin
      rvfi_mem_rmask_reg <= ew_mem_rmask;
    end
    if (reset) begin
      rvfi_mem_wmask_reg <= 4'h0;
    end else begin
      rvfi_mem_wmask_reg <= ew_mem_wmask;
    end
    if (reset) begin
      rvfi_mem_rdata_reg <= 32'h0;
    end else begin
      rvfi_mem_rdata_reg <= _T_417;
    end
    if (reset) begin
      rvfi_mem_wdata_reg <= 32'h0;
    end else begin
      rvfi_mem_wdata_reg <= ew_mem_wdata;
    end
    if (reset) begin
      fe_inst <= 32'h13;
    end else begin
      if (_T_264) begin
        if (_T_259) begin
          fe_inst <= 32'h13;
        end else begin
          fe_inst <= io_imemory_resp_bits_data;
        end
      end
    end
    if (_T_264) begin
      fe_pc <= pc;
    end
    if (reset) begin
      ew_inst <= 32'h13;
    end else begin
      if (!(_T_322)) begin
        if (_T_333) begin
          ew_inst <= fe_inst;
        end
      end
    end
    if (!(_T_322)) begin
      if (_T_333) begin
        ew_pc <= fe_pc;
      end
    end
    if (!(_T_322)) begin
      if (_T_333) begin
        ew_alu <= alu_io_out;
      end
    end
    if (!(_T_322)) begin
      if (_T_333) begin
        if (_T_334) begin
          csr_in <= immGen_io_out;
        end else begin
          if (_T_277) begin
            csr_in <= ew_alu;
          end else begin
            csr_in <= regFile_io_rdata1;
          end
        end
      end
    end
    if (!(_T_322)) begin
      if (_T_333) begin
        ew_rs1_addr <= rs1_addr;
      end
    end
    if (!(_T_322)) begin
      if (_T_333) begin
        ew_rs2_addr <= rs2_addr;
      end
    end
    if (!(_T_322)) begin
      if (_T_333) begin
        if (_T_277) begin
          ew_rs1_rdata <= ew_alu;
        end else begin
          ew_rs1_rdata <= regFile_io_rdata1;
        end
      end
    end
    if (!(_T_322)) begin
      if (_T_333) begin
        if (_T_279) begin
          ew_rs2_rdata <= ew_alu;
        end else begin
          ew_rs2_rdata <= regFile_io_rdata2;
        end
      end
    end
    ew_mem_addr <= _GEN_36[31:0];
    if (!(_T_322)) begin
      if (_T_333) begin
        ew_mem_rmask <= {{3'd0}, _T_342};
      end
    end
    if (!(_T_322)) begin
      if (_T_333) begin
        ew_mem_wmask <= mem_wmask;
      end
    end
    ew_mem_wdata <= _GEN_39[31:0];
    if (_T_322) begin
      st_type <= 2'h0;
    end else begin
      if (_T_333) begin
        st_type <= io_ctrl_st_type;
      end
    end
    if (_T_322) begin
      ld_type <= 3'h0;
    end else begin
      if (_T_333) begin
        ld_type <= io_ctrl_ld_type;
      end
    end
    if (!(_T_322)) begin
      if (_T_333) begin
        wb_sel <= io_ctrl_wb_sel;
      end
    end
    if (_T_322) begin
      wb_en <= 1'h0;
    end else begin
      if (_T_333) begin
        wb_en <= io_ctrl_wb_en;
      end
    end
    if (_T_322) begin
      csr_cmd <= 3'h0;
    end else begin
      if (_T_333) begin
        csr_cmd <= io_ctrl_csr_cmd;
      end
    end
    if (_T_322) begin
      illegal <= 1'h0;
    end else begin
      if (_T_333) begin
        illegal <= io_ctrl_illegal;
      end
    end
    if (_T_322) begin
      pc_check <= 1'h0;
    end else begin
      if (_T_333) begin
        pc_check <= _T_243;
      end
    end
    started <= reset;
    if (reset) begin
      pc <= {{1'd0}, _T_240};
    end else begin
      if (!(stall)) begin
        if (csr_io_expt) begin
          pc <= {{1'd0}, csr_io_evec};
        end else begin
          if (_T_242) begin
            pc <= {{1'd0}, csr_io_epc};
          end else begin
            if (_T_244) begin
              pc <= _T_248;
            end else begin
              if (!(_T_249)) begin
                pc <= _T_252;
              end
            end
          end
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_396) begin
          $fwrite(32'h80000002,"PC: %h, INST: %h, REG[%d] <- %h\n",ew_pc,ew_inst,_T_391,_T_393); // @[Datapath.scala 252:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module Control(
  input  [31:0] io_inst,
  output [1:0]  io_pc_sel,
  output        io_inst_kill,
  output        io_A_sel,
  output        io_B_sel,
  output [2:0]  io_imm_sel,
  output [3:0]  io_alu_op,
  output [2:0]  io_br_type,
  output [1:0]  io_st_type,
  output [2:0]  io_ld_type,
  output [1:0]  io_wb_sel,
  output        io_wb_en,
  output [2:0]  io_csr_cmd,
  output        io_illegal
);
  wire [31:0] _T_35; // @[Lookup.scala 9:38]
  wire  _T_36; // @[Lookup.scala 9:38]
  wire  _T_40; // @[Lookup.scala 9:38]
  wire  _T_44; // @[Lookup.scala 9:38]
  wire [31:0] _T_47; // @[Lookup.scala 9:38]
  wire  _T_48; // @[Lookup.scala 9:38]
  wire  _T_52; // @[Lookup.scala 9:38]
  wire  _T_56; // @[Lookup.scala 9:38]
  wire  _T_60; // @[Lookup.scala 9:38]
  wire  _T_64; // @[Lookup.scala 9:38]
  wire  _T_68; // @[Lookup.scala 9:38]
  wire  _T_72; // @[Lookup.scala 9:38]
  wire  _T_76; // @[Lookup.scala 9:38]
  wire  _T_80; // @[Lookup.scala 9:38]
  wire  _T_84; // @[Lookup.scala 9:38]
  wire  _T_88; // @[Lookup.scala 9:38]
  wire  _T_92; // @[Lookup.scala 9:38]
  wire  _T_96; // @[Lookup.scala 9:38]
  wire  _T_100; // @[Lookup.scala 9:38]
  wire  _T_104; // @[Lookup.scala 9:38]
  wire  _T_108; // @[Lookup.scala 9:38]
  wire  _T_112; // @[Lookup.scala 9:38]
  wire  _T_116; // @[Lookup.scala 9:38]
  wire  _T_120; // @[Lookup.scala 9:38]
  wire  _T_124; // @[Lookup.scala 9:38]
  wire  _T_128; // @[Lookup.scala 9:38]
  wire [31:0] _T_131; // @[Lookup.scala 9:38]
  wire  _T_132; // @[Lookup.scala 9:38]
  wire  _T_136; // @[Lookup.scala 9:38]
  wire  _T_140; // @[Lookup.scala 9:38]
  wire  _T_144; // @[Lookup.scala 9:38]
  wire  _T_148; // @[Lookup.scala 9:38]
  wire  _T_152; // @[Lookup.scala 9:38]
  wire  _T_156; // @[Lookup.scala 9:38]
  wire  _T_160; // @[Lookup.scala 9:38]
  wire  _T_164; // @[Lookup.scala 9:38]
  wire  _T_168; // @[Lookup.scala 9:38]
  wire  _T_172; // @[Lookup.scala 9:38]
  wire  _T_176; // @[Lookup.scala 9:38]
  wire  _T_180; // @[Lookup.scala 9:38]
  wire [31:0] _T_183; // @[Lookup.scala 9:38]
  wire  _T_184; // @[Lookup.scala 9:38]
  wire  _T_188; // @[Lookup.scala 9:38]
  wire  _T_192; // @[Lookup.scala 9:38]
  wire  _T_196; // @[Lookup.scala 9:38]
  wire  _T_200; // @[Lookup.scala 9:38]
  wire  _T_204; // @[Lookup.scala 9:38]
  wire  _T_208; // @[Lookup.scala 9:38]
  wire  _T_212; // @[Lookup.scala 9:38]
  wire  _T_216; // @[Lookup.scala 9:38]
  wire  _T_220; // @[Lookup.scala 9:38]
  wire  _T_224; // @[Lookup.scala 9:38]
  wire  _T_228; // @[Lookup.scala 9:38]
  wire [1:0] _T_230; // @[Lookup.scala 11:37]
  wire [1:0] _T_231; // @[Lookup.scala 11:37]
  wire [1:0] _T_232; // @[Lookup.scala 11:37]
  wire [1:0] _T_233; // @[Lookup.scala 11:37]
  wire [1:0] _T_234; // @[Lookup.scala 11:37]
  wire [1:0] _T_235; // @[Lookup.scala 11:37]
  wire [1:0] _T_236; // @[Lookup.scala 11:37]
  wire [1:0] _T_237; // @[Lookup.scala 11:37]
  wire [1:0] _T_238; // @[Lookup.scala 11:37]
  wire [1:0] _T_239; // @[Lookup.scala 11:37]
  wire [1:0] _T_240; // @[Lookup.scala 11:37]
  wire [1:0] _T_241; // @[Lookup.scala 11:37]
  wire [1:0] _T_242; // @[Lookup.scala 11:37]
  wire [1:0] _T_243; // @[Lookup.scala 11:37]
  wire [1:0] _T_244; // @[Lookup.scala 11:37]
  wire [1:0] _T_245; // @[Lookup.scala 11:37]
  wire [1:0] _T_246; // @[Lookup.scala 11:37]
  wire [1:0] _T_247; // @[Lookup.scala 11:37]
  wire [1:0] _T_248; // @[Lookup.scala 11:37]
  wire [1:0] _T_249; // @[Lookup.scala 11:37]
  wire [1:0] _T_250; // @[Lookup.scala 11:37]
  wire [1:0] _T_251; // @[Lookup.scala 11:37]
  wire [1:0] _T_252; // @[Lookup.scala 11:37]
  wire [1:0] _T_253; // @[Lookup.scala 11:37]
  wire [1:0] _T_254; // @[Lookup.scala 11:37]
  wire [1:0] _T_255; // @[Lookup.scala 11:37]
  wire [1:0] _T_256; // @[Lookup.scala 11:37]
  wire [1:0] _T_257; // @[Lookup.scala 11:37]
  wire [1:0] _T_258; // @[Lookup.scala 11:37]
  wire [1:0] _T_259; // @[Lookup.scala 11:37]
  wire [1:0] _T_260; // @[Lookup.scala 11:37]
  wire [1:0] _T_261; // @[Lookup.scala 11:37]
  wire [1:0] _T_262; // @[Lookup.scala 11:37]
  wire [1:0] _T_263; // @[Lookup.scala 11:37]
  wire [1:0] _T_264; // @[Lookup.scala 11:37]
  wire [1:0] _T_265; // @[Lookup.scala 11:37]
  wire [1:0] _T_266; // @[Lookup.scala 11:37]
  wire [1:0] _T_267; // @[Lookup.scala 11:37]
  wire [1:0] _T_268; // @[Lookup.scala 11:37]
  wire [1:0] _T_269; // @[Lookup.scala 11:37]
  wire [1:0] _T_270; // @[Lookup.scala 11:37]
  wire [1:0] _T_271; // @[Lookup.scala 11:37]
  wire [1:0] _T_272; // @[Lookup.scala 11:37]
  wire [1:0] _T_273; // @[Lookup.scala 11:37]
  wire [1:0] _T_274; // @[Lookup.scala 11:37]
  wire [1:0] _T_275; // @[Lookup.scala 11:37]
  wire [1:0] _T_276; // @[Lookup.scala 11:37]
  wire [1:0] ctrlSignals_0; // @[Lookup.scala 11:37]
  wire  _T_285; // @[Lookup.scala 11:37]
  wire  _T_286; // @[Lookup.scala 11:37]
  wire  _T_287; // @[Lookup.scala 11:37]
  wire  _T_288; // @[Lookup.scala 11:37]
  wire  _T_289; // @[Lookup.scala 11:37]
  wire  _T_290; // @[Lookup.scala 11:37]
  wire  _T_291; // @[Lookup.scala 11:37]
  wire  _T_292; // @[Lookup.scala 11:37]
  wire  _T_293; // @[Lookup.scala 11:37]
  wire  _T_294; // @[Lookup.scala 11:37]
  wire  _T_295; // @[Lookup.scala 11:37]
  wire  _T_296; // @[Lookup.scala 11:37]
  wire  _T_297; // @[Lookup.scala 11:37]
  wire  _T_298; // @[Lookup.scala 11:37]
  wire  _T_299; // @[Lookup.scala 11:37]
  wire  _T_300; // @[Lookup.scala 11:37]
  wire  _T_301; // @[Lookup.scala 11:37]
  wire  _T_302; // @[Lookup.scala 11:37]
  wire  _T_303; // @[Lookup.scala 11:37]
  wire  _T_304; // @[Lookup.scala 11:37]
  wire  _T_305; // @[Lookup.scala 11:37]
  wire  _T_306; // @[Lookup.scala 11:37]
  wire  _T_307; // @[Lookup.scala 11:37]
  wire  _T_308; // @[Lookup.scala 11:37]
  wire  _T_309; // @[Lookup.scala 11:37]
  wire  _T_310; // @[Lookup.scala 11:37]
  wire  _T_311; // @[Lookup.scala 11:37]
  wire  _T_312; // @[Lookup.scala 11:37]
  wire  _T_313; // @[Lookup.scala 11:37]
  wire  _T_314; // @[Lookup.scala 11:37]
  wire  _T_315; // @[Lookup.scala 11:37]
  wire  _T_316; // @[Lookup.scala 11:37]
  wire  _T_317; // @[Lookup.scala 11:37]
  wire  _T_318; // @[Lookup.scala 11:37]
  wire  _T_319; // @[Lookup.scala 11:37]
  wire  _T_320; // @[Lookup.scala 11:37]
  wire  _T_321; // @[Lookup.scala 11:37]
  wire  _T_322; // @[Lookup.scala 11:37]
  wire  _T_323; // @[Lookup.scala 11:37]
  wire  _T_324; // @[Lookup.scala 11:37]
  wire  ctrlSignals_1; // @[Lookup.scala 11:37]
  wire  _T_338; // @[Lookup.scala 11:37]
  wire  _T_339; // @[Lookup.scala 11:37]
  wire  _T_340; // @[Lookup.scala 11:37]
  wire  _T_341; // @[Lookup.scala 11:37]
  wire  _T_342; // @[Lookup.scala 11:37]
  wire  _T_343; // @[Lookup.scala 11:37]
  wire  _T_344; // @[Lookup.scala 11:37]
  wire  _T_345; // @[Lookup.scala 11:37]
  wire  _T_346; // @[Lookup.scala 11:37]
  wire  _T_347; // @[Lookup.scala 11:37]
  wire  _T_348; // @[Lookup.scala 11:37]
  wire  _T_349; // @[Lookup.scala 11:37]
  wire  _T_350; // @[Lookup.scala 11:37]
  wire  _T_351; // @[Lookup.scala 11:37]
  wire  _T_352; // @[Lookup.scala 11:37]
  wire  _T_353; // @[Lookup.scala 11:37]
  wire  _T_354; // @[Lookup.scala 11:37]
  wire  _T_355; // @[Lookup.scala 11:37]
  wire  _T_356; // @[Lookup.scala 11:37]
  wire  _T_357; // @[Lookup.scala 11:37]
  wire  _T_358; // @[Lookup.scala 11:37]
  wire  _T_359; // @[Lookup.scala 11:37]
  wire  _T_360; // @[Lookup.scala 11:37]
  wire  _T_361; // @[Lookup.scala 11:37]
  wire  _T_362; // @[Lookup.scala 11:37]
  wire  _T_363; // @[Lookup.scala 11:37]
  wire  _T_364; // @[Lookup.scala 11:37]
  wire  _T_365; // @[Lookup.scala 11:37]
  wire  _T_366; // @[Lookup.scala 11:37]
  wire  _T_367; // @[Lookup.scala 11:37]
  wire  _T_368; // @[Lookup.scala 11:37]
  wire  _T_369; // @[Lookup.scala 11:37]
  wire  _T_370; // @[Lookup.scala 11:37]
  wire  _T_371; // @[Lookup.scala 11:37]
  wire  _T_372; // @[Lookup.scala 11:37]
  wire  ctrlSignals_2; // @[Lookup.scala 11:37]
  wire [2:0] _T_377; // @[Lookup.scala 11:37]
  wire [2:0] _T_378; // @[Lookup.scala 11:37]
  wire [2:0] _T_379; // @[Lookup.scala 11:37]
  wire [2:0] _T_380; // @[Lookup.scala 11:37]
  wire [2:0] _T_381; // @[Lookup.scala 11:37]
  wire [2:0] _T_382; // @[Lookup.scala 11:37]
  wire [2:0] _T_383; // @[Lookup.scala 11:37]
  wire [2:0] _T_384; // @[Lookup.scala 11:37]
  wire [2:0] _T_385; // @[Lookup.scala 11:37]
  wire [2:0] _T_386; // @[Lookup.scala 11:37]
  wire [2:0] _T_387; // @[Lookup.scala 11:37]
  wire [2:0] _T_388; // @[Lookup.scala 11:37]
  wire [2:0] _T_389; // @[Lookup.scala 11:37]
  wire [2:0] _T_390; // @[Lookup.scala 11:37]
  wire [2:0] _T_391; // @[Lookup.scala 11:37]
  wire [2:0] _T_392; // @[Lookup.scala 11:37]
  wire [2:0] _T_393; // @[Lookup.scala 11:37]
  wire [2:0] _T_394; // @[Lookup.scala 11:37]
  wire [2:0] _T_395; // @[Lookup.scala 11:37]
  wire [2:0] _T_396; // @[Lookup.scala 11:37]
  wire [2:0] _T_397; // @[Lookup.scala 11:37]
  wire [2:0] _T_398; // @[Lookup.scala 11:37]
  wire [2:0] _T_399; // @[Lookup.scala 11:37]
  wire [2:0] _T_400; // @[Lookup.scala 11:37]
  wire [2:0] _T_401; // @[Lookup.scala 11:37]
  wire [2:0] _T_402; // @[Lookup.scala 11:37]
  wire [2:0] _T_403; // @[Lookup.scala 11:37]
  wire [2:0] _T_404; // @[Lookup.scala 11:37]
  wire [2:0] _T_405; // @[Lookup.scala 11:37]
  wire [2:0] _T_406; // @[Lookup.scala 11:37]
  wire [2:0] _T_407; // @[Lookup.scala 11:37]
  wire [2:0] _T_408; // @[Lookup.scala 11:37]
  wire [2:0] _T_409; // @[Lookup.scala 11:37]
  wire [2:0] _T_410; // @[Lookup.scala 11:37]
  wire [2:0] _T_411; // @[Lookup.scala 11:37]
  wire [2:0] _T_412; // @[Lookup.scala 11:37]
  wire [2:0] _T_413; // @[Lookup.scala 11:37]
  wire [2:0] _T_414; // @[Lookup.scala 11:37]
  wire [2:0] _T_415; // @[Lookup.scala 11:37]
  wire [2:0] _T_416; // @[Lookup.scala 11:37]
  wire [2:0] _T_417; // @[Lookup.scala 11:37]
  wire [2:0] _T_418; // @[Lookup.scala 11:37]
  wire [2:0] _T_419; // @[Lookup.scala 11:37]
  wire [2:0] _T_420; // @[Lookup.scala 11:37]
  wire [2:0] ctrlSignals_3; // @[Lookup.scala 11:37]
  wire [3:0] _T_428; // @[Lookup.scala 11:37]
  wire [3:0] _T_429; // @[Lookup.scala 11:37]
  wire [3:0] _T_430; // @[Lookup.scala 11:37]
  wire [3:0] _T_431; // @[Lookup.scala 11:37]
  wire [3:0] _T_432; // @[Lookup.scala 11:37]
  wire [3:0] _T_433; // @[Lookup.scala 11:37]
  wire [3:0] _T_434; // @[Lookup.scala 11:37]
  wire [3:0] _T_435; // @[Lookup.scala 11:37]
  wire [3:0] _T_436; // @[Lookup.scala 11:37]
  wire [3:0] _T_437; // @[Lookup.scala 11:37]
  wire [3:0] _T_438; // @[Lookup.scala 11:37]
  wire [3:0] _T_439; // @[Lookup.scala 11:37]
  wire [3:0] _T_440; // @[Lookup.scala 11:37]
  wire [3:0] _T_441; // @[Lookup.scala 11:37]
  wire [3:0] _T_442; // @[Lookup.scala 11:37]
  wire [3:0] _T_443; // @[Lookup.scala 11:37]
  wire [3:0] _T_444; // @[Lookup.scala 11:37]
  wire [3:0] _T_445; // @[Lookup.scala 11:37]
  wire [3:0] _T_446; // @[Lookup.scala 11:37]
  wire [3:0] _T_447; // @[Lookup.scala 11:37]
  wire [3:0] _T_448; // @[Lookup.scala 11:37]
  wire [3:0] _T_449; // @[Lookup.scala 11:37]
  wire [3:0] _T_450; // @[Lookup.scala 11:37]
  wire [3:0] _T_451; // @[Lookup.scala 11:37]
  wire [3:0] _T_452; // @[Lookup.scala 11:37]
  wire [3:0] _T_453; // @[Lookup.scala 11:37]
  wire [3:0] _T_454; // @[Lookup.scala 11:37]
  wire [3:0] _T_455; // @[Lookup.scala 11:37]
  wire [3:0] _T_456; // @[Lookup.scala 11:37]
  wire [3:0] _T_457; // @[Lookup.scala 11:37]
  wire [3:0] _T_458; // @[Lookup.scala 11:37]
  wire [3:0] _T_459; // @[Lookup.scala 11:37]
  wire [3:0] _T_460; // @[Lookup.scala 11:37]
  wire [3:0] _T_461; // @[Lookup.scala 11:37]
  wire [3:0] _T_462; // @[Lookup.scala 11:37]
  wire [3:0] _T_463; // @[Lookup.scala 11:37]
  wire [3:0] _T_464; // @[Lookup.scala 11:37]
  wire [3:0] _T_465; // @[Lookup.scala 11:37]
  wire [3:0] _T_466; // @[Lookup.scala 11:37]
  wire [3:0] _T_467; // @[Lookup.scala 11:37]
  wire [3:0] _T_468; // @[Lookup.scala 11:37]
  wire [3:0] ctrlSignals_4; // @[Lookup.scala 11:37]
  wire [2:0] _T_508; // @[Lookup.scala 11:37]
  wire [2:0] _T_509; // @[Lookup.scala 11:37]
  wire [2:0] _T_510; // @[Lookup.scala 11:37]
  wire [2:0] _T_511; // @[Lookup.scala 11:37]
  wire [2:0] _T_512; // @[Lookup.scala 11:37]
  wire [2:0] _T_513; // @[Lookup.scala 11:37]
  wire [2:0] _T_514; // @[Lookup.scala 11:37]
  wire [2:0] _T_515; // @[Lookup.scala 11:37]
  wire [2:0] _T_516; // @[Lookup.scala 11:37]
  wire [2:0] ctrlSignals_5; // @[Lookup.scala 11:37]
  wire  _T_519; // @[Lookup.scala 11:37]
  wire  _T_520; // @[Lookup.scala 11:37]
  wire  _T_521; // @[Lookup.scala 11:37]
  wire  _T_522; // @[Lookup.scala 11:37]
  wire  _T_523; // @[Lookup.scala 11:37]
  wire  _T_524; // @[Lookup.scala 11:37]
  wire  _T_525; // @[Lookup.scala 11:37]
  wire  _T_526; // @[Lookup.scala 11:37]
  wire  _T_527; // @[Lookup.scala 11:37]
  wire  _T_528; // @[Lookup.scala 11:37]
  wire  _T_529; // @[Lookup.scala 11:37]
  wire  _T_530; // @[Lookup.scala 11:37]
  wire  _T_531; // @[Lookup.scala 11:37]
  wire  _T_532; // @[Lookup.scala 11:37]
  wire  _T_533; // @[Lookup.scala 11:37]
  wire  _T_534; // @[Lookup.scala 11:37]
  wire  _T_535; // @[Lookup.scala 11:37]
  wire  _T_536; // @[Lookup.scala 11:37]
  wire  _T_537; // @[Lookup.scala 11:37]
  wire  _T_538; // @[Lookup.scala 11:37]
  wire  _T_539; // @[Lookup.scala 11:37]
  wire  _T_540; // @[Lookup.scala 11:37]
  wire  _T_541; // @[Lookup.scala 11:37]
  wire  _T_542; // @[Lookup.scala 11:37]
  wire  _T_543; // @[Lookup.scala 11:37]
  wire  _T_544; // @[Lookup.scala 11:37]
  wire  _T_545; // @[Lookup.scala 11:37]
  wire  _T_546; // @[Lookup.scala 11:37]
  wire  _T_547; // @[Lookup.scala 11:37]
  wire  _T_548; // @[Lookup.scala 11:37]
  wire  _T_549; // @[Lookup.scala 11:37]
  wire  _T_550; // @[Lookup.scala 11:37]
  wire  _T_551; // @[Lookup.scala 11:37]
  wire  _T_552; // @[Lookup.scala 11:37]
  wire  _T_553; // @[Lookup.scala 11:37]
  wire  _T_554; // @[Lookup.scala 11:37]
  wire  _T_555; // @[Lookup.scala 11:37]
  wire  _T_556; // @[Lookup.scala 11:37]
  wire  _T_557; // @[Lookup.scala 11:37]
  wire  _T_558; // @[Lookup.scala 11:37]
  wire  _T_559; // @[Lookup.scala 11:37]
  wire  _T_560; // @[Lookup.scala 11:37]
  wire  _T_561; // @[Lookup.scala 11:37]
  wire  _T_562; // @[Lookup.scala 11:37]
  wire  _T_563; // @[Lookup.scala 11:37]
  wire  _T_564; // @[Lookup.scala 11:37]
  wire  ctrlSignals_6; // @[Lookup.scala 11:37]
  wire [1:0] _T_596; // @[Lookup.scala 11:37]
  wire [1:0] _T_597; // @[Lookup.scala 11:37]
  wire [1:0] _T_598; // @[Lookup.scala 11:37]
  wire [1:0] _T_599; // @[Lookup.scala 11:37]
  wire [1:0] _T_600; // @[Lookup.scala 11:37]
  wire [1:0] _T_601; // @[Lookup.scala 11:37]
  wire [1:0] _T_602; // @[Lookup.scala 11:37]
  wire [1:0] _T_603; // @[Lookup.scala 11:37]
  wire [1:0] _T_604; // @[Lookup.scala 11:37]
  wire [1:0] _T_605; // @[Lookup.scala 11:37]
  wire [1:0] _T_606; // @[Lookup.scala 11:37]
  wire [1:0] _T_607; // @[Lookup.scala 11:37]
  wire [1:0] _T_608; // @[Lookup.scala 11:37]
  wire [1:0] _T_609; // @[Lookup.scala 11:37]
  wire [1:0] _T_610; // @[Lookup.scala 11:37]
  wire [1:0] _T_611; // @[Lookup.scala 11:37]
  wire [1:0] _T_612; // @[Lookup.scala 11:37]
  wire [1:0] ctrlSignals_7; // @[Lookup.scala 11:37]
  wire [2:0] _T_647; // @[Lookup.scala 11:37]
  wire [2:0] _T_648; // @[Lookup.scala 11:37]
  wire [2:0] _T_649; // @[Lookup.scala 11:37]
  wire [2:0] _T_650; // @[Lookup.scala 11:37]
  wire [2:0] _T_651; // @[Lookup.scala 11:37]
  wire [2:0] _T_652; // @[Lookup.scala 11:37]
  wire [2:0] _T_653; // @[Lookup.scala 11:37]
  wire [2:0] _T_654; // @[Lookup.scala 11:37]
  wire [2:0] _T_655; // @[Lookup.scala 11:37]
  wire [2:0] _T_656; // @[Lookup.scala 11:37]
  wire [2:0] _T_657; // @[Lookup.scala 11:37]
  wire [2:0] _T_658; // @[Lookup.scala 11:37]
  wire [2:0] _T_659; // @[Lookup.scala 11:37]
  wire [2:0] _T_660; // @[Lookup.scala 11:37]
  wire [2:0] ctrlSignals_8; // @[Lookup.scala 11:37]
  wire [1:0] _T_663; // @[Lookup.scala 11:37]
  wire [1:0] _T_664; // @[Lookup.scala 11:37]
  wire [1:0] _T_665; // @[Lookup.scala 11:37]
  wire [1:0] _T_666; // @[Lookup.scala 11:37]
  wire [1:0] _T_667; // @[Lookup.scala 11:37]
  wire [1:0] _T_668; // @[Lookup.scala 11:37]
  wire [1:0] _T_669; // @[Lookup.scala 11:37]
  wire [1:0] _T_670; // @[Lookup.scala 11:37]
  wire [1:0] _T_671; // @[Lookup.scala 11:37]
  wire [1:0] _T_672; // @[Lookup.scala 11:37]
  wire [1:0] _T_673; // @[Lookup.scala 11:37]
  wire [1:0] _T_674; // @[Lookup.scala 11:37]
  wire [1:0] _T_675; // @[Lookup.scala 11:37]
  wire [1:0] _T_676; // @[Lookup.scala 11:37]
  wire [1:0] _T_677; // @[Lookup.scala 11:37]
  wire [1:0] _T_678; // @[Lookup.scala 11:37]
  wire [1:0] _T_679; // @[Lookup.scala 11:37]
  wire [1:0] _T_680; // @[Lookup.scala 11:37]
  wire [1:0] _T_681; // @[Lookup.scala 11:37]
  wire [1:0] _T_682; // @[Lookup.scala 11:37]
  wire [1:0] _T_683; // @[Lookup.scala 11:37]
  wire [1:0] _T_684; // @[Lookup.scala 11:37]
  wire [1:0] _T_685; // @[Lookup.scala 11:37]
  wire [1:0] _T_686; // @[Lookup.scala 11:37]
  wire [1:0] _T_687; // @[Lookup.scala 11:37]
  wire [1:0] _T_688; // @[Lookup.scala 11:37]
  wire [1:0] _T_689; // @[Lookup.scala 11:37]
  wire [1:0] _T_690; // @[Lookup.scala 11:37]
  wire [1:0] _T_691; // @[Lookup.scala 11:37]
  wire [1:0] _T_692; // @[Lookup.scala 11:37]
  wire [1:0] _T_693; // @[Lookup.scala 11:37]
  wire [1:0] _T_694; // @[Lookup.scala 11:37]
  wire [1:0] _T_695; // @[Lookup.scala 11:37]
  wire [1:0] _T_696; // @[Lookup.scala 11:37]
  wire [1:0] _T_697; // @[Lookup.scala 11:37]
  wire [1:0] _T_698; // @[Lookup.scala 11:37]
  wire [1:0] _T_699; // @[Lookup.scala 11:37]
  wire [1:0] _T_700; // @[Lookup.scala 11:37]
  wire [1:0] _T_701; // @[Lookup.scala 11:37]
  wire [1:0] _T_702; // @[Lookup.scala 11:37]
  wire [1:0] _T_703; // @[Lookup.scala 11:37]
  wire [1:0] _T_704; // @[Lookup.scala 11:37]
  wire [1:0] _T_705; // @[Lookup.scala 11:37]
  wire [1:0] _T_706; // @[Lookup.scala 11:37]
  wire [1:0] _T_707; // @[Lookup.scala 11:37]
  wire [1:0] _T_708; // @[Lookup.scala 11:37]
  wire [1:0] ctrlSignals_9; // @[Lookup.scala 11:37]
  wire  _T_714; // @[Lookup.scala 11:37]
  wire  _T_715; // @[Lookup.scala 11:37]
  wire  _T_716; // @[Lookup.scala 11:37]
  wire  _T_717; // @[Lookup.scala 11:37]
  wire  _T_718; // @[Lookup.scala 11:37]
  wire  _T_719; // @[Lookup.scala 11:37]
  wire  _T_720; // @[Lookup.scala 11:37]
  wire  _T_721; // @[Lookup.scala 11:37]
  wire  _T_722; // @[Lookup.scala 11:37]
  wire  _T_723; // @[Lookup.scala 11:37]
  wire  _T_724; // @[Lookup.scala 11:37]
  wire  _T_725; // @[Lookup.scala 11:37]
  wire  _T_726; // @[Lookup.scala 11:37]
  wire  _T_727; // @[Lookup.scala 11:37]
  wire  _T_728; // @[Lookup.scala 11:37]
  wire  _T_729; // @[Lookup.scala 11:37]
  wire  _T_730; // @[Lookup.scala 11:37]
  wire  _T_731; // @[Lookup.scala 11:37]
  wire  _T_732; // @[Lookup.scala 11:37]
  wire  _T_733; // @[Lookup.scala 11:37]
  wire  _T_734; // @[Lookup.scala 11:37]
  wire  _T_735; // @[Lookup.scala 11:37]
  wire  _T_736; // @[Lookup.scala 11:37]
  wire  _T_737; // @[Lookup.scala 11:37]
  wire  _T_738; // @[Lookup.scala 11:37]
  wire  _T_739; // @[Lookup.scala 11:37]
  wire  _T_740; // @[Lookup.scala 11:37]
  wire  _T_741; // @[Lookup.scala 11:37]
  wire  _T_742; // @[Lookup.scala 11:37]
  wire  _T_743; // @[Lookup.scala 11:37]
  wire  _T_744; // @[Lookup.scala 11:37]
  wire  _T_745; // @[Lookup.scala 11:37]
  wire  _T_746; // @[Lookup.scala 11:37]
  wire  _T_747; // @[Lookup.scala 11:37]
  wire  _T_748; // @[Lookup.scala 11:37]
  wire  _T_749; // @[Lookup.scala 11:37]
  wire  _T_750; // @[Lookup.scala 11:37]
  wire  _T_751; // @[Lookup.scala 11:37]
  wire  _T_752; // @[Lookup.scala 11:37]
  wire  _T_753; // @[Lookup.scala 11:37]
  wire  _T_754; // @[Lookup.scala 11:37]
  wire  _T_755; // @[Lookup.scala 11:37]
  wire  _T_756; // @[Lookup.scala 11:37]
  wire  ctrlSignals_10; // @[Lookup.scala 11:37]
  wire [2:0] _T_758; // @[Lookup.scala 11:37]
  wire [2:0] _T_759; // @[Lookup.scala 11:37]
  wire [2:0] _T_760; // @[Lookup.scala 11:37]
  wire [2:0] _T_761; // @[Lookup.scala 11:37]
  wire [2:0] _T_762; // @[Lookup.scala 11:37]
  wire [2:0] _T_763; // @[Lookup.scala 11:37]
  wire [2:0] _T_764; // @[Lookup.scala 11:37]
  wire [2:0] _T_765; // @[Lookup.scala 11:37]
  wire [2:0] _T_766; // @[Lookup.scala 11:37]
  wire [2:0] _T_767; // @[Lookup.scala 11:37]
  wire [2:0] _T_768; // @[Lookup.scala 11:37]
  wire [2:0] _T_769; // @[Lookup.scala 11:37]
  wire [2:0] _T_770; // @[Lookup.scala 11:37]
  wire [2:0] _T_771; // @[Lookup.scala 11:37]
  wire [2:0] _T_772; // @[Lookup.scala 11:37]
  wire [2:0] _T_773; // @[Lookup.scala 11:37]
  wire [2:0] _T_774; // @[Lookup.scala 11:37]
  wire [2:0] _T_775; // @[Lookup.scala 11:37]
  wire [2:0] _T_776; // @[Lookup.scala 11:37]
  wire [2:0] _T_777; // @[Lookup.scala 11:37]
  wire [2:0] _T_778; // @[Lookup.scala 11:37]
  wire [2:0] _T_779; // @[Lookup.scala 11:37]
  wire [2:0] _T_780; // @[Lookup.scala 11:37]
  wire [2:0] _T_781; // @[Lookup.scala 11:37]
  wire [2:0] _T_782; // @[Lookup.scala 11:37]
  wire [2:0] _T_783; // @[Lookup.scala 11:37]
  wire [2:0] _T_784; // @[Lookup.scala 11:37]
  wire [2:0] _T_785; // @[Lookup.scala 11:37]
  wire [2:0] _T_786; // @[Lookup.scala 11:37]
  wire [2:0] _T_787; // @[Lookup.scala 11:37]
  wire [2:0] _T_788; // @[Lookup.scala 11:37]
  wire [2:0] _T_789; // @[Lookup.scala 11:37]
  wire [2:0] _T_790; // @[Lookup.scala 11:37]
  wire [2:0] _T_791; // @[Lookup.scala 11:37]
  wire [2:0] _T_792; // @[Lookup.scala 11:37]
  wire [2:0] _T_793; // @[Lookup.scala 11:37]
  wire [2:0] _T_794; // @[Lookup.scala 11:37]
  wire [2:0] _T_795; // @[Lookup.scala 11:37]
  wire [2:0] _T_796; // @[Lookup.scala 11:37]
  wire [2:0] _T_797; // @[Lookup.scala 11:37]
  wire [2:0] _T_798; // @[Lookup.scala 11:37]
  wire [2:0] _T_799; // @[Lookup.scala 11:37]
  wire [2:0] _T_800; // @[Lookup.scala 11:37]
  wire [2:0] _T_801; // @[Lookup.scala 11:37]
  wire [2:0] _T_802; // @[Lookup.scala 11:37]
  wire [2:0] _T_803; // @[Lookup.scala 11:37]
  wire [2:0] _T_804; // @[Lookup.scala 11:37]
  wire [2:0] ctrlSignals_11; // @[Lookup.scala 11:37]
  wire  _T_805; // @[Lookup.scala 11:37]
  wire  _T_806; // @[Lookup.scala 11:37]
  wire  _T_807; // @[Lookup.scala 11:37]
  wire  _T_808; // @[Lookup.scala 11:37]
  wire  _T_809; // @[Lookup.scala 11:37]
  wire  _T_810; // @[Lookup.scala 11:37]
  wire  _T_811; // @[Lookup.scala 11:37]
  wire  _T_812; // @[Lookup.scala 11:37]
  wire  _T_813; // @[Lookup.scala 11:37]
  wire  _T_814; // @[Lookup.scala 11:37]
  wire  _T_815; // @[Lookup.scala 11:37]
  wire  _T_816; // @[Lookup.scala 11:37]
  wire  _T_817; // @[Lookup.scala 11:37]
  wire  _T_818; // @[Lookup.scala 11:37]
  wire  _T_819; // @[Lookup.scala 11:37]
  wire  _T_820; // @[Lookup.scala 11:37]
  wire  _T_821; // @[Lookup.scala 11:37]
  wire  _T_822; // @[Lookup.scala 11:37]
  wire  _T_823; // @[Lookup.scala 11:37]
  wire  _T_824; // @[Lookup.scala 11:37]
  wire  _T_825; // @[Lookup.scala 11:37]
  wire  _T_826; // @[Lookup.scala 11:37]
  wire  _T_827; // @[Lookup.scala 11:37]
  wire  _T_828; // @[Lookup.scala 11:37]
  wire  _T_829; // @[Lookup.scala 11:37]
  wire  _T_830; // @[Lookup.scala 11:37]
  wire  _T_831; // @[Lookup.scala 11:37]
  wire  _T_832; // @[Lookup.scala 11:37]
  wire  _T_833; // @[Lookup.scala 11:37]
  wire  _T_834; // @[Lookup.scala 11:37]
  wire  _T_835; // @[Lookup.scala 11:37]
  wire  _T_836; // @[Lookup.scala 11:37]
  wire  _T_837; // @[Lookup.scala 11:37]
  wire  _T_838; // @[Lookup.scala 11:37]
  wire  _T_839; // @[Lookup.scala 11:37]
  wire  _T_840; // @[Lookup.scala 11:37]
  wire  _T_841; // @[Lookup.scala 11:37]
  wire  _T_842; // @[Lookup.scala 11:37]
  wire  _T_843; // @[Lookup.scala 11:37]
  wire  _T_844; // @[Lookup.scala 11:37]
  wire  _T_845; // @[Lookup.scala 11:37]
  wire  _T_846; // @[Lookup.scala 11:37]
  wire  _T_847; // @[Lookup.scala 11:37]
  wire  _T_848; // @[Lookup.scala 11:37]
  wire  _T_849; // @[Lookup.scala 11:37]
  wire  _T_850; // @[Lookup.scala 11:37]
  wire  _T_851; // @[Lookup.scala 11:37]
  wire  _T_852; // @[Lookup.scala 11:37]
  wire  ctrlSignals_12; // @[Lookup.scala 11:37]
  assign _T_35 = io_inst & 32'h7f; // @[Lookup.scala 9:38]
  assign _T_36 = 32'h37 == _T_35; // @[Lookup.scala 9:38]
  assign _T_40 = 32'h17 == _T_35; // @[Lookup.scala 9:38]
  assign _T_44 = 32'h6f == _T_35; // @[Lookup.scala 9:38]
  assign _T_47 = io_inst & 32'h707f; // @[Lookup.scala 9:38]
  assign _T_48 = 32'h67 == _T_47; // @[Lookup.scala 9:38]
  assign _T_52 = 32'h63 == _T_47; // @[Lookup.scala 9:38]
  assign _T_56 = 32'h1063 == _T_47; // @[Lookup.scala 9:38]
  assign _T_60 = 32'h4063 == _T_47; // @[Lookup.scala 9:38]
  assign _T_64 = 32'h5063 == _T_47; // @[Lookup.scala 9:38]
  assign _T_68 = 32'h6063 == _T_47; // @[Lookup.scala 9:38]
  assign _T_72 = 32'h7063 == _T_47; // @[Lookup.scala 9:38]
  assign _T_76 = 32'h3 == _T_47; // @[Lookup.scala 9:38]
  assign _T_80 = 32'h1003 == _T_47; // @[Lookup.scala 9:38]
  assign _T_84 = 32'h2003 == _T_47; // @[Lookup.scala 9:38]
  assign _T_88 = 32'h4003 == _T_47; // @[Lookup.scala 9:38]
  assign _T_92 = 32'h5003 == _T_47; // @[Lookup.scala 9:38]
  assign _T_96 = 32'h23 == _T_47; // @[Lookup.scala 9:38]
  assign _T_100 = 32'h1023 == _T_47; // @[Lookup.scala 9:38]
  assign _T_104 = 32'h2023 == _T_47; // @[Lookup.scala 9:38]
  assign _T_108 = 32'h13 == _T_47; // @[Lookup.scala 9:38]
  assign _T_112 = 32'h2013 == _T_47; // @[Lookup.scala 9:38]
  assign _T_116 = 32'h3013 == _T_47; // @[Lookup.scala 9:38]
  assign _T_120 = 32'h4013 == _T_47; // @[Lookup.scala 9:38]
  assign _T_124 = 32'h6013 == _T_47; // @[Lookup.scala 9:38]
  assign _T_128 = 32'h7013 == _T_47; // @[Lookup.scala 9:38]
  assign _T_131 = io_inst & 32'hfe00707f; // @[Lookup.scala 9:38]
  assign _T_132 = 32'h1013 == _T_131; // @[Lookup.scala 9:38]
  assign _T_136 = 32'h5013 == _T_131; // @[Lookup.scala 9:38]
  assign _T_140 = 32'h40005013 == _T_131; // @[Lookup.scala 9:38]
  assign _T_144 = 32'h33 == _T_131; // @[Lookup.scala 9:38]
  assign _T_148 = 32'h40000033 == _T_131; // @[Lookup.scala 9:38]
  assign _T_152 = 32'h1033 == _T_131; // @[Lookup.scala 9:38]
  assign _T_156 = 32'h2033 == _T_131; // @[Lookup.scala 9:38]
  assign _T_160 = 32'h3033 == _T_131; // @[Lookup.scala 9:38]
  assign _T_164 = 32'h4033 == _T_131; // @[Lookup.scala 9:38]
  assign _T_168 = 32'h5033 == _T_131; // @[Lookup.scala 9:38]
  assign _T_172 = 32'h40005033 == _T_131; // @[Lookup.scala 9:38]
  assign _T_176 = 32'h6033 == _T_131; // @[Lookup.scala 9:38]
  assign _T_180 = 32'h7033 == _T_131; // @[Lookup.scala 9:38]
  assign _T_183 = io_inst & 32'hf00fffff; // @[Lookup.scala 9:38]
  assign _T_184 = 32'hf == _T_183; // @[Lookup.scala 9:38]
  assign _T_188 = 32'h100f == io_inst; // @[Lookup.scala 9:38]
  assign _T_192 = 32'h1073 == _T_47; // @[Lookup.scala 9:38]
  assign _T_196 = 32'h2073 == _T_47; // @[Lookup.scala 9:38]
  assign _T_200 = 32'h3073 == _T_47; // @[Lookup.scala 9:38]
  assign _T_204 = 32'h5073 == _T_47; // @[Lookup.scala 9:38]
  assign _T_208 = 32'h6073 == _T_47; // @[Lookup.scala 9:38]
  assign _T_212 = 32'h7073 == _T_47; // @[Lookup.scala 9:38]
  assign _T_216 = 32'h73 == io_inst; // @[Lookup.scala 9:38]
  assign _T_220 = 32'h100073 == io_inst; // @[Lookup.scala 9:38]
  assign _T_224 = 32'h10000073 == io_inst; // @[Lookup.scala 9:38]
  assign _T_228 = 32'h10200073 == io_inst; // @[Lookup.scala 9:38]
  assign _T_230 = _T_224 ? 2'h3 : 2'h0; // @[Lookup.scala 11:37]
  assign _T_231 = _T_220 ? 2'h0 : _T_230; // @[Lookup.scala 11:37]
  assign _T_232 = _T_216 ? 2'h0 : _T_231; // @[Lookup.scala 11:37]
  assign _T_233 = _T_212 ? 2'h2 : _T_232; // @[Lookup.scala 11:37]
  assign _T_234 = _T_208 ? 2'h2 : _T_233; // @[Lookup.scala 11:37]
  assign _T_235 = _T_204 ? 2'h2 : _T_234; // @[Lookup.scala 11:37]
  assign _T_236 = _T_200 ? 2'h2 : _T_235; // @[Lookup.scala 11:37]
  assign _T_237 = _T_196 ? 2'h2 : _T_236; // @[Lookup.scala 11:37]
  assign _T_238 = _T_192 ? 2'h2 : _T_237; // @[Lookup.scala 11:37]
  assign _T_239 = _T_188 ? 2'h2 : _T_238; // @[Lookup.scala 11:37]
  assign _T_240 = _T_184 ? 2'h0 : _T_239; // @[Lookup.scala 11:37]
  assign _T_241 = _T_180 ? 2'h0 : _T_240; // @[Lookup.scala 11:37]
  assign _T_242 = _T_176 ? 2'h0 : _T_241; // @[Lookup.scala 11:37]
  assign _T_243 = _T_172 ? 2'h0 : _T_242; // @[Lookup.scala 11:37]
  assign _T_244 = _T_168 ? 2'h0 : _T_243; // @[Lookup.scala 11:37]
  assign _T_245 = _T_164 ? 2'h0 : _T_244; // @[Lookup.scala 11:37]
  assign _T_246 = _T_160 ? 2'h0 : _T_245; // @[Lookup.scala 11:37]
  assign _T_247 = _T_156 ? 2'h0 : _T_246; // @[Lookup.scala 11:37]
  assign _T_248 = _T_152 ? 2'h0 : _T_247; // @[Lookup.scala 11:37]
  assign _T_249 = _T_148 ? 2'h0 : _T_248; // @[Lookup.scala 11:37]
  assign _T_250 = _T_144 ? 2'h0 : _T_249; // @[Lookup.scala 11:37]
  assign _T_251 = _T_140 ? 2'h0 : _T_250; // @[Lookup.scala 11:37]
  assign _T_252 = _T_136 ? 2'h0 : _T_251; // @[Lookup.scala 11:37]
  assign _T_253 = _T_132 ? 2'h0 : _T_252; // @[Lookup.scala 11:37]
  assign _T_254 = _T_128 ? 2'h0 : _T_253; // @[Lookup.scala 11:37]
  assign _T_255 = _T_124 ? 2'h0 : _T_254; // @[Lookup.scala 11:37]
  assign _T_256 = _T_120 ? 2'h0 : _T_255; // @[Lookup.scala 11:37]
  assign _T_257 = _T_116 ? 2'h0 : _T_256; // @[Lookup.scala 11:37]
  assign _T_258 = _T_112 ? 2'h0 : _T_257; // @[Lookup.scala 11:37]
  assign _T_259 = _T_108 ? 2'h0 : _T_258; // @[Lookup.scala 11:37]
  assign _T_260 = _T_104 ? 2'h0 : _T_259; // @[Lookup.scala 11:37]
  assign _T_261 = _T_100 ? 2'h0 : _T_260; // @[Lookup.scala 11:37]
  assign _T_262 = _T_96 ? 2'h0 : _T_261; // @[Lookup.scala 11:37]
  assign _T_263 = _T_92 ? 2'h2 : _T_262; // @[Lookup.scala 11:37]
  assign _T_264 = _T_88 ? 2'h2 : _T_263; // @[Lookup.scala 11:37]
  assign _T_265 = _T_84 ? 2'h2 : _T_264; // @[Lookup.scala 11:37]
  assign _T_266 = _T_80 ? 2'h2 : _T_265; // @[Lookup.scala 11:37]
  assign _T_267 = _T_76 ? 2'h2 : _T_266; // @[Lookup.scala 11:37]
  assign _T_268 = _T_72 ? 2'h0 : _T_267; // @[Lookup.scala 11:37]
  assign _T_269 = _T_68 ? 2'h0 : _T_268; // @[Lookup.scala 11:37]
  assign _T_270 = _T_64 ? 2'h0 : _T_269; // @[Lookup.scala 11:37]
  assign _T_271 = _T_60 ? 2'h0 : _T_270; // @[Lookup.scala 11:37]
  assign _T_272 = _T_56 ? 2'h0 : _T_271; // @[Lookup.scala 11:37]
  assign _T_273 = _T_52 ? 2'h0 : _T_272; // @[Lookup.scala 11:37]
  assign _T_274 = _T_48 ? 2'h1 : _T_273; // @[Lookup.scala 11:37]
  assign _T_275 = _T_44 ? 2'h1 : _T_274; // @[Lookup.scala 11:37]
  assign _T_276 = _T_40 ? 2'h0 : _T_275; // @[Lookup.scala 11:37]
  assign ctrlSignals_0 = _T_36 ? 2'h0 : _T_276; // @[Lookup.scala 11:37]
  assign _T_285 = _T_196 ? 1'h1 : _T_200; // @[Lookup.scala 11:37]
  assign _T_286 = _T_192 ? 1'h1 : _T_285; // @[Lookup.scala 11:37]
  assign _T_287 = _T_188 ? 1'h0 : _T_286; // @[Lookup.scala 11:37]
  assign _T_288 = _T_184 ? 1'h0 : _T_287; // @[Lookup.scala 11:37]
  assign _T_289 = _T_180 ? 1'h1 : _T_288; // @[Lookup.scala 11:37]
  assign _T_290 = _T_176 ? 1'h1 : _T_289; // @[Lookup.scala 11:37]
  assign _T_291 = _T_172 ? 1'h1 : _T_290; // @[Lookup.scala 11:37]
  assign _T_292 = _T_168 ? 1'h1 : _T_291; // @[Lookup.scala 11:37]
  assign _T_293 = _T_164 ? 1'h1 : _T_292; // @[Lookup.scala 11:37]
  assign _T_294 = _T_160 ? 1'h1 : _T_293; // @[Lookup.scala 11:37]
  assign _T_295 = _T_156 ? 1'h1 : _T_294; // @[Lookup.scala 11:37]
  assign _T_296 = _T_152 ? 1'h1 : _T_295; // @[Lookup.scala 11:37]
  assign _T_297 = _T_148 ? 1'h1 : _T_296; // @[Lookup.scala 11:37]
  assign _T_298 = _T_144 ? 1'h1 : _T_297; // @[Lookup.scala 11:37]
  assign _T_299 = _T_140 ? 1'h1 : _T_298; // @[Lookup.scala 11:37]
  assign _T_300 = _T_136 ? 1'h1 : _T_299; // @[Lookup.scala 11:37]
  assign _T_301 = _T_132 ? 1'h1 : _T_300; // @[Lookup.scala 11:37]
  assign _T_302 = _T_128 ? 1'h1 : _T_301; // @[Lookup.scala 11:37]
  assign _T_303 = _T_124 ? 1'h1 : _T_302; // @[Lookup.scala 11:37]
  assign _T_304 = _T_120 ? 1'h1 : _T_303; // @[Lookup.scala 11:37]
  assign _T_305 = _T_116 ? 1'h1 : _T_304; // @[Lookup.scala 11:37]
  assign _T_306 = _T_112 ? 1'h1 : _T_305; // @[Lookup.scala 11:37]
  assign _T_307 = _T_108 ? 1'h1 : _T_306; // @[Lookup.scala 11:37]
  assign _T_308 = _T_104 ? 1'h1 : _T_307; // @[Lookup.scala 11:37]
  assign _T_309 = _T_100 ? 1'h1 : _T_308; // @[Lookup.scala 11:37]
  assign _T_310 = _T_96 ? 1'h1 : _T_309; // @[Lookup.scala 11:37]
  assign _T_311 = _T_92 ? 1'h1 : _T_310; // @[Lookup.scala 11:37]
  assign _T_312 = _T_88 ? 1'h1 : _T_311; // @[Lookup.scala 11:37]
  assign _T_313 = _T_84 ? 1'h1 : _T_312; // @[Lookup.scala 11:37]
  assign _T_314 = _T_80 ? 1'h1 : _T_313; // @[Lookup.scala 11:37]
  assign _T_315 = _T_76 ? 1'h1 : _T_314; // @[Lookup.scala 11:37]
  assign _T_316 = _T_72 ? 1'h0 : _T_315; // @[Lookup.scala 11:37]
  assign _T_317 = _T_68 ? 1'h0 : _T_316; // @[Lookup.scala 11:37]
  assign _T_318 = _T_64 ? 1'h0 : _T_317; // @[Lookup.scala 11:37]
  assign _T_319 = _T_60 ? 1'h0 : _T_318; // @[Lookup.scala 11:37]
  assign _T_320 = _T_56 ? 1'h0 : _T_319; // @[Lookup.scala 11:37]
  assign _T_321 = _T_52 ? 1'h0 : _T_320; // @[Lookup.scala 11:37]
  assign _T_322 = _T_48 ? 1'h1 : _T_321; // @[Lookup.scala 11:37]
  assign _T_323 = _T_44 ? 1'h0 : _T_322; // @[Lookup.scala 11:37]
  assign _T_324 = _T_40 ? 1'h0 : _T_323; // @[Lookup.scala 11:37]
  assign ctrlSignals_1 = _T_36 ? 1'h0 : _T_324; // @[Lookup.scala 11:37]
  assign _T_338 = _T_176 ? 1'h1 : _T_180; // @[Lookup.scala 11:37]
  assign _T_339 = _T_172 ? 1'h1 : _T_338; // @[Lookup.scala 11:37]
  assign _T_340 = _T_168 ? 1'h1 : _T_339; // @[Lookup.scala 11:37]
  assign _T_341 = _T_164 ? 1'h1 : _T_340; // @[Lookup.scala 11:37]
  assign _T_342 = _T_160 ? 1'h1 : _T_341; // @[Lookup.scala 11:37]
  assign _T_343 = _T_156 ? 1'h1 : _T_342; // @[Lookup.scala 11:37]
  assign _T_344 = _T_152 ? 1'h1 : _T_343; // @[Lookup.scala 11:37]
  assign _T_345 = _T_148 ? 1'h1 : _T_344; // @[Lookup.scala 11:37]
  assign _T_346 = _T_144 ? 1'h1 : _T_345; // @[Lookup.scala 11:37]
  assign _T_347 = _T_140 ? 1'h0 : _T_346; // @[Lookup.scala 11:37]
  assign _T_348 = _T_136 ? 1'h0 : _T_347; // @[Lookup.scala 11:37]
  assign _T_349 = _T_132 ? 1'h0 : _T_348; // @[Lookup.scala 11:37]
  assign _T_350 = _T_128 ? 1'h0 : _T_349; // @[Lookup.scala 11:37]
  assign _T_351 = _T_124 ? 1'h0 : _T_350; // @[Lookup.scala 11:37]
  assign _T_352 = _T_120 ? 1'h0 : _T_351; // @[Lookup.scala 11:37]
  assign _T_353 = _T_116 ? 1'h0 : _T_352; // @[Lookup.scala 11:37]
  assign _T_354 = _T_112 ? 1'h0 : _T_353; // @[Lookup.scala 11:37]
  assign _T_355 = _T_108 ? 1'h0 : _T_354; // @[Lookup.scala 11:37]
  assign _T_356 = _T_104 ? 1'h0 : _T_355; // @[Lookup.scala 11:37]
  assign _T_357 = _T_100 ? 1'h0 : _T_356; // @[Lookup.scala 11:37]
  assign _T_358 = _T_96 ? 1'h0 : _T_357; // @[Lookup.scala 11:37]
  assign _T_359 = _T_92 ? 1'h0 : _T_358; // @[Lookup.scala 11:37]
  assign _T_360 = _T_88 ? 1'h0 : _T_359; // @[Lookup.scala 11:37]
  assign _T_361 = _T_84 ? 1'h0 : _T_360; // @[Lookup.scala 11:37]
  assign _T_362 = _T_80 ? 1'h0 : _T_361; // @[Lookup.scala 11:37]
  assign _T_363 = _T_76 ? 1'h0 : _T_362; // @[Lookup.scala 11:37]
  assign _T_364 = _T_72 ? 1'h0 : _T_363; // @[Lookup.scala 11:37]
  assign _T_365 = _T_68 ? 1'h0 : _T_364; // @[Lookup.scala 11:37]
  assign _T_366 = _T_64 ? 1'h0 : _T_365; // @[Lookup.scala 11:37]
  assign _T_367 = _T_60 ? 1'h0 : _T_366; // @[Lookup.scala 11:37]
  assign _T_368 = _T_56 ? 1'h0 : _T_367; // @[Lookup.scala 11:37]
  assign _T_369 = _T_52 ? 1'h0 : _T_368; // @[Lookup.scala 11:37]
  assign _T_370 = _T_48 ? 1'h0 : _T_369; // @[Lookup.scala 11:37]
  assign _T_371 = _T_44 ? 1'h0 : _T_370; // @[Lookup.scala 11:37]
  assign _T_372 = _T_40 ? 1'h0 : _T_371; // @[Lookup.scala 11:37]
  assign ctrlSignals_2 = _T_36 ? 1'h0 : _T_372; // @[Lookup.scala 11:37]
  assign _T_377 = _T_212 ? 3'h6 : 3'h0; // @[Lookup.scala 11:37]
  assign _T_378 = _T_208 ? 3'h6 : _T_377; // @[Lookup.scala 11:37]
  assign _T_379 = _T_204 ? 3'h6 : _T_378; // @[Lookup.scala 11:37]
  assign _T_380 = _T_200 ? 3'h0 : _T_379; // @[Lookup.scala 11:37]
  assign _T_381 = _T_196 ? 3'h0 : _T_380; // @[Lookup.scala 11:37]
  assign _T_382 = _T_192 ? 3'h0 : _T_381; // @[Lookup.scala 11:37]
  assign _T_383 = _T_188 ? 3'h0 : _T_382; // @[Lookup.scala 11:37]
  assign _T_384 = _T_184 ? 3'h0 : _T_383; // @[Lookup.scala 11:37]
  assign _T_385 = _T_180 ? 3'h0 : _T_384; // @[Lookup.scala 11:37]
  assign _T_386 = _T_176 ? 3'h0 : _T_385; // @[Lookup.scala 11:37]
  assign _T_387 = _T_172 ? 3'h0 : _T_386; // @[Lookup.scala 11:37]
  assign _T_388 = _T_168 ? 3'h0 : _T_387; // @[Lookup.scala 11:37]
  assign _T_389 = _T_164 ? 3'h0 : _T_388; // @[Lookup.scala 11:37]
  assign _T_390 = _T_160 ? 3'h0 : _T_389; // @[Lookup.scala 11:37]
  assign _T_391 = _T_156 ? 3'h0 : _T_390; // @[Lookup.scala 11:37]
  assign _T_392 = _T_152 ? 3'h0 : _T_391; // @[Lookup.scala 11:37]
  assign _T_393 = _T_148 ? 3'h0 : _T_392; // @[Lookup.scala 11:37]
  assign _T_394 = _T_144 ? 3'h0 : _T_393; // @[Lookup.scala 11:37]
  assign _T_395 = _T_140 ? 3'h1 : _T_394; // @[Lookup.scala 11:37]
  assign _T_396 = _T_136 ? 3'h1 : _T_395; // @[Lookup.scala 11:37]
  assign _T_397 = _T_132 ? 3'h1 : _T_396; // @[Lookup.scala 11:37]
  assign _T_398 = _T_128 ? 3'h1 : _T_397; // @[Lookup.scala 11:37]
  assign _T_399 = _T_124 ? 3'h1 : _T_398; // @[Lookup.scala 11:37]
  assign _T_400 = _T_120 ? 3'h1 : _T_399; // @[Lookup.scala 11:37]
  assign _T_401 = _T_116 ? 3'h1 : _T_400; // @[Lookup.scala 11:37]
  assign _T_402 = _T_112 ? 3'h1 : _T_401; // @[Lookup.scala 11:37]
  assign _T_403 = _T_108 ? 3'h1 : _T_402; // @[Lookup.scala 11:37]
  assign _T_404 = _T_104 ? 3'h2 : _T_403; // @[Lookup.scala 11:37]
  assign _T_405 = _T_100 ? 3'h2 : _T_404; // @[Lookup.scala 11:37]
  assign _T_406 = _T_96 ? 3'h2 : _T_405; // @[Lookup.scala 11:37]
  assign _T_407 = _T_92 ? 3'h1 : _T_406; // @[Lookup.scala 11:37]
  assign _T_408 = _T_88 ? 3'h1 : _T_407; // @[Lookup.scala 11:37]
  assign _T_409 = _T_84 ? 3'h1 : _T_408; // @[Lookup.scala 11:37]
  assign _T_410 = _T_80 ? 3'h1 : _T_409; // @[Lookup.scala 11:37]
  assign _T_411 = _T_76 ? 3'h1 : _T_410; // @[Lookup.scala 11:37]
  assign _T_412 = _T_72 ? 3'h5 : _T_411; // @[Lookup.scala 11:37]
  assign _T_413 = _T_68 ? 3'h5 : _T_412; // @[Lookup.scala 11:37]
  assign _T_414 = _T_64 ? 3'h5 : _T_413; // @[Lookup.scala 11:37]
  assign _T_415 = _T_60 ? 3'h5 : _T_414; // @[Lookup.scala 11:37]
  assign _T_416 = _T_56 ? 3'h5 : _T_415; // @[Lookup.scala 11:37]
  assign _T_417 = _T_52 ? 3'h5 : _T_416; // @[Lookup.scala 11:37]
  assign _T_418 = _T_48 ? 3'h1 : _T_417; // @[Lookup.scala 11:37]
  assign _T_419 = _T_44 ? 3'h4 : _T_418; // @[Lookup.scala 11:37]
  assign _T_420 = _T_40 ? 3'h3 : _T_419; // @[Lookup.scala 11:37]
  assign ctrlSignals_3 = _T_36 ? 3'h3 : _T_420; // @[Lookup.scala 11:37]
  assign _T_428 = _T_200 ? 4'ha : 4'hf; // @[Lookup.scala 11:37]
  assign _T_429 = _T_196 ? 4'ha : _T_428; // @[Lookup.scala 11:37]
  assign _T_430 = _T_192 ? 4'ha : _T_429; // @[Lookup.scala 11:37]
  assign _T_431 = _T_188 ? 4'hf : _T_430; // @[Lookup.scala 11:37]
  assign _T_432 = _T_184 ? 4'hf : _T_431; // @[Lookup.scala 11:37]
  assign _T_433 = _T_180 ? 4'h2 : _T_432; // @[Lookup.scala 11:37]
  assign _T_434 = _T_176 ? 4'h3 : _T_433; // @[Lookup.scala 11:37]
  assign _T_435 = _T_172 ? 4'h9 : _T_434; // @[Lookup.scala 11:37]
  assign _T_436 = _T_168 ? 4'h8 : _T_435; // @[Lookup.scala 11:37]
  assign _T_437 = _T_164 ? 4'h4 : _T_436; // @[Lookup.scala 11:37]
  assign _T_438 = _T_160 ? 4'h7 : _T_437; // @[Lookup.scala 11:37]
  assign _T_439 = _T_156 ? 4'h5 : _T_438; // @[Lookup.scala 11:37]
  assign _T_440 = _T_152 ? 4'h6 : _T_439; // @[Lookup.scala 11:37]
  assign _T_441 = _T_148 ? 4'h1 : _T_440; // @[Lookup.scala 11:37]
  assign _T_442 = _T_144 ? 4'h0 : _T_441; // @[Lookup.scala 11:37]
  assign _T_443 = _T_140 ? 4'h9 : _T_442; // @[Lookup.scala 11:37]
  assign _T_444 = _T_136 ? 4'h8 : _T_443; // @[Lookup.scala 11:37]
  assign _T_445 = _T_132 ? 4'h6 : _T_444; // @[Lookup.scala 11:37]
  assign _T_446 = _T_128 ? 4'h2 : _T_445; // @[Lookup.scala 11:37]
  assign _T_447 = _T_124 ? 4'h3 : _T_446; // @[Lookup.scala 11:37]
  assign _T_448 = _T_120 ? 4'h4 : _T_447; // @[Lookup.scala 11:37]
  assign _T_449 = _T_116 ? 4'h7 : _T_448; // @[Lookup.scala 11:37]
  assign _T_450 = _T_112 ? 4'h5 : _T_449; // @[Lookup.scala 11:37]
  assign _T_451 = _T_108 ? 4'h0 : _T_450; // @[Lookup.scala 11:37]
  assign _T_452 = _T_104 ? 4'h0 : _T_451; // @[Lookup.scala 11:37]
  assign _T_453 = _T_100 ? 4'h0 : _T_452; // @[Lookup.scala 11:37]
  assign _T_454 = _T_96 ? 4'h0 : _T_453; // @[Lookup.scala 11:37]
  assign _T_455 = _T_92 ? 4'h0 : _T_454; // @[Lookup.scala 11:37]
  assign _T_456 = _T_88 ? 4'h0 : _T_455; // @[Lookup.scala 11:37]
  assign _T_457 = _T_84 ? 4'h0 : _T_456; // @[Lookup.scala 11:37]
  assign _T_458 = _T_80 ? 4'h0 : _T_457; // @[Lookup.scala 11:37]
  assign _T_459 = _T_76 ? 4'h0 : _T_458; // @[Lookup.scala 11:37]
  assign _T_460 = _T_72 ? 4'h0 : _T_459; // @[Lookup.scala 11:37]
  assign _T_461 = _T_68 ? 4'h0 : _T_460; // @[Lookup.scala 11:37]
  assign _T_462 = _T_64 ? 4'h0 : _T_461; // @[Lookup.scala 11:37]
  assign _T_463 = _T_60 ? 4'h0 : _T_462; // @[Lookup.scala 11:37]
  assign _T_464 = _T_56 ? 4'h0 : _T_463; // @[Lookup.scala 11:37]
  assign _T_465 = _T_52 ? 4'h0 : _T_464; // @[Lookup.scala 11:37]
  assign _T_466 = _T_48 ? 4'h0 : _T_465; // @[Lookup.scala 11:37]
  assign _T_467 = _T_44 ? 4'h0 : _T_466; // @[Lookup.scala 11:37]
  assign _T_468 = _T_40 ? 4'h0 : _T_467; // @[Lookup.scala 11:37]
  assign ctrlSignals_4 = _T_36 ? 4'hb : _T_468; // @[Lookup.scala 11:37]
  assign _T_508 = _T_72 ? 3'h4 : 3'h0; // @[Lookup.scala 11:37]
  assign _T_509 = _T_68 ? 3'h1 : _T_508; // @[Lookup.scala 11:37]
  assign _T_510 = _T_64 ? 3'h5 : _T_509; // @[Lookup.scala 11:37]
  assign _T_511 = _T_60 ? 3'h2 : _T_510; // @[Lookup.scala 11:37]
  assign _T_512 = _T_56 ? 3'h6 : _T_511; // @[Lookup.scala 11:37]
  assign _T_513 = _T_52 ? 3'h3 : _T_512; // @[Lookup.scala 11:37]
  assign _T_514 = _T_48 ? 3'h0 : _T_513; // @[Lookup.scala 11:37]
  assign _T_515 = _T_44 ? 3'h0 : _T_514; // @[Lookup.scala 11:37]
  assign _T_516 = _T_40 ? 3'h0 : _T_515; // @[Lookup.scala 11:37]
  assign ctrlSignals_5 = _T_36 ? 3'h0 : _T_516; // @[Lookup.scala 11:37]
  assign _T_519 = _T_220 ? 1'h0 : _T_224; // @[Lookup.scala 11:37]
  assign _T_520 = _T_216 ? 1'h0 : _T_519; // @[Lookup.scala 11:37]
  assign _T_521 = _T_212 ? 1'h1 : _T_520; // @[Lookup.scala 11:37]
  assign _T_522 = _T_208 ? 1'h1 : _T_521; // @[Lookup.scala 11:37]
  assign _T_523 = _T_204 ? 1'h1 : _T_522; // @[Lookup.scala 11:37]
  assign _T_524 = _T_200 ? 1'h1 : _T_523; // @[Lookup.scala 11:37]
  assign _T_525 = _T_196 ? 1'h1 : _T_524; // @[Lookup.scala 11:37]
  assign _T_526 = _T_192 ? 1'h1 : _T_525; // @[Lookup.scala 11:37]
  assign _T_527 = _T_188 ? 1'h1 : _T_526; // @[Lookup.scala 11:37]
  assign _T_528 = _T_184 ? 1'h0 : _T_527; // @[Lookup.scala 11:37]
  assign _T_529 = _T_180 ? 1'h0 : _T_528; // @[Lookup.scala 11:37]
  assign _T_530 = _T_176 ? 1'h0 : _T_529; // @[Lookup.scala 11:37]
  assign _T_531 = _T_172 ? 1'h0 : _T_530; // @[Lookup.scala 11:37]
  assign _T_532 = _T_168 ? 1'h0 : _T_531; // @[Lookup.scala 11:37]
  assign _T_533 = _T_164 ? 1'h0 : _T_532; // @[Lookup.scala 11:37]
  assign _T_534 = _T_160 ? 1'h0 : _T_533; // @[Lookup.scala 11:37]
  assign _T_535 = _T_156 ? 1'h0 : _T_534; // @[Lookup.scala 11:37]
  assign _T_536 = _T_152 ? 1'h0 : _T_535; // @[Lookup.scala 11:37]
  assign _T_537 = _T_148 ? 1'h0 : _T_536; // @[Lookup.scala 11:37]
  assign _T_538 = _T_144 ? 1'h0 : _T_537; // @[Lookup.scala 11:37]
  assign _T_539 = _T_140 ? 1'h0 : _T_538; // @[Lookup.scala 11:37]
  assign _T_540 = _T_136 ? 1'h0 : _T_539; // @[Lookup.scala 11:37]
  assign _T_541 = _T_132 ? 1'h0 : _T_540; // @[Lookup.scala 11:37]
  assign _T_542 = _T_128 ? 1'h0 : _T_541; // @[Lookup.scala 11:37]
  assign _T_543 = _T_124 ? 1'h0 : _T_542; // @[Lookup.scala 11:37]
  assign _T_544 = _T_120 ? 1'h0 : _T_543; // @[Lookup.scala 11:37]
  assign _T_545 = _T_116 ? 1'h0 : _T_544; // @[Lookup.scala 11:37]
  assign _T_546 = _T_112 ? 1'h0 : _T_545; // @[Lookup.scala 11:37]
  assign _T_547 = _T_108 ? 1'h0 : _T_546; // @[Lookup.scala 11:37]
  assign _T_548 = _T_104 ? 1'h0 : _T_547; // @[Lookup.scala 11:37]
  assign _T_549 = _T_100 ? 1'h0 : _T_548; // @[Lookup.scala 11:37]
  assign _T_550 = _T_96 ? 1'h0 : _T_549; // @[Lookup.scala 11:37]
  assign _T_551 = _T_92 ? 1'h1 : _T_550; // @[Lookup.scala 11:37]
  assign _T_552 = _T_88 ? 1'h1 : _T_551; // @[Lookup.scala 11:37]
  assign _T_553 = _T_84 ? 1'h1 : _T_552; // @[Lookup.scala 11:37]
  assign _T_554 = _T_80 ? 1'h1 : _T_553; // @[Lookup.scala 11:37]
  assign _T_555 = _T_76 ? 1'h1 : _T_554; // @[Lookup.scala 11:37]
  assign _T_556 = _T_72 ? 1'h0 : _T_555; // @[Lookup.scala 11:37]
  assign _T_557 = _T_68 ? 1'h0 : _T_556; // @[Lookup.scala 11:37]
  assign _T_558 = _T_64 ? 1'h0 : _T_557; // @[Lookup.scala 11:37]
  assign _T_559 = _T_60 ? 1'h0 : _T_558; // @[Lookup.scala 11:37]
  assign _T_560 = _T_56 ? 1'h0 : _T_559; // @[Lookup.scala 11:37]
  assign _T_561 = _T_52 ? 1'h0 : _T_560; // @[Lookup.scala 11:37]
  assign _T_562 = _T_48 ? 1'h1 : _T_561; // @[Lookup.scala 11:37]
  assign _T_563 = _T_44 ? 1'h1 : _T_562; // @[Lookup.scala 11:37]
  assign _T_564 = _T_40 ? 1'h0 : _T_563; // @[Lookup.scala 11:37]
  assign ctrlSignals_6 = _T_36 ? 1'h0 : _T_564; // @[Lookup.scala 11:37]
  assign _T_596 = _T_104 ? 2'h1 : 2'h0; // @[Lookup.scala 11:37]
  assign _T_597 = _T_100 ? 2'h2 : _T_596; // @[Lookup.scala 11:37]
  assign _T_598 = _T_96 ? 2'h3 : _T_597; // @[Lookup.scala 11:37]
  assign _T_599 = _T_92 ? 2'h0 : _T_598; // @[Lookup.scala 11:37]
  assign _T_600 = _T_88 ? 2'h0 : _T_599; // @[Lookup.scala 11:37]
  assign _T_601 = _T_84 ? 2'h0 : _T_600; // @[Lookup.scala 11:37]
  assign _T_602 = _T_80 ? 2'h0 : _T_601; // @[Lookup.scala 11:37]
  assign _T_603 = _T_76 ? 2'h0 : _T_602; // @[Lookup.scala 11:37]
  assign _T_604 = _T_72 ? 2'h0 : _T_603; // @[Lookup.scala 11:37]
  assign _T_605 = _T_68 ? 2'h0 : _T_604; // @[Lookup.scala 11:37]
  assign _T_606 = _T_64 ? 2'h0 : _T_605; // @[Lookup.scala 11:37]
  assign _T_607 = _T_60 ? 2'h0 : _T_606; // @[Lookup.scala 11:37]
  assign _T_608 = _T_56 ? 2'h0 : _T_607; // @[Lookup.scala 11:37]
  assign _T_609 = _T_52 ? 2'h0 : _T_608; // @[Lookup.scala 11:37]
  assign _T_610 = _T_48 ? 2'h0 : _T_609; // @[Lookup.scala 11:37]
  assign _T_611 = _T_44 ? 2'h0 : _T_610; // @[Lookup.scala 11:37]
  assign _T_612 = _T_40 ? 2'h0 : _T_611; // @[Lookup.scala 11:37]
  assign ctrlSignals_7 = _T_36 ? 2'h0 : _T_612; // @[Lookup.scala 11:37]
  assign _T_647 = _T_92 ? 3'h4 : 3'h0; // @[Lookup.scala 11:37]
  assign _T_648 = _T_88 ? 3'h5 : _T_647; // @[Lookup.scala 11:37]
  assign _T_649 = _T_84 ? 3'h1 : _T_648; // @[Lookup.scala 11:37]
  assign _T_650 = _T_80 ? 3'h2 : _T_649; // @[Lookup.scala 11:37]
  assign _T_651 = _T_76 ? 3'h3 : _T_650; // @[Lookup.scala 11:37]
  assign _T_652 = _T_72 ? 3'h0 : _T_651; // @[Lookup.scala 11:37]
  assign _T_653 = _T_68 ? 3'h0 : _T_652; // @[Lookup.scala 11:37]
  assign _T_654 = _T_64 ? 3'h0 : _T_653; // @[Lookup.scala 11:37]
  assign _T_655 = _T_60 ? 3'h0 : _T_654; // @[Lookup.scala 11:37]
  assign _T_656 = _T_56 ? 3'h0 : _T_655; // @[Lookup.scala 11:37]
  assign _T_657 = _T_52 ? 3'h0 : _T_656; // @[Lookup.scala 11:37]
  assign _T_658 = _T_48 ? 3'h0 : _T_657; // @[Lookup.scala 11:37]
  assign _T_659 = _T_44 ? 3'h0 : _T_658; // @[Lookup.scala 11:37]
  assign _T_660 = _T_40 ? 3'h0 : _T_659; // @[Lookup.scala 11:37]
  assign ctrlSignals_8 = _T_36 ? 3'h0 : _T_660; // @[Lookup.scala 11:37]
  assign _T_663 = _T_220 ? 2'h3 : _T_230; // @[Lookup.scala 11:37]
  assign _T_664 = _T_216 ? 2'h3 : _T_663; // @[Lookup.scala 11:37]
  assign _T_665 = _T_212 ? 2'h3 : _T_664; // @[Lookup.scala 11:37]
  assign _T_666 = _T_208 ? 2'h3 : _T_665; // @[Lookup.scala 11:37]
  assign _T_667 = _T_204 ? 2'h3 : _T_666; // @[Lookup.scala 11:37]
  assign _T_668 = _T_200 ? 2'h3 : _T_667; // @[Lookup.scala 11:37]
  assign _T_669 = _T_196 ? 2'h3 : _T_668; // @[Lookup.scala 11:37]
  assign _T_670 = _T_192 ? 2'h3 : _T_669; // @[Lookup.scala 11:37]
  assign _T_671 = _T_188 ? 2'h0 : _T_670; // @[Lookup.scala 11:37]
  assign _T_672 = _T_184 ? 2'h0 : _T_671; // @[Lookup.scala 11:37]
  assign _T_673 = _T_180 ? 2'h0 : _T_672; // @[Lookup.scala 11:37]
  assign _T_674 = _T_176 ? 2'h0 : _T_673; // @[Lookup.scala 11:37]
  assign _T_675 = _T_172 ? 2'h0 : _T_674; // @[Lookup.scala 11:37]
  assign _T_676 = _T_168 ? 2'h0 : _T_675; // @[Lookup.scala 11:37]
  assign _T_677 = _T_164 ? 2'h0 : _T_676; // @[Lookup.scala 11:37]
  assign _T_678 = _T_160 ? 2'h0 : _T_677; // @[Lookup.scala 11:37]
  assign _T_679 = _T_156 ? 2'h0 : _T_678; // @[Lookup.scala 11:37]
  assign _T_680 = _T_152 ? 2'h0 : _T_679; // @[Lookup.scala 11:37]
  assign _T_681 = _T_148 ? 2'h0 : _T_680; // @[Lookup.scala 11:37]
  assign _T_682 = _T_144 ? 2'h0 : _T_681; // @[Lookup.scala 11:37]
  assign _T_683 = _T_140 ? 2'h0 : _T_682; // @[Lookup.scala 11:37]
  assign _T_684 = _T_136 ? 2'h0 : _T_683; // @[Lookup.scala 11:37]
  assign _T_685 = _T_132 ? 2'h0 : _T_684; // @[Lookup.scala 11:37]
  assign _T_686 = _T_128 ? 2'h0 : _T_685; // @[Lookup.scala 11:37]
  assign _T_687 = _T_124 ? 2'h0 : _T_686; // @[Lookup.scala 11:37]
  assign _T_688 = _T_120 ? 2'h0 : _T_687; // @[Lookup.scala 11:37]
  assign _T_689 = _T_116 ? 2'h0 : _T_688; // @[Lookup.scala 11:37]
  assign _T_690 = _T_112 ? 2'h0 : _T_689; // @[Lookup.scala 11:37]
  assign _T_691 = _T_108 ? 2'h0 : _T_690; // @[Lookup.scala 11:37]
  assign _T_692 = _T_104 ? 2'h0 : _T_691; // @[Lookup.scala 11:37]
  assign _T_693 = _T_100 ? 2'h0 : _T_692; // @[Lookup.scala 11:37]
  assign _T_694 = _T_96 ? 2'h0 : _T_693; // @[Lookup.scala 11:37]
  assign _T_695 = _T_92 ? 2'h1 : _T_694; // @[Lookup.scala 11:37]
  assign _T_696 = _T_88 ? 2'h1 : _T_695; // @[Lookup.scala 11:37]
  assign _T_697 = _T_84 ? 2'h1 : _T_696; // @[Lookup.scala 11:37]
  assign _T_698 = _T_80 ? 2'h1 : _T_697; // @[Lookup.scala 11:37]
  assign _T_699 = _T_76 ? 2'h1 : _T_698; // @[Lookup.scala 11:37]
  assign _T_700 = _T_72 ? 2'h0 : _T_699; // @[Lookup.scala 11:37]
  assign _T_701 = _T_68 ? 2'h0 : _T_700; // @[Lookup.scala 11:37]
  assign _T_702 = _T_64 ? 2'h0 : _T_701; // @[Lookup.scala 11:37]
  assign _T_703 = _T_60 ? 2'h0 : _T_702; // @[Lookup.scala 11:37]
  assign _T_704 = _T_56 ? 2'h0 : _T_703; // @[Lookup.scala 11:37]
  assign _T_705 = _T_52 ? 2'h0 : _T_704; // @[Lookup.scala 11:37]
  assign _T_706 = _T_48 ? 2'h2 : _T_705; // @[Lookup.scala 11:37]
  assign _T_707 = _T_44 ? 2'h2 : _T_706; // @[Lookup.scala 11:37]
  assign _T_708 = _T_40 ? 2'h0 : _T_707; // @[Lookup.scala 11:37]
  assign ctrlSignals_9 = _T_36 ? 2'h0 : _T_708; // @[Lookup.scala 11:37]
  assign _T_714 = _T_208 ? 1'h1 : _T_212; // @[Lookup.scala 11:37]
  assign _T_715 = _T_204 ? 1'h1 : _T_714; // @[Lookup.scala 11:37]
  assign _T_716 = _T_200 ? 1'h1 : _T_715; // @[Lookup.scala 11:37]
  assign _T_717 = _T_196 ? 1'h1 : _T_716; // @[Lookup.scala 11:37]
  assign _T_718 = _T_192 ? 1'h1 : _T_717; // @[Lookup.scala 11:37]
  assign _T_719 = _T_188 ? 1'h0 : _T_718; // @[Lookup.scala 11:37]
  assign _T_720 = _T_184 ? 1'h0 : _T_719; // @[Lookup.scala 11:37]
  assign _T_721 = _T_180 ? 1'h1 : _T_720; // @[Lookup.scala 11:37]
  assign _T_722 = _T_176 ? 1'h1 : _T_721; // @[Lookup.scala 11:37]
  assign _T_723 = _T_172 ? 1'h1 : _T_722; // @[Lookup.scala 11:37]
  assign _T_724 = _T_168 ? 1'h1 : _T_723; // @[Lookup.scala 11:37]
  assign _T_725 = _T_164 ? 1'h1 : _T_724; // @[Lookup.scala 11:37]
  assign _T_726 = _T_160 ? 1'h1 : _T_725; // @[Lookup.scala 11:37]
  assign _T_727 = _T_156 ? 1'h1 : _T_726; // @[Lookup.scala 11:37]
  assign _T_728 = _T_152 ? 1'h1 : _T_727; // @[Lookup.scala 11:37]
  assign _T_729 = _T_148 ? 1'h1 : _T_728; // @[Lookup.scala 11:37]
  assign _T_730 = _T_144 ? 1'h1 : _T_729; // @[Lookup.scala 11:37]
  assign _T_731 = _T_140 ? 1'h1 : _T_730; // @[Lookup.scala 11:37]
  assign _T_732 = _T_136 ? 1'h1 : _T_731; // @[Lookup.scala 11:37]
  assign _T_733 = _T_132 ? 1'h1 : _T_732; // @[Lookup.scala 11:37]
  assign _T_734 = _T_128 ? 1'h1 : _T_733; // @[Lookup.scala 11:37]
  assign _T_735 = _T_124 ? 1'h1 : _T_734; // @[Lookup.scala 11:37]
  assign _T_736 = _T_120 ? 1'h1 : _T_735; // @[Lookup.scala 11:37]
  assign _T_737 = _T_116 ? 1'h1 : _T_736; // @[Lookup.scala 11:37]
  assign _T_738 = _T_112 ? 1'h1 : _T_737; // @[Lookup.scala 11:37]
  assign _T_739 = _T_108 ? 1'h1 : _T_738; // @[Lookup.scala 11:37]
  assign _T_740 = _T_104 ? 1'h0 : _T_739; // @[Lookup.scala 11:37]
  assign _T_741 = _T_100 ? 1'h0 : _T_740; // @[Lookup.scala 11:37]
  assign _T_742 = _T_96 ? 1'h0 : _T_741; // @[Lookup.scala 11:37]
  assign _T_743 = _T_92 ? 1'h1 : _T_742; // @[Lookup.scala 11:37]
  assign _T_744 = _T_88 ? 1'h1 : _T_743; // @[Lookup.scala 11:37]
  assign _T_745 = _T_84 ? 1'h1 : _T_744; // @[Lookup.scala 11:37]
  assign _T_746 = _T_80 ? 1'h1 : _T_745; // @[Lookup.scala 11:37]
  assign _T_747 = _T_76 ? 1'h1 : _T_746; // @[Lookup.scala 11:37]
  assign _T_748 = _T_72 ? 1'h0 : _T_747; // @[Lookup.scala 11:37]
  assign _T_749 = _T_68 ? 1'h0 : _T_748; // @[Lookup.scala 11:37]
  assign _T_750 = _T_64 ? 1'h0 : _T_749; // @[Lookup.scala 11:37]
  assign _T_751 = _T_60 ? 1'h0 : _T_750; // @[Lookup.scala 11:37]
  assign _T_752 = _T_56 ? 1'h0 : _T_751; // @[Lookup.scala 11:37]
  assign _T_753 = _T_52 ? 1'h0 : _T_752; // @[Lookup.scala 11:37]
  assign _T_754 = _T_48 ? 1'h1 : _T_753; // @[Lookup.scala 11:37]
  assign _T_755 = _T_44 ? 1'h1 : _T_754; // @[Lookup.scala 11:37]
  assign _T_756 = _T_40 ? 1'h1 : _T_755; // @[Lookup.scala 11:37]
  assign ctrlSignals_10 = _T_36 ? 1'h1 : _T_756; // @[Lookup.scala 11:37]
  assign _T_758 = _T_224 ? 3'h4 : 3'h0; // @[Lookup.scala 11:37]
  assign _T_759 = _T_220 ? 3'h4 : _T_758; // @[Lookup.scala 11:37]
  assign _T_760 = _T_216 ? 3'h4 : _T_759; // @[Lookup.scala 11:37]
  assign _T_761 = _T_212 ? 3'h3 : _T_760; // @[Lookup.scala 11:37]
  assign _T_762 = _T_208 ? 3'h2 : _T_761; // @[Lookup.scala 11:37]
  assign _T_763 = _T_204 ? 3'h1 : _T_762; // @[Lookup.scala 11:37]
  assign _T_764 = _T_200 ? 3'h3 : _T_763; // @[Lookup.scala 11:37]
  assign _T_765 = _T_196 ? 3'h2 : _T_764; // @[Lookup.scala 11:37]
  assign _T_766 = _T_192 ? 3'h1 : _T_765; // @[Lookup.scala 11:37]
  assign _T_767 = _T_188 ? 3'h0 : _T_766; // @[Lookup.scala 11:37]
  assign _T_768 = _T_184 ? 3'h0 : _T_767; // @[Lookup.scala 11:37]
  assign _T_769 = _T_180 ? 3'h0 : _T_768; // @[Lookup.scala 11:37]
  assign _T_770 = _T_176 ? 3'h0 : _T_769; // @[Lookup.scala 11:37]
  assign _T_771 = _T_172 ? 3'h0 : _T_770; // @[Lookup.scala 11:37]
  assign _T_772 = _T_168 ? 3'h0 : _T_771; // @[Lookup.scala 11:37]
  assign _T_773 = _T_164 ? 3'h0 : _T_772; // @[Lookup.scala 11:37]
  assign _T_774 = _T_160 ? 3'h0 : _T_773; // @[Lookup.scala 11:37]
  assign _T_775 = _T_156 ? 3'h0 : _T_774; // @[Lookup.scala 11:37]
  assign _T_776 = _T_152 ? 3'h0 : _T_775; // @[Lookup.scala 11:37]
  assign _T_777 = _T_148 ? 3'h0 : _T_776; // @[Lookup.scala 11:37]
  assign _T_778 = _T_144 ? 3'h0 : _T_777; // @[Lookup.scala 11:37]
  assign _T_779 = _T_140 ? 3'h0 : _T_778; // @[Lookup.scala 11:37]
  assign _T_780 = _T_136 ? 3'h0 : _T_779; // @[Lookup.scala 11:37]
  assign _T_781 = _T_132 ? 3'h0 : _T_780; // @[Lookup.scala 11:37]
  assign _T_782 = _T_128 ? 3'h0 : _T_781; // @[Lookup.scala 11:37]
  assign _T_783 = _T_124 ? 3'h0 : _T_782; // @[Lookup.scala 11:37]
  assign _T_784 = _T_120 ? 3'h0 : _T_783; // @[Lookup.scala 11:37]
  assign _T_785 = _T_116 ? 3'h0 : _T_784; // @[Lookup.scala 11:37]
  assign _T_786 = _T_112 ? 3'h0 : _T_785; // @[Lookup.scala 11:37]
  assign _T_787 = _T_108 ? 3'h0 : _T_786; // @[Lookup.scala 11:37]
  assign _T_788 = _T_104 ? 3'h0 : _T_787; // @[Lookup.scala 11:37]
  assign _T_789 = _T_100 ? 3'h0 : _T_788; // @[Lookup.scala 11:37]
  assign _T_790 = _T_96 ? 3'h0 : _T_789; // @[Lookup.scala 11:37]
  assign _T_791 = _T_92 ? 3'h0 : _T_790; // @[Lookup.scala 11:37]
  assign _T_792 = _T_88 ? 3'h0 : _T_791; // @[Lookup.scala 11:37]
  assign _T_793 = _T_84 ? 3'h0 : _T_792; // @[Lookup.scala 11:37]
  assign _T_794 = _T_80 ? 3'h0 : _T_793; // @[Lookup.scala 11:37]
  assign _T_795 = _T_76 ? 3'h0 : _T_794; // @[Lookup.scala 11:37]
  assign _T_796 = _T_72 ? 3'h0 : _T_795; // @[Lookup.scala 11:37]
  assign _T_797 = _T_68 ? 3'h0 : _T_796; // @[Lookup.scala 11:37]
  assign _T_798 = _T_64 ? 3'h0 : _T_797; // @[Lookup.scala 11:37]
  assign _T_799 = _T_60 ? 3'h0 : _T_798; // @[Lookup.scala 11:37]
  assign _T_800 = _T_56 ? 3'h0 : _T_799; // @[Lookup.scala 11:37]
  assign _T_801 = _T_52 ? 3'h0 : _T_800; // @[Lookup.scala 11:37]
  assign _T_802 = _T_48 ? 3'h0 : _T_801; // @[Lookup.scala 11:37]
  assign _T_803 = _T_44 ? 3'h0 : _T_802; // @[Lookup.scala 11:37]
  assign _T_804 = _T_40 ? 3'h0 : _T_803; // @[Lookup.scala 11:37]
  assign ctrlSignals_11 = _T_36 ? 3'h0 : _T_804; // @[Lookup.scala 11:37]
  assign _T_805 = _T_228 ? 1'h0 : 1'h1; // @[Lookup.scala 11:37]
  assign _T_806 = _T_224 ? 1'h0 : _T_805; // @[Lookup.scala 11:37]
  assign _T_807 = _T_220 ? 1'h0 : _T_806; // @[Lookup.scala 11:37]
  assign _T_808 = _T_216 ? 1'h0 : _T_807; // @[Lookup.scala 11:37]
  assign _T_809 = _T_212 ? 1'h0 : _T_808; // @[Lookup.scala 11:37]
  assign _T_810 = _T_208 ? 1'h0 : _T_809; // @[Lookup.scala 11:37]
  assign _T_811 = _T_204 ? 1'h0 : _T_810; // @[Lookup.scala 11:37]
  assign _T_812 = _T_200 ? 1'h0 : _T_811; // @[Lookup.scala 11:37]
  assign _T_813 = _T_196 ? 1'h0 : _T_812; // @[Lookup.scala 11:37]
  assign _T_814 = _T_192 ? 1'h0 : _T_813; // @[Lookup.scala 11:37]
  assign _T_815 = _T_188 ? 1'h0 : _T_814; // @[Lookup.scala 11:37]
  assign _T_816 = _T_184 ? 1'h0 : _T_815; // @[Lookup.scala 11:37]
  assign _T_817 = _T_180 ? 1'h0 : _T_816; // @[Lookup.scala 11:37]
  assign _T_818 = _T_176 ? 1'h0 : _T_817; // @[Lookup.scala 11:37]
  assign _T_819 = _T_172 ? 1'h0 : _T_818; // @[Lookup.scala 11:37]
  assign _T_820 = _T_168 ? 1'h0 : _T_819; // @[Lookup.scala 11:37]
  assign _T_821 = _T_164 ? 1'h0 : _T_820; // @[Lookup.scala 11:37]
  assign _T_822 = _T_160 ? 1'h0 : _T_821; // @[Lookup.scala 11:37]
  assign _T_823 = _T_156 ? 1'h0 : _T_822; // @[Lookup.scala 11:37]
  assign _T_824 = _T_152 ? 1'h0 : _T_823; // @[Lookup.scala 11:37]
  assign _T_825 = _T_148 ? 1'h0 : _T_824; // @[Lookup.scala 11:37]
  assign _T_826 = _T_144 ? 1'h0 : _T_825; // @[Lookup.scala 11:37]
  assign _T_827 = _T_140 ? 1'h0 : _T_826; // @[Lookup.scala 11:37]
  assign _T_828 = _T_136 ? 1'h0 : _T_827; // @[Lookup.scala 11:37]
  assign _T_829 = _T_132 ? 1'h0 : _T_828; // @[Lookup.scala 11:37]
  assign _T_830 = _T_128 ? 1'h0 : _T_829; // @[Lookup.scala 11:37]
  assign _T_831 = _T_124 ? 1'h0 : _T_830; // @[Lookup.scala 11:37]
  assign _T_832 = _T_120 ? 1'h0 : _T_831; // @[Lookup.scala 11:37]
  assign _T_833 = _T_116 ? 1'h0 : _T_832; // @[Lookup.scala 11:37]
  assign _T_834 = _T_112 ? 1'h0 : _T_833; // @[Lookup.scala 11:37]
  assign _T_835 = _T_108 ? 1'h0 : _T_834; // @[Lookup.scala 11:37]
  assign _T_836 = _T_104 ? 1'h0 : _T_835; // @[Lookup.scala 11:37]
  assign _T_837 = _T_100 ? 1'h0 : _T_836; // @[Lookup.scala 11:37]
  assign _T_838 = _T_96 ? 1'h0 : _T_837; // @[Lookup.scala 11:37]
  assign _T_839 = _T_92 ? 1'h0 : _T_838; // @[Lookup.scala 11:37]
  assign _T_840 = _T_88 ? 1'h0 : _T_839; // @[Lookup.scala 11:37]
  assign _T_841 = _T_84 ? 1'h0 : _T_840; // @[Lookup.scala 11:37]
  assign _T_842 = _T_80 ? 1'h0 : _T_841; // @[Lookup.scala 11:37]
  assign _T_843 = _T_76 ? 1'h0 : _T_842; // @[Lookup.scala 11:37]
  assign _T_844 = _T_72 ? 1'h0 : _T_843; // @[Lookup.scala 11:37]
  assign _T_845 = _T_68 ? 1'h0 : _T_844; // @[Lookup.scala 11:37]
  assign _T_846 = _T_64 ? 1'h0 : _T_845; // @[Lookup.scala 11:37]
  assign _T_847 = _T_60 ? 1'h0 : _T_846; // @[Lookup.scala 11:37]
  assign _T_848 = _T_56 ? 1'h0 : _T_847; // @[Lookup.scala 11:37]
  assign _T_849 = _T_52 ? 1'h0 : _T_848; // @[Lookup.scala 11:37]
  assign _T_850 = _T_48 ? 1'h0 : _T_849; // @[Lookup.scala 11:37]
  assign _T_851 = _T_44 ? 1'h0 : _T_850; // @[Lookup.scala 11:37]
  assign _T_852 = _T_40 ? 1'h0 : _T_851; // @[Lookup.scala 11:37]
  assign ctrlSignals_12 = _T_36 ? 1'h0 : _T_852; // @[Lookup.scala 11:37]
  assign io_pc_sel = ctrlSignals_0;
  assign io_inst_kill = ctrlSignals_6;
  assign io_A_sel = ctrlSignals_1;
  assign io_B_sel = ctrlSignals_2;
  assign io_imm_sel = ctrlSignals_3;
  assign io_alu_op = ctrlSignals_4;
  assign io_br_type = ctrlSignals_5;
  assign io_st_type = ctrlSignals_7;
  assign io_ld_type = ctrlSignals_8;
  assign io_wb_sel = ctrlSignals_9;
  assign io_wb_en = ctrlSignals_10;
  assign io_csr_cmd = ctrlSignals_11;
  assign io_illegal = ctrlSignals_12;
endmodule
module Core(
  input         clock,
  input         reset,
  output        rvfi_valid,
  output [63:0] rvfi_order,
  output [31:0] rvfi_insn,
  output        rvfi_trap,
  output        rvfi_halt,
  output [4:0]  rvfi_rs1_addr,
  output [4:0]  rvfi_rs2_addr,
  output [31:0] rvfi_rs1_rdata,
  output [31:0] rvfi_rs2_rdata,
  output [4:0]  rvfi_rd_addr,
  output [31:0] rvfi_rd_wdata,
  output [31:0] rvfi_pc_rdata,
  output [31:0] rvfi_pc_wdata,
  output [31:0] rvfi_mem_addr,
  output [3:0]  rvfi_mem_rmask,
  output [3:0]  rvfi_mem_wmask,
  output [31:0] rvfi_mem_rdata,
  output [31:0] rvfi_mem_wdata,
  output        io_imemory_req_valid,
  output [31:0] io_imemory_req_bits_addr,
  input         io_imemory_resp_valid,
  input  [31:0] io_imemory_resp_bits_data,
  output        io_dmemory_abort,
  output        io_dmemory_req_valid,
  output [31:0] io_dmemory_req_bits_addr,
  output [31:0] io_dmemory_req_bits_data,
  output [3:0]  io_dmemory_req_bits_mask,
  input         io_dmemory_resp_valid,
  input  [31:0] io_dmemory_resp_bits_data
);
  wire  dpath_clock; // @[Core.scala 36:21]
  wire  dpath_reset; // @[Core.scala 36:21]
  wire  dpath_io_imemory_req_valid; // @[Core.scala 36:21]
  wire [31:0] dpath_io_imemory_req_bits_addr; // @[Core.scala 36:21]
  wire  dpath_io_imemory_resp_valid; // @[Core.scala 36:21]
  wire [31:0] dpath_io_imemory_resp_bits_data; // @[Core.scala 36:21]
  wire  dpath_io_dmemory_abort; // @[Core.scala 36:21]
  wire  dpath_io_dmemory_req_valid; // @[Core.scala 36:21]
  wire [31:0] dpath_io_dmemory_req_bits_addr; // @[Core.scala 36:21]
  wire [31:0] dpath_io_dmemory_req_bits_data; // @[Core.scala 36:21]
  wire [3:0] dpath_io_dmemory_req_bits_mask; // @[Core.scala 36:21]
  wire  dpath_io_dmemory_resp_valid; // @[Core.scala 36:21]
  wire [31:0] dpath_io_dmemory_resp_bits_data; // @[Core.scala 36:21]
  wire [31:0] dpath_io_ctrl_inst; // @[Core.scala 36:21]
  wire [1:0] dpath_io_ctrl_pc_sel; // @[Core.scala 36:21]
  wire  dpath_io_ctrl_inst_kill; // @[Core.scala 36:21]
  wire  dpath_io_ctrl_A_sel; // @[Core.scala 36:21]
  wire  dpath_io_ctrl_B_sel; // @[Core.scala 36:21]
  wire [2:0] dpath_io_ctrl_imm_sel; // @[Core.scala 36:21]
  wire [3:0] dpath_io_ctrl_alu_op; // @[Core.scala 36:21]
  wire [2:0] dpath_io_ctrl_br_type; // @[Core.scala 36:21]
  wire [1:0] dpath_io_ctrl_st_type; // @[Core.scala 36:21]
  wire [2:0] dpath_io_ctrl_ld_type; // @[Core.scala 36:21]
  wire [1:0] dpath_io_ctrl_wb_sel; // @[Core.scala 36:21]
  wire  dpath_io_ctrl_wb_en; // @[Core.scala 36:21]
  wire [2:0] dpath_io_ctrl_csr_cmd; // @[Core.scala 36:21]
  wire  dpath_io_ctrl_illegal; // @[Core.scala 36:21]
  wire  dpath_rvfi_valid; // @[Core.scala 36:21]
  wire [63:0] dpath_rvfi_order; // @[Core.scala 36:21]
  wire [31:0] dpath_rvfi_insn; // @[Core.scala 36:21]
  wire  dpath_rvfi_trap; // @[Core.scala 36:21]
  wire  dpath_rvfi_halt; // @[Core.scala 36:21]
  wire [4:0] dpath_rvfi_rs1_addr; // @[Core.scala 36:21]
  wire [4:0] dpath_rvfi_rs2_addr; // @[Core.scala 36:21]
  wire [31:0] dpath_rvfi_rs1_rdata; // @[Core.scala 36:21]
  wire [31:0] dpath_rvfi_rs2_rdata; // @[Core.scala 36:21]
  wire [4:0] dpath_rvfi_rd_addr; // @[Core.scala 36:21]
  wire [31:0] dpath_rvfi_rd_wdata; // @[Core.scala 36:21]
  wire [31:0] dpath_rvfi_pc_rdata; // @[Core.scala 36:21]
  wire [31:0] dpath_rvfi_pc_wdata; // @[Core.scala 36:21]
  wire [31:0] dpath_rvfi_mem_addr; // @[Core.scala 36:21]
  wire [3:0] dpath_rvfi_mem_rmask; // @[Core.scala 36:21]
  wire [3:0] dpath_rvfi_mem_wmask; // @[Core.scala 36:21]
  wire [31:0] dpath_rvfi_mem_rdata; // @[Core.scala 36:21]
  wire [31:0] dpath_rvfi_mem_wdata; // @[Core.scala 36:21]
  wire [31:0] ctrl_io_inst; // @[Core.scala 37:21]
  wire [1:0] ctrl_io_pc_sel; // @[Core.scala 37:21]
  wire  ctrl_io_inst_kill; // @[Core.scala 37:21]
  wire  ctrl_io_A_sel; // @[Core.scala 37:21]
  wire  ctrl_io_B_sel; // @[Core.scala 37:21]
  wire [2:0] ctrl_io_imm_sel; // @[Core.scala 37:21]
  wire [3:0] ctrl_io_alu_op; // @[Core.scala 37:21]
  wire [2:0] ctrl_io_br_type; // @[Core.scala 37:21]
  wire [1:0] ctrl_io_st_type; // @[Core.scala 37:21]
  wire [2:0] ctrl_io_ld_type; // @[Core.scala 37:21]
  wire [1:0] ctrl_io_wb_sel; // @[Core.scala 37:21]
  wire  ctrl_io_wb_en; // @[Core.scala 37:21]
  wire [2:0] ctrl_io_csr_cmd; // @[Core.scala 37:21]
  wire  ctrl_io_illegal; // @[Core.scala 37:21]
  Datapath dpath ( // @[Core.scala 36:21]
    .clock(dpath_clock),
    .reset(dpath_reset),
    .io_imemory_req_valid(dpath_io_imemory_req_valid),
    .io_imemory_req_bits_addr(dpath_io_imemory_req_bits_addr),
    .io_imemory_resp_valid(dpath_io_imemory_resp_valid),
    .io_imemory_resp_bits_data(dpath_io_imemory_resp_bits_data),
    .io_dmemory_abort(dpath_io_dmemory_abort),
    .io_dmemory_req_valid(dpath_io_dmemory_req_valid),
    .io_dmemory_req_bits_addr(dpath_io_dmemory_req_bits_addr),
    .io_dmemory_req_bits_data(dpath_io_dmemory_req_bits_data),
    .io_dmemory_req_bits_mask(dpath_io_dmemory_req_bits_mask),
    .io_dmemory_resp_valid(dpath_io_dmemory_resp_valid),
    .io_dmemory_resp_bits_data(dpath_io_dmemory_resp_bits_data),
    .io_ctrl_inst(dpath_io_ctrl_inst),
    .io_ctrl_pc_sel(dpath_io_ctrl_pc_sel),
    .io_ctrl_inst_kill(dpath_io_ctrl_inst_kill),
    .io_ctrl_A_sel(dpath_io_ctrl_A_sel),
    .io_ctrl_B_sel(dpath_io_ctrl_B_sel),
    .io_ctrl_imm_sel(dpath_io_ctrl_imm_sel),
    .io_ctrl_alu_op(dpath_io_ctrl_alu_op),
    .io_ctrl_br_type(dpath_io_ctrl_br_type),
    .io_ctrl_st_type(dpath_io_ctrl_st_type),
    .io_ctrl_ld_type(dpath_io_ctrl_ld_type),
    .io_ctrl_wb_sel(dpath_io_ctrl_wb_sel),
    .io_ctrl_wb_en(dpath_io_ctrl_wb_en),
    .io_ctrl_csr_cmd(dpath_io_ctrl_csr_cmd),
    .io_ctrl_illegal(dpath_io_ctrl_illegal),
    .rvfi_valid(dpath_rvfi_valid),
    .rvfi_order(dpath_rvfi_order),
    .rvfi_insn(dpath_rvfi_insn),
    .rvfi_trap(dpath_rvfi_trap),
    .rvfi_halt(dpath_rvfi_halt),
    .rvfi_rs1_addr(dpath_rvfi_rs1_addr),
    .rvfi_rs2_addr(dpath_rvfi_rs2_addr),
    .rvfi_rs1_rdata(dpath_rvfi_rs1_rdata),
    .rvfi_rs2_rdata(dpath_rvfi_rs2_rdata),
    .rvfi_rd_addr(dpath_rvfi_rd_addr),
    .rvfi_rd_wdata(dpath_rvfi_rd_wdata),
    .rvfi_pc_rdata(dpath_rvfi_pc_rdata),
    .rvfi_pc_wdata(dpath_rvfi_pc_wdata),
    .rvfi_mem_addr(dpath_rvfi_mem_addr),
    .rvfi_mem_rmask(dpath_rvfi_mem_rmask),
    .rvfi_mem_wmask(dpath_rvfi_mem_wmask),
    .rvfi_mem_rdata(dpath_rvfi_mem_rdata),
    .rvfi_mem_wdata(dpath_rvfi_mem_wdata)
  );
  Control ctrl ( // @[Core.scala 37:21]
    .io_inst(ctrl_io_inst),
    .io_pc_sel(ctrl_io_pc_sel),
    .io_inst_kill(ctrl_io_inst_kill),
    .io_A_sel(ctrl_io_A_sel),
    .io_B_sel(ctrl_io_B_sel),
    .io_imm_sel(ctrl_io_imm_sel),
    .io_alu_op(ctrl_io_alu_op),
    .io_br_type(ctrl_io_br_type),
    .io_st_type(ctrl_io_st_type),
    .io_ld_type(ctrl_io_ld_type),
    .io_wb_sel(ctrl_io_wb_sel),
    .io_wb_en(ctrl_io_wb_en),
    .io_csr_cmd(ctrl_io_csr_cmd),
    .io_illegal(ctrl_io_illegal)
  );
  assign rvfi_valid = dpath_rvfi_valid;
  assign rvfi_order = dpath_rvfi_order;
  assign rvfi_insn = dpath_rvfi_insn;
  assign rvfi_trap = dpath_rvfi_trap;
  assign rvfi_halt = dpath_rvfi_halt;
  assign rvfi_rs1_addr = dpath_rvfi_rs1_addr;
  assign rvfi_rs2_addr = dpath_rvfi_rs2_addr;
  assign rvfi_rs1_rdata = dpath_rvfi_rs1_rdata;
  assign rvfi_rs2_rdata = dpath_rvfi_rs2_rdata;
  assign rvfi_rd_addr = dpath_rvfi_rd_addr;
  assign rvfi_rd_wdata = dpath_rvfi_rd_wdata;
  assign rvfi_pc_rdata = dpath_rvfi_pc_rdata;
  assign rvfi_pc_wdata = dpath_rvfi_pc_wdata;
  assign rvfi_mem_addr = dpath_rvfi_mem_addr;
  assign rvfi_mem_rmask = dpath_rvfi_mem_rmask;
  assign rvfi_mem_wmask = dpath_rvfi_mem_wmask;
  assign rvfi_mem_rdata = dpath_rvfi_mem_rdata;
  assign rvfi_mem_wdata = dpath_rvfi_mem_wdata;
  assign io_imemory_req_valid = dpath_io_imemory_req_valid;
  assign io_imemory_req_bits_addr = dpath_io_imemory_req_bits_addr;
  assign io_dmemory_abort = dpath_io_dmemory_abort;
  assign io_dmemory_req_valid = dpath_io_dmemory_req_valid;
  assign io_dmemory_req_bits_addr = dpath_io_dmemory_req_bits_addr;
  assign io_dmemory_req_bits_data = dpath_io_dmemory_req_bits_data;
  assign io_dmemory_req_bits_mask = dpath_io_dmemory_req_bits_mask;
  assign dpath_clock = clock;
  assign dpath_reset = reset;
  assign dpath_io_imemory_resp_valid = io_imemory_resp_valid;
  assign dpath_io_imemory_resp_bits_data = io_imemory_resp_bits_data;
  assign dpath_io_dmemory_resp_valid = io_dmemory_resp_valid;
  assign dpath_io_dmemory_resp_bits_data = io_dmemory_resp_bits_data;
  assign dpath_io_ctrl_pc_sel = ctrl_io_pc_sel;
  assign dpath_io_ctrl_inst_kill = ctrl_io_inst_kill;
  assign dpath_io_ctrl_A_sel = ctrl_io_A_sel;
  assign dpath_io_ctrl_B_sel = ctrl_io_B_sel;
  assign dpath_io_ctrl_imm_sel = ctrl_io_imm_sel;
  assign dpath_io_ctrl_alu_op = ctrl_io_alu_op;
  assign dpath_io_ctrl_br_type = ctrl_io_br_type;
  assign dpath_io_ctrl_st_type = ctrl_io_st_type;
  assign dpath_io_ctrl_ld_type = ctrl_io_ld_type;
  assign dpath_io_ctrl_wb_sel = ctrl_io_wb_sel;
  assign dpath_io_ctrl_wb_en = ctrl_io_wb_en;
  assign dpath_io_ctrl_csr_cmd = ctrl_io_csr_cmd;
  assign dpath_io_ctrl_illegal = ctrl_io_illegal;
  assign ctrl_io_inst = dpath_io_ctrl_inst;
endmodule
module Memory(
  input         clock,
  input         reset,
  input         io_abort,
  input         io_req_valid,
  input  [31:0] io_req_bits_addr,
  input  [31:0] io_req_bits_data,
  input  [3:0]  io_req_bits_mask,
  output        io_resp_valid,
  output [31:0] io_resp_bits_data
);
  reg [7:0] dataMem_0_0 [0:255]; // @[Memory.scala 44:45]
  reg [31:0] _RAND_0;
  wire [7:0] dataMem_0_0__T_75_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_0_0__T_75_addr; // @[Memory.scala 44:45]
  wire [7:0] dataMem_0_0__T_195_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_0_0__T_195_addr; // @[Memory.scala 44:45]
  wire  dataMem_0_0__T_195_mask; // @[Memory.scala 44:45]
  wire  dataMem_0_0__T_195_en; // @[Memory.scala 44:45]
  wire  _GEN_87;
  reg [7:0] dataMem_0_0__T_75_addr_pipe_0;
  reg [31:0] _RAND_1;
  reg [7:0] dataMem_0_1 [0:255]; // @[Memory.scala 44:45]
  reg [31:0] _RAND_2;
  wire [7:0] dataMem_0_1__T_75_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_0_1__T_75_addr; // @[Memory.scala 44:45]
  wire [7:0] dataMem_0_1__T_195_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_0_1__T_195_addr; // @[Memory.scala 44:45]
  wire  dataMem_0_1__T_195_mask; // @[Memory.scala 44:45]
  wire  dataMem_0_1__T_195_en; // @[Memory.scala 44:45]
  reg [7:0] dataMem_0_1__T_75_addr_pipe_0;
  reg [31:0] _RAND_3;
  reg [7:0] dataMem_0_2 [0:255]; // @[Memory.scala 44:45]
  reg [31:0] _RAND_4;
  wire [7:0] dataMem_0_2__T_75_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_0_2__T_75_addr; // @[Memory.scala 44:45]
  wire [7:0] dataMem_0_2__T_195_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_0_2__T_195_addr; // @[Memory.scala 44:45]
  wire  dataMem_0_2__T_195_mask; // @[Memory.scala 44:45]
  wire  dataMem_0_2__T_195_en; // @[Memory.scala 44:45]
  reg [7:0] dataMem_0_2__T_75_addr_pipe_0;
  reg [31:0] _RAND_5;
  reg [7:0] dataMem_0_3 [0:255]; // @[Memory.scala 44:45]
  reg [31:0] _RAND_6;
  wire [7:0] dataMem_0_3__T_75_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_0_3__T_75_addr; // @[Memory.scala 44:45]
  wire [7:0] dataMem_0_3__T_195_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_0_3__T_195_addr; // @[Memory.scala 44:45]
  wire  dataMem_0_3__T_195_mask; // @[Memory.scala 44:45]
  wire  dataMem_0_3__T_195_en; // @[Memory.scala 44:45]
  reg [7:0] dataMem_0_3__T_75_addr_pipe_0;
  reg [31:0] _RAND_7;
  reg [7:0] dataMem_1_0 [0:255]; // @[Memory.scala 44:45]
  reg [31:0] _RAND_8;
  wire [7:0] dataMem_1_0__T_95_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_1_0__T_95_addr; // @[Memory.scala 44:45]
  wire [7:0] dataMem_1_0__T_225_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_1_0__T_225_addr; // @[Memory.scala 44:45]
  wire  dataMem_1_0__T_225_mask; // @[Memory.scala 44:45]
  wire  dataMem_1_0__T_225_en; // @[Memory.scala 44:45]
  reg [7:0] dataMem_1_0__T_95_addr_pipe_0;
  reg [31:0] _RAND_9;
  reg [7:0] dataMem_1_1 [0:255]; // @[Memory.scala 44:45]
  reg [31:0] _RAND_10;
  wire [7:0] dataMem_1_1__T_95_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_1_1__T_95_addr; // @[Memory.scala 44:45]
  wire [7:0] dataMem_1_1__T_225_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_1_1__T_225_addr; // @[Memory.scala 44:45]
  wire  dataMem_1_1__T_225_mask; // @[Memory.scala 44:45]
  wire  dataMem_1_1__T_225_en; // @[Memory.scala 44:45]
  reg [7:0] dataMem_1_1__T_95_addr_pipe_0;
  reg [31:0] _RAND_11;
  reg [7:0] dataMem_1_2 [0:255]; // @[Memory.scala 44:45]
  reg [31:0] _RAND_12;
  wire [7:0] dataMem_1_2__T_95_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_1_2__T_95_addr; // @[Memory.scala 44:45]
  wire [7:0] dataMem_1_2__T_225_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_1_2__T_225_addr; // @[Memory.scala 44:45]
  wire  dataMem_1_2__T_225_mask; // @[Memory.scala 44:45]
  wire  dataMem_1_2__T_225_en; // @[Memory.scala 44:45]
  reg [7:0] dataMem_1_2__T_95_addr_pipe_0;
  reg [31:0] _RAND_13;
  reg [7:0] dataMem_1_3 [0:255]; // @[Memory.scala 44:45]
  reg [31:0] _RAND_14;
  wire [7:0] dataMem_1_3__T_95_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_1_3__T_95_addr; // @[Memory.scala 44:45]
  wire [7:0] dataMem_1_3__T_225_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_1_3__T_225_addr; // @[Memory.scala 44:45]
  wire  dataMem_1_3__T_225_mask; // @[Memory.scala 44:45]
  wire  dataMem_1_3__T_225_en; // @[Memory.scala 44:45]
  reg [7:0] dataMem_1_3__T_95_addr_pipe_0;
  reg [31:0] _RAND_15;
  reg [7:0] dataMem_2_0 [0:255]; // @[Memory.scala 44:45]
  reg [31:0] _RAND_16;
  wire [7:0] dataMem_2_0__T_115_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_2_0__T_115_addr; // @[Memory.scala 44:45]
  wire [7:0] dataMem_2_0__T_255_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_2_0__T_255_addr; // @[Memory.scala 44:45]
  wire  dataMem_2_0__T_255_mask; // @[Memory.scala 44:45]
  wire  dataMem_2_0__T_255_en; // @[Memory.scala 44:45]
  reg [7:0] dataMem_2_0__T_115_addr_pipe_0;
  reg [31:0] _RAND_17;
  reg [7:0] dataMem_2_1 [0:255]; // @[Memory.scala 44:45]
  reg [31:0] _RAND_18;
  wire [7:0] dataMem_2_1__T_115_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_2_1__T_115_addr; // @[Memory.scala 44:45]
  wire [7:0] dataMem_2_1__T_255_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_2_1__T_255_addr; // @[Memory.scala 44:45]
  wire  dataMem_2_1__T_255_mask; // @[Memory.scala 44:45]
  wire  dataMem_2_1__T_255_en; // @[Memory.scala 44:45]
  reg [7:0] dataMem_2_1__T_115_addr_pipe_0;
  reg [31:0] _RAND_19;
  reg [7:0] dataMem_2_2 [0:255]; // @[Memory.scala 44:45]
  reg [31:0] _RAND_20;
  wire [7:0] dataMem_2_2__T_115_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_2_2__T_115_addr; // @[Memory.scala 44:45]
  wire [7:0] dataMem_2_2__T_255_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_2_2__T_255_addr; // @[Memory.scala 44:45]
  wire  dataMem_2_2__T_255_mask; // @[Memory.scala 44:45]
  wire  dataMem_2_2__T_255_en; // @[Memory.scala 44:45]
  reg [7:0] dataMem_2_2__T_115_addr_pipe_0;
  reg [31:0] _RAND_21;
  reg [7:0] dataMem_2_3 [0:255]; // @[Memory.scala 44:45]
  reg [31:0] _RAND_22;
  wire [7:0] dataMem_2_3__T_115_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_2_3__T_115_addr; // @[Memory.scala 44:45]
  wire [7:0] dataMem_2_3__T_255_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_2_3__T_255_addr; // @[Memory.scala 44:45]
  wire  dataMem_2_3__T_255_mask; // @[Memory.scala 44:45]
  wire  dataMem_2_3__T_255_en; // @[Memory.scala 44:45]
  reg [7:0] dataMem_2_3__T_115_addr_pipe_0;
  reg [31:0] _RAND_23;
  reg [7:0] dataMem_3_0 [0:255]; // @[Memory.scala 44:45]
  reg [31:0] _RAND_24;
  wire [7:0] dataMem_3_0__T_135_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_3_0__T_135_addr; // @[Memory.scala 44:45]
  wire [7:0] dataMem_3_0__T_285_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_3_0__T_285_addr; // @[Memory.scala 44:45]
  wire  dataMem_3_0__T_285_mask; // @[Memory.scala 44:45]
  wire  dataMem_3_0__T_285_en; // @[Memory.scala 44:45]
  reg [7:0] dataMem_3_0__T_135_addr_pipe_0;
  reg [31:0] _RAND_25;
  reg [7:0] dataMem_3_1 [0:255]; // @[Memory.scala 44:45]
  reg [31:0] _RAND_26;
  wire [7:0] dataMem_3_1__T_135_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_3_1__T_135_addr; // @[Memory.scala 44:45]
  wire [7:0] dataMem_3_1__T_285_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_3_1__T_285_addr; // @[Memory.scala 44:45]
  wire  dataMem_3_1__T_285_mask; // @[Memory.scala 44:45]
  wire  dataMem_3_1__T_285_en; // @[Memory.scala 44:45]
  reg [7:0] dataMem_3_1__T_135_addr_pipe_0;
  reg [31:0] _RAND_27;
  reg [7:0] dataMem_3_2 [0:255]; // @[Memory.scala 44:45]
  reg [31:0] _RAND_28;
  wire [7:0] dataMem_3_2__T_135_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_3_2__T_135_addr; // @[Memory.scala 44:45]
  wire [7:0] dataMem_3_2__T_285_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_3_2__T_285_addr; // @[Memory.scala 44:45]
  wire  dataMem_3_2__T_285_mask; // @[Memory.scala 44:45]
  wire  dataMem_3_2__T_285_en; // @[Memory.scala 44:45]
  reg [7:0] dataMem_3_2__T_135_addr_pipe_0;
  reg [31:0] _RAND_29;
  reg [7:0] dataMem_3_3 [0:255]; // @[Memory.scala 44:45]
  reg [31:0] _RAND_30;
  wire [7:0] dataMem_3_3__T_135_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_3_3__T_135_addr; // @[Memory.scala 44:45]
  wire [7:0] dataMem_3_3__T_285_data; // @[Memory.scala 44:45]
  wire [7:0] dataMem_3_3__T_285_addr; // @[Memory.scala 44:45]
  wire  dataMem_3_3__T_285_mask; // @[Memory.scala 44:45]
  wire  dataMem_3_3__T_285_en; // @[Memory.scala 44:45]
  reg [7:0] dataMem_3_3__T_135_addr_pipe_0;
  reg [31:0] _RAND_31;
  reg [1:0] state; // @[Memory.scala 47:22]
  reg [31:0] _RAND_32;
  reg [31:0] addr_reg; // @[Memory.scala 49:21]
  reg [31:0] _RAND_33;
  reg [31:0] cpu_data; // @[Memory.scala 50:21]
  reg [31:0] _RAND_34;
  reg [3:0] cpu_mask; // @[Memory.scala 51:21]
  reg [31:0] _RAND_35;
  reg  ren_reg; // @[Memory.scala 58:24]
  reg [31:0] _RAND_36;
  reg [127:0] rdata_buf; // @[Reg.scala 11:16]
  reg [127:0] _RAND_37;
  wire  is_idle; // @[Memory.scala 53:23]
  wire  is_read; // @[Memory.scala 54:23]
  wire  is_write; // @[Memory.scala 55:24]
  wire  _T_64; // @[Memory.scala 56:25]
  wire  wen; // @[Memory.scala 56:22]
  wire  _T_66; // @[Memory.scala 57:13]
  wire  _T_67; // @[Memory.scala 57:30]
  wire  _T_68; // @[Memory.scala 57:18]
  wire  ren; // @[Memory.scala 57:42]
  wire [7:0] idx; // @[Memory.scala 61:22]
  wire [7:0] idx_reg; // @[Memory.scala 63:26]
  wire [1:0] off_reg; // @[Memory.scala 64:26]
  wire [15:0] _T_87; // @[Memory.scala 66:50]
  wire [15:0] _T_88; // @[Memory.scala 66:50]
  wire [31:0] _T_89; // @[Memory.scala 66:50]
  wire [15:0] _T_107; // @[Memory.scala 66:50]
  wire [15:0] _T_108; // @[Memory.scala 66:50]
  wire [31:0] _T_109; // @[Memory.scala 66:50]
  wire [15:0] _T_127; // @[Memory.scala 66:50]
  wire [15:0] _T_128; // @[Memory.scala 66:50]
  wire [31:0] _T_129; // @[Memory.scala 66:50]
  wire [15:0] _T_147; // @[Memory.scala 66:50]
  wire [15:0] _T_148; // @[Memory.scala 66:50]
  wire [31:0] _T_149; // @[Memory.scala 66:50]
  wire [63:0] _T_150; // @[Cat.scala 30:58]
  wire [63:0] _T_151; // @[Cat.scala 30:58]
  wire [127:0] rdata; // @[Cat.scala 30:58]
  wire [127:0] _GEN_7; // @[Reg.scala 12:19]
  wire [31:0] _T_153; // @[Memory.scala 70:54]
  wire [31:0] _T_154; // @[Memory.scala 70:54]
  wire [31:0] _T_155; // @[Memory.scala 70:54]
  wire [31:0] _T_156; // @[Memory.scala 70:54]
  wire [31:0] _GEN_9; // @[Memory.scala 70:21]
  wire [31:0] _GEN_10; // @[Memory.scala 70:21]
  wire [31:0] _GEN_11; // @[Memory.scala 70:21]
  wire  _T_169; // @[Memory.scala 71:56]
  wire  _T_171; // @[Memory.scala 71:46]
  wire  _T_172; // @[Memory.scala 71:43]
  wire [31:0] _GEN_12; // @[Memory.scala 73:23]
  wire [31:0] _GEN_13; // @[Memory.scala 73:23]
  wire [3:0] _GEN_14; // @[Memory.scala 73:23]
  wire [3:0] _T_174; // @[Cat.scala 30:58]
  wire [18:0] _GEN_183; // @[Memory.scala 79:25]
  wire [18:0] _T_175; // @[Memory.scala 79:25]
  wire [19:0] wmask; // @[Memory.scala 79:65]
  wire [63:0] _T_176; // @[Cat.scala 30:58]
  wire [127:0] wdata; // @[Cat.scala 30:58]
  wire [7:0] _T_177; // @[Memory.scala 83:49]
  wire [7:0] _T_178; // @[Memory.scala 83:49]
  wire [7:0] _T_179; // @[Memory.scala 83:49]
  wire [7:0] _T_180; // @[Memory.scala 83:49]
  wire [3:0] _T_190; // @[Memory.scala 84:37]
  wire  _T_191; // @[Memory.scala 84:64]
  wire  _T_192; // @[Memory.scala 84:64]
  wire  _T_193; // @[Memory.scala 84:64]
  wire  _T_194; // @[Memory.scala 84:64]
  wire [7:0] _T_207; // @[Memory.scala 83:49]
  wire [7:0] _T_208; // @[Memory.scala 83:49]
  wire [7:0] _T_209; // @[Memory.scala 83:49]
  wire [7:0] _T_210; // @[Memory.scala 83:49]
  wire [3:0] _T_220; // @[Memory.scala 84:37]
  wire  _T_221; // @[Memory.scala 84:64]
  wire  _T_222; // @[Memory.scala 84:64]
  wire  _T_223; // @[Memory.scala 84:64]
  wire  _T_224; // @[Memory.scala 84:64]
  wire [7:0] _T_237; // @[Memory.scala 83:49]
  wire [7:0] _T_238; // @[Memory.scala 83:49]
  wire [7:0] _T_239; // @[Memory.scala 83:49]
  wire [7:0] _T_240; // @[Memory.scala 83:49]
  wire [3:0] _T_250; // @[Memory.scala 84:37]
  wire  _T_251; // @[Memory.scala 84:64]
  wire  _T_252; // @[Memory.scala 84:64]
  wire  _T_253; // @[Memory.scala 84:64]
  wire  _T_254; // @[Memory.scala 84:64]
  wire [7:0] _T_267; // @[Memory.scala 83:49]
  wire [7:0] _T_268; // @[Memory.scala 83:49]
  wire [7:0] _T_269; // @[Memory.scala 83:49]
  wire [7:0] _T_270; // @[Memory.scala 83:49]
  wire [3:0] _T_280; // @[Memory.scala 84:37]
  wire  _T_281; // @[Memory.scala 84:64]
  wire  _T_282; // @[Memory.scala 84:64]
  wire  _T_283; // @[Memory.scala 84:64]
  wire  _T_284; // @[Memory.scala 84:64]
  wire  _GEN_51; // @[Memory.scala 81:13]
  wire  _GEN_53; // @[Memory.scala 81:13]
  wire  _GEN_55; // @[Memory.scala 81:13]
  wire  _GEN_57; // @[Memory.scala 81:13]
  wire  _GEN_59; // @[Memory.scala 81:13]
  wire  _GEN_61; // @[Memory.scala 81:13]
  wire  _GEN_63; // @[Memory.scala 81:13]
  wire  _GEN_65; // @[Memory.scala 81:13]
  wire  _GEN_67; // @[Memory.scala 81:13]
  wire  _GEN_69; // @[Memory.scala 81:13]
  wire  _GEN_71; // @[Memory.scala 81:13]
  wire  _GEN_73; // @[Memory.scala 81:13]
  wire  _GEN_75; // @[Memory.scala 81:13]
  wire  _GEN_77; // @[Memory.scala 81:13]
  wire  _GEN_79; // @[Memory.scala 81:13]
  wire  _GEN_81; // @[Memory.scala 81:13]
  wire  _T_297; // @[Conditional.scala 37:30]
  wire  _T_299; // @[Memory.scala 92:39]
  wire [1:0] _T_300; // @[Memory.scala 92:21]
  wire [1:0] _GEN_82; // @[Memory.scala 91:26]
  wire  _T_301; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_83; // @[Memory.scala 96:26]
  wire  _T_305; // @[Conditional.scala 37:30]
  wire [1:0] _T_308; // @[Memory.scala 103:19]
  wire [1:0] _GEN_84; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_85; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_86; // @[Conditional.scala 40:58]
  assign dataMem_0_0__T_75_addr = dataMem_0_0__T_75_addr_pipe_0;
  assign dataMem_0_0__T_75_data = dataMem_0_0[dataMem_0_0__T_75_addr]; // @[Memory.scala 44:45]
  assign dataMem_0_0__T_195_data = _T_177;
  assign dataMem_0_0__T_195_addr = idx_reg;
  assign dataMem_0_0__T_195_mask = _GEN_51;
  assign dataMem_0_0__T_195_en = wen;
  assign _GEN_87 = ren;
  assign dataMem_0_1__T_75_addr = dataMem_0_1__T_75_addr_pipe_0;
  assign dataMem_0_1__T_75_data = dataMem_0_1[dataMem_0_1__T_75_addr]; // @[Memory.scala 44:45]
  assign dataMem_0_1__T_195_data = _T_178;
  assign dataMem_0_1__T_195_addr = idx_reg;
  assign dataMem_0_1__T_195_mask = _GEN_53;
  assign dataMem_0_1__T_195_en = wen;
  assign dataMem_0_2__T_75_addr = dataMem_0_2__T_75_addr_pipe_0;
  assign dataMem_0_2__T_75_data = dataMem_0_2[dataMem_0_2__T_75_addr]; // @[Memory.scala 44:45]
  assign dataMem_0_2__T_195_data = _T_179;
  assign dataMem_0_2__T_195_addr = idx_reg;
  assign dataMem_0_2__T_195_mask = _GEN_55;
  assign dataMem_0_2__T_195_en = wen;
  assign dataMem_0_3__T_75_addr = dataMem_0_3__T_75_addr_pipe_0;
  assign dataMem_0_3__T_75_data = dataMem_0_3[dataMem_0_3__T_75_addr]; // @[Memory.scala 44:45]
  assign dataMem_0_3__T_195_data = _T_180;
  assign dataMem_0_3__T_195_addr = idx_reg;
  assign dataMem_0_3__T_195_mask = _GEN_57;
  assign dataMem_0_3__T_195_en = wen;
  assign dataMem_1_0__T_95_addr = dataMem_1_0__T_95_addr_pipe_0;
  assign dataMem_1_0__T_95_data = dataMem_1_0[dataMem_1_0__T_95_addr]; // @[Memory.scala 44:45]
  assign dataMem_1_0__T_225_data = _T_207;
  assign dataMem_1_0__T_225_addr = idx_reg;
  assign dataMem_1_0__T_225_mask = _GEN_59;
  assign dataMem_1_0__T_225_en = wen;
  assign dataMem_1_1__T_95_addr = dataMem_1_1__T_95_addr_pipe_0;
  assign dataMem_1_1__T_95_data = dataMem_1_1[dataMem_1_1__T_95_addr]; // @[Memory.scala 44:45]
  assign dataMem_1_1__T_225_data = _T_208;
  assign dataMem_1_1__T_225_addr = idx_reg;
  assign dataMem_1_1__T_225_mask = _GEN_61;
  assign dataMem_1_1__T_225_en = wen;
  assign dataMem_1_2__T_95_addr = dataMem_1_2__T_95_addr_pipe_0;
  assign dataMem_1_2__T_95_data = dataMem_1_2[dataMem_1_2__T_95_addr]; // @[Memory.scala 44:45]
  assign dataMem_1_2__T_225_data = _T_209;
  assign dataMem_1_2__T_225_addr = idx_reg;
  assign dataMem_1_2__T_225_mask = _GEN_63;
  assign dataMem_1_2__T_225_en = wen;
  assign dataMem_1_3__T_95_addr = dataMem_1_3__T_95_addr_pipe_0;
  assign dataMem_1_3__T_95_data = dataMem_1_3[dataMem_1_3__T_95_addr]; // @[Memory.scala 44:45]
  assign dataMem_1_3__T_225_data = _T_210;
  assign dataMem_1_3__T_225_addr = idx_reg;
  assign dataMem_1_3__T_225_mask = _GEN_65;
  assign dataMem_1_3__T_225_en = wen;
  assign dataMem_2_0__T_115_addr = dataMem_2_0__T_115_addr_pipe_0;
  assign dataMem_2_0__T_115_data = dataMem_2_0[dataMem_2_0__T_115_addr]; // @[Memory.scala 44:45]
  assign dataMem_2_0__T_255_data = _T_237;
  assign dataMem_2_0__T_255_addr = idx_reg;
  assign dataMem_2_0__T_255_mask = _GEN_67;
  assign dataMem_2_0__T_255_en = wen;
  assign dataMem_2_1__T_115_addr = dataMem_2_1__T_115_addr_pipe_0;
  assign dataMem_2_1__T_115_data = dataMem_2_1[dataMem_2_1__T_115_addr]; // @[Memory.scala 44:45]
  assign dataMem_2_1__T_255_data = _T_238;
  assign dataMem_2_1__T_255_addr = idx_reg;
  assign dataMem_2_1__T_255_mask = _GEN_69;
  assign dataMem_2_1__T_255_en = wen;
  assign dataMem_2_2__T_115_addr = dataMem_2_2__T_115_addr_pipe_0;
  assign dataMem_2_2__T_115_data = dataMem_2_2[dataMem_2_2__T_115_addr]; // @[Memory.scala 44:45]
  assign dataMem_2_2__T_255_data = _T_239;
  assign dataMem_2_2__T_255_addr = idx_reg;
  assign dataMem_2_2__T_255_mask = _GEN_71;
  assign dataMem_2_2__T_255_en = wen;
  assign dataMem_2_3__T_115_addr = dataMem_2_3__T_115_addr_pipe_0;
  assign dataMem_2_3__T_115_data = dataMem_2_3[dataMem_2_3__T_115_addr]; // @[Memory.scala 44:45]
  assign dataMem_2_3__T_255_data = _T_240;
  assign dataMem_2_3__T_255_addr = idx_reg;
  assign dataMem_2_3__T_255_mask = _GEN_73;
  assign dataMem_2_3__T_255_en = wen;
  assign dataMem_3_0__T_135_addr = dataMem_3_0__T_135_addr_pipe_0;
  assign dataMem_3_0__T_135_data = dataMem_3_0[dataMem_3_0__T_135_addr]; // @[Memory.scala 44:45]
  assign dataMem_3_0__T_285_data = _T_267;
  assign dataMem_3_0__T_285_addr = idx_reg;
  assign dataMem_3_0__T_285_mask = _GEN_75;
  assign dataMem_3_0__T_285_en = wen;
  assign dataMem_3_1__T_135_addr = dataMem_3_1__T_135_addr_pipe_0;
  assign dataMem_3_1__T_135_data = dataMem_3_1[dataMem_3_1__T_135_addr]; // @[Memory.scala 44:45]
  assign dataMem_3_1__T_285_data = _T_268;
  assign dataMem_3_1__T_285_addr = idx_reg;
  assign dataMem_3_1__T_285_mask = _GEN_77;
  assign dataMem_3_1__T_285_en = wen;
  assign dataMem_3_2__T_135_addr = dataMem_3_2__T_135_addr_pipe_0;
  assign dataMem_3_2__T_135_data = dataMem_3_2[dataMem_3_2__T_135_addr]; // @[Memory.scala 44:45]
  assign dataMem_3_2__T_285_data = _T_269;
  assign dataMem_3_2__T_285_addr = idx_reg;
  assign dataMem_3_2__T_285_mask = _GEN_79;
  assign dataMem_3_2__T_285_en = wen;
  assign dataMem_3_3__T_135_addr = dataMem_3_3__T_135_addr_pipe_0;
  assign dataMem_3_3__T_135_data = dataMem_3_3[dataMem_3_3__T_135_addr]; // @[Memory.scala 44:45]
  assign dataMem_3_3__T_285_data = _T_270;
  assign dataMem_3_3__T_285_addr = idx_reg;
  assign dataMem_3_3__T_285_mask = _GEN_81;
  assign dataMem_3_3__T_285_en = wen;
  assign is_idle = state == 2'h0; // @[Memory.scala 53:23]
  assign is_read = state == 2'h1; // @[Memory.scala 54:23]
  assign is_write = state == 2'h2; // @[Memory.scala 55:24]
  assign _T_64 = io_abort == 1'h0; // @[Memory.scala 56:25]
  assign wen = is_write & _T_64; // @[Memory.scala 56:22]
  assign _T_66 = wen == 1'h0; // @[Memory.scala 57:13]
  assign _T_67 = is_idle | is_read; // @[Memory.scala 57:30]
  assign _T_68 = _T_66 & _T_67; // @[Memory.scala 57:18]
  assign ren = _T_68 & io_req_valid; // @[Memory.scala 57:42]
  assign idx = io_req_bits_addr[11:4]; // @[Memory.scala 61:22]
  assign idx_reg = addr_reg[11:4]; // @[Memory.scala 63:26]
  assign off_reg = addr_reg[3:2]; // @[Memory.scala 64:26]
  assign _T_87 = {dataMem_0_1__T_75_data,dataMem_0_0__T_75_data}; // @[Memory.scala 66:50]
  assign _T_88 = {dataMem_0_3__T_75_data,dataMem_0_2__T_75_data}; // @[Memory.scala 66:50]
  assign _T_89 = {_T_88,_T_87}; // @[Memory.scala 66:50]
  assign _T_107 = {dataMem_1_1__T_95_data,dataMem_1_0__T_95_data}; // @[Memory.scala 66:50]
  assign _T_108 = {dataMem_1_3__T_95_data,dataMem_1_2__T_95_data}; // @[Memory.scala 66:50]
  assign _T_109 = {_T_108,_T_107}; // @[Memory.scala 66:50]
  assign _T_127 = {dataMem_2_1__T_115_data,dataMem_2_0__T_115_data}; // @[Memory.scala 66:50]
  assign _T_128 = {dataMem_2_3__T_115_data,dataMem_2_2__T_115_data}; // @[Memory.scala 66:50]
  assign _T_129 = {_T_128,_T_127}; // @[Memory.scala 66:50]
  assign _T_147 = {dataMem_3_1__T_135_data,dataMem_3_0__T_135_data}; // @[Memory.scala 66:50]
  assign _T_148 = {dataMem_3_3__T_135_data,dataMem_3_2__T_135_data}; // @[Memory.scala 66:50]
  assign _T_149 = {_T_148,_T_147}; // @[Memory.scala 66:50]
  assign _T_150 = {_T_109,_T_89}; // @[Cat.scala 30:58]
  assign _T_151 = {_T_149,_T_129}; // @[Cat.scala 30:58]
  assign rdata = {_T_151,_T_150}; // @[Cat.scala 30:58]
  assign _GEN_7 = ren_reg ? rdata : rdata_buf; // @[Reg.scala 12:19]
  assign _T_153 = _GEN_7[31:0]; // @[Memory.scala 70:54]
  assign _T_154 = _GEN_7[63:32]; // @[Memory.scala 70:54]
  assign _T_155 = _GEN_7[95:64]; // @[Memory.scala 70:54]
  assign _T_156 = _GEN_7[127:96]; // @[Memory.scala 70:54]
  assign _GEN_9 = 2'h1 == off_reg ? _T_154 : _T_153; // @[Memory.scala 70:21]
  assign _GEN_10 = 2'h2 == off_reg ? _T_155 : _GEN_9; // @[Memory.scala 70:21]
  assign _GEN_11 = 2'h3 == off_reg ? _T_156 : _GEN_10; // @[Memory.scala 70:21]
  assign _T_169 = cpu_mask != 4'h0; // @[Memory.scala 71:56]
  assign _T_171 = _T_169 == 1'h0; // @[Memory.scala 71:46]
  assign _T_172 = _T_67 | _T_171; // @[Memory.scala 71:43]
  assign _GEN_12 = io_resp_valid ? io_req_bits_addr : addr_reg; // @[Memory.scala 73:23]
  assign _GEN_13 = io_resp_valid ? io_req_bits_data : cpu_data; // @[Memory.scala 73:23]
  assign _GEN_14 = io_resp_valid ? io_req_bits_mask : cpu_mask; // @[Memory.scala 73:23]
  assign _T_174 = {off_reg,2'h0}; // @[Cat.scala 30:58]
  assign _GEN_183 = {{15'd0}, cpu_mask}; // @[Memory.scala 79:25]
  assign _T_175 = _GEN_183 << _T_174; // @[Memory.scala 79:25]
  assign wmask = {1'b0,$signed(_T_175)}; // @[Memory.scala 79:65]
  assign _T_176 = {cpu_data,cpu_data}; // @[Cat.scala 30:58]
  assign wdata = {_T_176,_T_176}; // @[Cat.scala 30:58]
  assign _T_177 = wdata[7:0]; // @[Memory.scala 83:49]
  assign _T_178 = wdata[15:8]; // @[Memory.scala 83:49]
  assign _T_179 = wdata[23:16]; // @[Memory.scala 83:49]
  assign _T_180 = wdata[31:24]; // @[Memory.scala 83:49]
  assign _T_190 = wmask[3:0]; // @[Memory.scala 84:37]
  assign _T_191 = _T_190[0]; // @[Memory.scala 84:64]
  assign _T_192 = _T_190[1]; // @[Memory.scala 84:64]
  assign _T_193 = _T_190[2]; // @[Memory.scala 84:64]
  assign _T_194 = _T_190[3]; // @[Memory.scala 84:64]
  assign _T_207 = wdata[39:32]; // @[Memory.scala 83:49]
  assign _T_208 = wdata[47:40]; // @[Memory.scala 83:49]
  assign _T_209 = wdata[55:48]; // @[Memory.scala 83:49]
  assign _T_210 = wdata[63:56]; // @[Memory.scala 83:49]
  assign _T_220 = wmask[7:4]; // @[Memory.scala 84:37]
  assign _T_221 = _T_220[0]; // @[Memory.scala 84:64]
  assign _T_222 = _T_220[1]; // @[Memory.scala 84:64]
  assign _T_223 = _T_220[2]; // @[Memory.scala 84:64]
  assign _T_224 = _T_220[3]; // @[Memory.scala 84:64]
  assign _T_237 = wdata[71:64]; // @[Memory.scala 83:49]
  assign _T_238 = wdata[79:72]; // @[Memory.scala 83:49]
  assign _T_239 = wdata[87:80]; // @[Memory.scala 83:49]
  assign _T_240 = wdata[95:88]; // @[Memory.scala 83:49]
  assign _T_250 = wmask[11:8]; // @[Memory.scala 84:37]
  assign _T_251 = _T_250[0]; // @[Memory.scala 84:64]
  assign _T_252 = _T_250[1]; // @[Memory.scala 84:64]
  assign _T_253 = _T_250[2]; // @[Memory.scala 84:64]
  assign _T_254 = _T_250[3]; // @[Memory.scala 84:64]
  assign _T_267 = wdata[103:96]; // @[Memory.scala 83:49]
  assign _T_268 = wdata[111:104]; // @[Memory.scala 83:49]
  assign _T_269 = wdata[119:112]; // @[Memory.scala 83:49]
  assign _T_270 = wdata[127:120]; // @[Memory.scala 83:49]
  assign _T_280 = wmask[15:12]; // @[Memory.scala 84:37]
  assign _T_281 = _T_280[0]; // @[Memory.scala 84:64]
  assign _T_282 = _T_280[1]; // @[Memory.scala 84:64]
  assign _T_283 = _T_280[2]; // @[Memory.scala 84:64]
  assign _T_284 = _T_280[3]; // @[Memory.scala 84:64]
  assign _GEN_51 = wen ? _T_191 : 1'h0; // @[Memory.scala 81:13]
  assign _GEN_53 = wen ? _T_192 : 1'h0; // @[Memory.scala 81:13]
  assign _GEN_55 = wen ? _T_193 : 1'h0; // @[Memory.scala 81:13]
  assign _GEN_57 = wen ? _T_194 : 1'h0; // @[Memory.scala 81:13]
  assign _GEN_59 = wen ? _T_221 : 1'h0; // @[Memory.scala 81:13]
  assign _GEN_61 = wen ? _T_222 : 1'h0; // @[Memory.scala 81:13]
  assign _GEN_63 = wen ? _T_223 : 1'h0; // @[Memory.scala 81:13]
  assign _GEN_65 = wen ? _T_224 : 1'h0; // @[Memory.scala 81:13]
  assign _GEN_67 = wen ? _T_251 : 1'h0; // @[Memory.scala 81:13]
  assign _GEN_69 = wen ? _T_252 : 1'h0; // @[Memory.scala 81:13]
  assign _GEN_71 = wen ? _T_253 : 1'h0; // @[Memory.scala 81:13]
  assign _GEN_73 = wen ? _T_254 : 1'h0; // @[Memory.scala 81:13]
  assign _GEN_75 = wen ? _T_281 : 1'h0; // @[Memory.scala 81:13]
  assign _GEN_77 = wen ? _T_282 : 1'h0; // @[Memory.scala 81:13]
  assign _GEN_79 = wen ? _T_283 : 1'h0; // @[Memory.scala 81:13]
  assign _GEN_81 = wen ? _T_284 : 1'h0; // @[Memory.scala 81:13]
  assign _T_297 = 2'h0 == state; // @[Conditional.scala 37:30]
  assign _T_299 = io_req_bits_mask != 4'h0; // @[Memory.scala 92:39]
  assign _T_300 = _T_299 ? 2'h2 : 2'h1; // @[Memory.scala 92:21]
  assign _GEN_82 = io_req_valid ? _T_300 : state; // @[Memory.scala 91:26]
  assign _T_301 = 2'h1 == state; // @[Conditional.scala 37:30]
  assign _GEN_83 = io_req_valid ? _T_300 : 2'h0; // @[Memory.scala 96:26]
  assign _T_305 = 2'h2 == state; // @[Conditional.scala 37:30]
  assign _T_308 = _T_169 ? 2'h2 : 2'h0; // @[Memory.scala 103:19]
  assign _GEN_84 = _T_305 ? _T_308 : state; // @[Conditional.scala 39:67]
  assign _GEN_85 = _T_301 ? _GEN_83 : _GEN_84; // @[Conditional.scala 39:67]
  assign _GEN_86 = _T_297 ? _GEN_82 : _GEN_85; // @[Conditional.scala 40:58]
  assign io_resp_valid = _T_172;
  assign io_resp_bits_data = _GEN_11;
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _RAND_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_0[initvar] = _RAND_0[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  dataMem_0_0__T_75_addr_pipe_0 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_1[initvar] = _RAND_2[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  dataMem_0_1__T_75_addr_pipe_0 = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_2[initvar] = _RAND_4[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  dataMem_0_2__T_75_addr_pipe_0 = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_3[initvar] = _RAND_6[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  dataMem_0_3__T_75_addr_pipe_0 = _RAND_7[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_0[initvar] = _RAND_8[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  dataMem_1_0__T_95_addr_pipe_0 = _RAND_9[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_1[initvar] = _RAND_10[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  dataMem_1_1__T_95_addr_pipe_0 = _RAND_11[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_2[initvar] = _RAND_12[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  dataMem_1_2__T_95_addr_pipe_0 = _RAND_13[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_3[initvar] = _RAND_14[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  dataMem_1_3__T_95_addr_pipe_0 = _RAND_15[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_0[initvar] = _RAND_16[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  dataMem_2_0__T_115_addr_pipe_0 = _RAND_17[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_1[initvar] = _RAND_18[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{$random}};
  dataMem_2_1__T_115_addr_pipe_0 = _RAND_19[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_2[initvar] = _RAND_20[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{$random}};
  dataMem_2_2__T_115_addr_pipe_0 = _RAND_21[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_22 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_3[initvar] = _RAND_22[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{$random}};
  dataMem_2_3__T_115_addr_pipe_0 = _RAND_23[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_24 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_0[initvar] = _RAND_24[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{$random}};
  dataMem_3_0__T_135_addr_pipe_0 = _RAND_25[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_26 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_1[initvar] = _RAND_26[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{$random}};
  dataMem_3_1__T_135_addr_pipe_0 = _RAND_27[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_28 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_2[initvar] = _RAND_28[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{$random}};
  dataMem_3_2__T_135_addr_pipe_0 = _RAND_29[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_30 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_3[initvar] = _RAND_30[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{$random}};
  dataMem_3_3__T_135_addr_pipe_0 = _RAND_31[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{$random}};
  state = _RAND_32[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{$random}};
  addr_reg = _RAND_33[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{$random}};
  cpu_data = _RAND_34[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{$random}};
  cpu_mask = _RAND_35[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{$random}};
  ren_reg = _RAND_36[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {4{$random}};
  rdata_buf = _RAND_37[127:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(dataMem_0_0__T_195_en & dataMem_0_0__T_195_mask) begin
      dataMem_0_0[dataMem_0_0__T_195_addr] <= dataMem_0_0__T_195_data; // @[Memory.scala 44:45]
    end
    if (_GEN_87) begin
      dataMem_0_0__T_75_addr_pipe_0 <= idx;
    end
    if(dataMem_0_1__T_195_en & dataMem_0_1__T_195_mask) begin
      dataMem_0_1[dataMem_0_1__T_195_addr] <= dataMem_0_1__T_195_data; // @[Memory.scala 44:45]
    end
    if (_GEN_87) begin
      dataMem_0_1__T_75_addr_pipe_0 <= idx;
    end
    if(dataMem_0_2__T_195_en & dataMem_0_2__T_195_mask) begin
      dataMem_0_2[dataMem_0_2__T_195_addr] <= dataMem_0_2__T_195_data; // @[Memory.scala 44:45]
    end
    if (_GEN_87) begin
      dataMem_0_2__T_75_addr_pipe_0 <= idx;
    end
    if(dataMem_0_3__T_195_en & dataMem_0_3__T_195_mask) begin
      dataMem_0_3[dataMem_0_3__T_195_addr] <= dataMem_0_3__T_195_data; // @[Memory.scala 44:45]
    end
    if (_GEN_87) begin
      dataMem_0_3__T_75_addr_pipe_0 <= idx;
    end
    if(dataMem_1_0__T_225_en & dataMem_1_0__T_225_mask) begin
      dataMem_1_0[dataMem_1_0__T_225_addr] <= dataMem_1_0__T_225_data; // @[Memory.scala 44:45]
    end
    if (_GEN_87) begin
      dataMem_1_0__T_95_addr_pipe_0 <= idx;
    end
    if(dataMem_1_1__T_225_en & dataMem_1_1__T_225_mask) begin
      dataMem_1_1[dataMem_1_1__T_225_addr] <= dataMem_1_1__T_225_data; // @[Memory.scala 44:45]
    end
    if (_GEN_87) begin
      dataMem_1_1__T_95_addr_pipe_0 <= idx;
    end
    if(dataMem_1_2__T_225_en & dataMem_1_2__T_225_mask) begin
      dataMem_1_2[dataMem_1_2__T_225_addr] <= dataMem_1_2__T_225_data; // @[Memory.scala 44:45]
    end
    if (_GEN_87) begin
      dataMem_1_2__T_95_addr_pipe_0 <= idx;
    end
    if(dataMem_1_3__T_225_en & dataMem_1_3__T_225_mask) begin
      dataMem_1_3[dataMem_1_3__T_225_addr] <= dataMem_1_3__T_225_data; // @[Memory.scala 44:45]
    end
    if (_GEN_87) begin
      dataMem_1_3__T_95_addr_pipe_0 <= idx;
    end
    if(dataMem_2_0__T_255_en & dataMem_2_0__T_255_mask) begin
      dataMem_2_0[dataMem_2_0__T_255_addr] <= dataMem_2_0__T_255_data; // @[Memory.scala 44:45]
    end
    if (_GEN_87) begin
      dataMem_2_0__T_115_addr_pipe_0 <= idx;
    end
    if(dataMem_2_1__T_255_en & dataMem_2_1__T_255_mask) begin
      dataMem_2_1[dataMem_2_1__T_255_addr] <= dataMem_2_1__T_255_data; // @[Memory.scala 44:45]
    end
    if (_GEN_87) begin
      dataMem_2_1__T_115_addr_pipe_0 <= idx;
    end
    if(dataMem_2_2__T_255_en & dataMem_2_2__T_255_mask) begin
      dataMem_2_2[dataMem_2_2__T_255_addr] <= dataMem_2_2__T_255_data; // @[Memory.scala 44:45]
    end
    if (_GEN_87) begin
      dataMem_2_2__T_115_addr_pipe_0 <= idx;
    end
    if(dataMem_2_3__T_255_en & dataMem_2_3__T_255_mask) begin
      dataMem_2_3[dataMem_2_3__T_255_addr] <= dataMem_2_3__T_255_data; // @[Memory.scala 44:45]
    end
    if (_GEN_87) begin
      dataMem_2_3__T_115_addr_pipe_0 <= idx;
    end
    if(dataMem_3_0__T_285_en & dataMem_3_0__T_285_mask) begin
      dataMem_3_0[dataMem_3_0__T_285_addr] <= dataMem_3_0__T_285_data; // @[Memory.scala 44:45]
    end
    if (_GEN_87) begin
      dataMem_3_0__T_135_addr_pipe_0 <= idx;
    end
    if(dataMem_3_1__T_285_en & dataMem_3_1__T_285_mask) begin
      dataMem_3_1[dataMem_3_1__T_285_addr] <= dataMem_3_1__T_285_data; // @[Memory.scala 44:45]
    end
    if (_GEN_87) begin
      dataMem_3_1__T_135_addr_pipe_0 <= idx;
    end
    if(dataMem_3_2__T_285_en & dataMem_3_2__T_285_mask) begin
      dataMem_3_2[dataMem_3_2__T_285_addr] <= dataMem_3_2__T_285_data; // @[Memory.scala 44:45]
    end
    if (_GEN_87) begin
      dataMem_3_2__T_135_addr_pipe_0 <= idx;
    end
    if(dataMem_3_3__T_285_en & dataMem_3_3__T_285_mask) begin
      dataMem_3_3[dataMem_3_3__T_285_addr] <= dataMem_3_3__T_285_data; // @[Memory.scala 44:45]
    end
    if (_GEN_87) begin
      dataMem_3_3__T_135_addr_pipe_0 <= idx;
    end
    if (reset) begin
      state <= 2'h0;
    end else begin
      if (_T_297) begin
        if (io_req_valid) begin
          if (_T_299) begin
            state <= 2'h2;
          end else begin
            state <= 2'h1;
          end
        end
      end else begin
        if (_T_301) begin
          if (io_req_valid) begin
            if (_T_299) begin
              state <= 2'h2;
            end else begin
              state <= 2'h1;
            end
          end else begin
            state <= 2'h0;
          end
        end else begin
          if (_T_305) begin
            if (_T_169) begin
              state <= 2'h2;
            end else begin
              state <= 2'h0;
            end
          end
        end
      end
    end
    if (io_resp_valid) begin
      addr_reg <= io_req_bits_addr;
    end
    if (io_resp_valid) begin
      cpu_data <= io_req_bits_data;
    end
    if (io_resp_valid) begin
      cpu_mask <= io_req_bits_mask;
    end
    ren_reg <= ren;
    if (ren_reg) begin
      rdata_buf <= rdata;
    end
  end
endmodule
module Tile(
  input         clock,
  input         reset,
  output        rvfi_valid,
  output [63:0] rvfi_order,
  output [31:0] rvfi_insn,
  output        rvfi_trap,
  output        rvfi_halt,
  output        rvfi_intr,
  output [1:0]  rvfi_mode,
  output [1:0]  rvfi_ixl,
  output [4:0]  rvfi_rs1_addr,
  output [4:0]  rvfi_rs2_addr,
  output [31:0] rvfi_rs1_rdata,
  output [31:0] rvfi_rs2_rdata,
  output [4:0]  rvfi_rd_addr,
  output [31:0] rvfi_rd_wdata,
  output [31:0] rvfi_pc_rdata,
  output [31:0] rvfi_pc_wdata,
  output [31:0] rvfi_mem_addr,
  output [3:0]  rvfi_mem_rmask,
  output [3:0]  rvfi_mem_wmask,
  output [31:0] rvfi_mem_rdata,
  output [31:0] rvfi_mem_wdata
);
  wire  core_clock; // @[Tile.scala 142:22]
  wire  core_reset; // @[Tile.scala 142:22]
  wire  core_rvfi_valid; // @[Tile.scala 142:22]
  wire [63:0] core_rvfi_order; // @[Tile.scala 142:22]
  wire [31:0] core_rvfi_insn; // @[Tile.scala 142:22]
  wire  core_rvfi_trap; // @[Tile.scala 142:22]
  wire  core_rvfi_halt; // @[Tile.scala 142:22]
  wire [4:0] core_rvfi_rs1_addr; // @[Tile.scala 142:22]
  wire [4:0] core_rvfi_rs2_addr; // @[Tile.scala 142:22]
  wire [31:0] core_rvfi_rs1_rdata; // @[Tile.scala 142:22]
  wire [31:0] core_rvfi_rs2_rdata; // @[Tile.scala 142:22]
  wire [4:0] core_rvfi_rd_addr; // @[Tile.scala 142:22]
  wire [31:0] core_rvfi_rd_wdata; // @[Tile.scala 142:22]
  wire [31:0] core_rvfi_pc_rdata; // @[Tile.scala 142:22]
  wire [31:0] core_rvfi_pc_wdata; // @[Tile.scala 142:22]
  wire [31:0] core_rvfi_mem_addr; // @[Tile.scala 142:22]
  wire [3:0] core_rvfi_mem_rmask; // @[Tile.scala 142:22]
  wire [3:0] core_rvfi_mem_wmask; // @[Tile.scala 142:22]
  wire [31:0] core_rvfi_mem_rdata; // @[Tile.scala 142:22]
  wire [31:0] core_rvfi_mem_wdata; // @[Tile.scala 142:22]
  wire  core_io_imemory_req_valid; // @[Tile.scala 142:22]
  wire [31:0] core_io_imemory_req_bits_addr; // @[Tile.scala 142:22]
  wire  core_io_imemory_resp_valid; // @[Tile.scala 142:22]
  wire [31:0] core_io_imemory_resp_bits_data; // @[Tile.scala 142:22]
  wire  core_io_dmemory_abort; // @[Tile.scala 142:22]
  wire  core_io_dmemory_req_valid; // @[Tile.scala 142:22]
  wire [31:0] core_io_dmemory_req_bits_addr; // @[Tile.scala 142:22]
  wire [31:0] core_io_dmemory_req_bits_data; // @[Tile.scala 142:22]
  wire [3:0] core_io_dmemory_req_bits_mask; // @[Tile.scala 142:22]
  wire  core_io_dmemory_resp_valid; // @[Tile.scala 142:22]
  wire [31:0] core_io_dmemory_resp_bits_data; // @[Tile.scala 142:22]
  wire  imemory_clock; // @[Tile.scala 145:23]
  wire  imemory_reset; // @[Tile.scala 145:23]
  wire  imemory_io_abort; // @[Tile.scala 145:23]
  wire  imemory_io_req_valid; // @[Tile.scala 145:23]
  wire [31:0] imemory_io_req_bits_addr; // @[Tile.scala 145:23]
  wire [31:0] imemory_io_req_bits_data; // @[Tile.scala 145:23]
  wire [3:0] imemory_io_req_bits_mask; // @[Tile.scala 145:23]
  wire  imemory_io_resp_valid; // @[Tile.scala 145:23]
  wire [31:0] imemory_io_resp_bits_data; // @[Tile.scala 145:23]
  wire  dmemory_clock; // @[Tile.scala 146:23]
  wire  dmemory_reset; // @[Tile.scala 146:23]
  wire  dmemory_io_abort; // @[Tile.scala 146:23]
  wire  dmemory_io_req_valid; // @[Tile.scala 146:23]
  wire [31:0] dmemory_io_req_bits_addr; // @[Tile.scala 146:23]
  wire [31:0] dmemory_io_req_bits_data; // @[Tile.scala 146:23]
  wire [3:0] dmemory_io_req_bits_mask; // @[Tile.scala 146:23]
  wire  dmemory_io_resp_valid; // @[Tile.scala 146:23]
  wire [31:0] dmemory_io_resp_bits_data; // @[Tile.scala 146:23]
  Core core ( // @[Tile.scala 142:22]
    .clock(core_clock),
    .reset(core_reset),
    .rvfi_valid(core_rvfi_valid),
    .rvfi_order(core_rvfi_order),
    .rvfi_insn(core_rvfi_insn),
    .rvfi_trap(core_rvfi_trap),
    .rvfi_halt(core_rvfi_halt),
    .rvfi_rs1_addr(core_rvfi_rs1_addr),
    .rvfi_rs2_addr(core_rvfi_rs2_addr),
    .rvfi_rs1_rdata(core_rvfi_rs1_rdata),
    .rvfi_rs2_rdata(core_rvfi_rs2_rdata),
    .rvfi_rd_addr(core_rvfi_rd_addr),
    .rvfi_rd_wdata(core_rvfi_rd_wdata),
    .rvfi_pc_rdata(core_rvfi_pc_rdata),
    .rvfi_pc_wdata(core_rvfi_pc_wdata),
    .rvfi_mem_addr(core_rvfi_mem_addr),
    .rvfi_mem_rmask(core_rvfi_mem_rmask),
    .rvfi_mem_wmask(core_rvfi_mem_wmask),
    .rvfi_mem_rdata(core_rvfi_mem_rdata),
    .rvfi_mem_wdata(core_rvfi_mem_wdata),
    .io_imemory_req_valid(core_io_imemory_req_valid),
    .io_imemory_req_bits_addr(core_io_imemory_req_bits_addr),
    .io_imemory_resp_valid(core_io_imemory_resp_valid),
    .io_imemory_resp_bits_data(core_io_imemory_resp_bits_data),
    .io_dmemory_abort(core_io_dmemory_abort),
    .io_dmemory_req_valid(core_io_dmemory_req_valid),
    .io_dmemory_req_bits_addr(core_io_dmemory_req_bits_addr),
    .io_dmemory_req_bits_data(core_io_dmemory_req_bits_data),
    .io_dmemory_req_bits_mask(core_io_dmemory_req_bits_mask),
    .io_dmemory_resp_valid(core_io_dmemory_resp_valid),
    .io_dmemory_resp_bits_data(core_io_dmemory_resp_bits_data)
  );
  Memory imemory ( // @[Tile.scala 145:23]
    .clock(imemory_clock),
    .reset(imemory_reset),
    .io_abort(imemory_io_abort),
    .io_req_valid(imemory_io_req_valid),
    .io_req_bits_addr(imemory_io_req_bits_addr),
    .io_req_bits_data(imemory_io_req_bits_data),
    .io_req_bits_mask(imemory_io_req_bits_mask),
    .io_resp_valid(imemory_io_resp_valid),
    .io_resp_bits_data(imemory_io_resp_bits_data)
  );
  Memory dmemory ( // @[Tile.scala 146:23]
    .clock(dmemory_clock),
    .reset(dmemory_reset),
    .io_abort(dmemory_io_abort),
    .io_req_valid(dmemory_io_req_valid),
    .io_req_bits_addr(dmemory_io_req_bits_addr),
    .io_req_bits_data(dmemory_io_req_bits_data),
    .io_req_bits_mask(dmemory_io_req_bits_mask),
    .io_resp_valid(dmemory_io_resp_valid),
    .io_resp_bits_data(dmemory_io_resp_bits_data)
  );
  assign rvfi_valid = core_rvfi_valid;
  assign rvfi_order = core_rvfi_order;
  assign rvfi_insn = core_rvfi_insn;
  assign rvfi_trap = core_rvfi_trap;
  assign rvfi_halt = core_rvfi_halt;
  assign rvfi_intr = 1'h0;
  assign rvfi_mode = 2'h3;
  assign rvfi_ixl = 2'h1;
  assign rvfi_rs1_addr = core_rvfi_rs1_addr;
  assign rvfi_rs2_addr = core_rvfi_rs2_addr;
  assign rvfi_rs1_rdata = core_rvfi_rs1_rdata;
  assign rvfi_rs2_rdata = core_rvfi_rs2_rdata;
  assign rvfi_rd_addr = core_rvfi_rd_addr;
  assign rvfi_rd_wdata = core_rvfi_rd_wdata;
  assign rvfi_pc_rdata = core_rvfi_pc_rdata;
  assign rvfi_pc_wdata = core_rvfi_pc_wdata;
  assign rvfi_mem_addr = core_rvfi_mem_addr;
  assign rvfi_mem_rmask = core_rvfi_mem_rmask;
  assign rvfi_mem_wmask = core_rvfi_mem_wmask;
  assign rvfi_mem_rdata = core_rvfi_mem_rdata;
  assign rvfi_mem_wdata = core_rvfi_mem_wdata;
  assign core_clock = clock;
  assign core_reset = reset;
  assign core_io_imemory_resp_valid = imemory_io_resp_valid;
  assign core_io_imemory_resp_bits_data = imemory_io_resp_bits_data;
  assign core_io_dmemory_resp_valid = dmemory_io_resp_valid;
  assign core_io_dmemory_resp_bits_data = dmemory_io_resp_bits_data;
  assign imemory_clock = clock;
  assign imemory_reset = reset;
  assign imemory_io_abort = 1'h0;
  assign imemory_io_req_valid = core_io_imemory_req_valid;
  assign imemory_io_req_bits_addr = core_io_imemory_req_bits_addr;
  assign imemory_io_req_bits_data = 32'h0;
  assign imemory_io_req_bits_mask = 4'h0;
  assign dmemory_clock = clock;
  assign dmemory_reset = reset;
  assign dmemory_io_abort = core_io_dmemory_abort;
  assign dmemory_io_req_valid = core_io_dmemory_req_valid;
  assign dmemory_io_req_bits_addr = core_io_dmemory_req_bits_addr;
  assign dmemory_io_req_bits_data = core_io_dmemory_req_bits_data;
  assign dmemory_io_req_bits_mask = core_io_dmemory_req_bits_mask;
endmodule
