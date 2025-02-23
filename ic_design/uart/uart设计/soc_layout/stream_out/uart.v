
module baud_rate_DW01_cmp2_16_1 ( A, B, LT_LE );
  input [15:0] A;
  input [15:0] B;
  output LT_LE;
  wire   n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56;

  NR3D0 U6 ( .A1(n24), .A2(n25), .A3(n26), .ZN(n18) );
  NR2D0 U7 ( .A1(B[12]), .A2(n28), .ZN(n25) );
  NR2D0 U8 ( .A1(B[11]), .A2(n27), .ZN(n26) );
  AOI222D0 U9 ( .A1(n29), .A2(n30), .B1(B[10]), .B2(n31), .C1(B[11]), .C2(n27), 
        .ZN(n24) );
  OAI211D0 U10 ( .A1(A[1]), .A2(n50), .B(A[0]), .C(n51), .ZN(n48) );
  INV0 U11 ( .I(B[0]), .ZN(n51) );
  OAI21D0 U12 ( .A1(n41), .A2(n42), .B(n43), .ZN(n39) );
  OAI22D0 U13 ( .A1(B[3]), .A2(n46), .B1(B[4]), .B2(n44), .ZN(n42) );
  AOI22D0 U14 ( .A1(B[4]), .A2(n44), .B1(B[5]), .B2(n45), .ZN(n43) );
  AOI222D0 U15 ( .A1(n47), .A2(n48), .B1(B[2]), .B2(n49), .C1(B[3]), .C2(n46), 
        .ZN(n41) );
  OAI21D0 U16 ( .A1(n32), .A2(n33), .B(n34), .ZN(n30) );
  OAI22D0 U17 ( .A1(B[7]), .A2(n37), .B1(B[8]), .B2(n35), .ZN(n33) );
  AOI22D0 U18 ( .A1(B[8]), .A2(n35), .B1(B[9]), .B2(n36), .ZN(n34) );
  AOI222D0 U19 ( .A1(n38), .A2(n39), .B1(B[6]), .B2(n40), .C1(B[7]), .C2(n37), 
        .ZN(n32) );
  AOI22D0 U20 ( .A1(A[2]), .A2(n52), .B1(A[1]), .B2(n50), .ZN(n47) );
  INV0 U21 ( .I(B[2]), .ZN(n52) );
  AOI22D0 U22 ( .A1(A[6]), .A2(n53), .B1(A[5]), .B2(n54), .ZN(n38) );
  INV0 U23 ( .I(B[6]), .ZN(n53) );
  INV0 U24 ( .I(B[5]), .ZN(n54) );
  AOI22D0 U25 ( .A1(A[9]), .A2(n55), .B1(A[10]), .B2(n56), .ZN(n29) );
  INV0 U26 ( .I(B[9]), .ZN(n55) );
  INV0 U27 ( .I(B[10]), .ZN(n56) );
  INV0 U28 ( .I(A[3]), .ZN(n46) );
  INV0 U29 ( .I(A[7]), .ZN(n37) );
  INV0 U30 ( .I(A[4]), .ZN(n44) );
  INV0 U31 ( .I(A[8]), .ZN(n35) );
  INV0 U32 ( .I(B[1]), .ZN(n50) );
  AOI21D0 U33 ( .A1(n15), .A2(n16), .B(A[15]), .ZN(LT_LE) );
  ND2D0 U34 ( .A1(B[14]), .A2(n17), .ZN(n16) );
  OAI21D0 U35 ( .A1(n18), .A2(n19), .B(n20), .ZN(n15) );
  INV0 U36 ( .I(A[14]), .ZN(n17) );
  INV0 U37 ( .I(A[11]), .ZN(n27) );
  INV0 U38 ( .I(A[5]), .ZN(n45) );
  INV0 U39 ( .I(A[9]), .ZN(n36) );
  INV0 U40 ( .I(A[10]), .ZN(n31) );
  INV0 U41 ( .I(A[2]), .ZN(n49) );
  INV0 U42 ( .I(A[6]), .ZN(n40) );
  INV0 U43 ( .I(A[12]), .ZN(n28) );
  OAI22D0 U44 ( .A1(A[13]), .A2(n22), .B1(A[12]), .B2(n23), .ZN(n19) );
  INV0 U45 ( .I(B[12]), .ZN(n23) );
  AOI22D0 U46 ( .A1(A[14]), .A2(n21), .B1(A[13]), .B2(n22), .ZN(n20) );
  INV0 U47 ( .I(B[14]), .ZN(n21) );
  INV0 U48 ( .I(B[13]), .ZN(n22) );
endmodule


module baud_rate_DW01_inc_16_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;
  wire   \carry[15] , \carry[14] , \carry[13] , \carry[12] , \carry[11] ,
         \carry[10] , \carry[9] , \carry[8] , \carry[7] , \carry[6] ,
         \carry[5] , \carry[4] , \carry[3] , \carry[2] ;

  INV0 U5 ( .I(A[0]), .ZN(SUM[0]) );
  HA1D1 U1_1_2 ( .A(A[2]), .B(\carry[2] ), .CO(\carry[3] ), .S(SUM[2]) );
  HA1D1 U1_1_3 ( .A(A[3]), .B(\carry[3] ), .CO(\carry[4] ), .S(SUM[3]) );
  HA1D1 U1_1_4 ( .A(A[4]), .B(\carry[4] ), .CO(\carry[5] ), .S(SUM[4]) );
  HA1D1 U1_1_5 ( .A(A[5]), .B(\carry[5] ), .CO(\carry[6] ), .S(SUM[5]) );
  HA1D1 U1_1_6 ( .A(A[6]), .B(\carry[6] ), .CO(\carry[7] ), .S(SUM[6]) );
  HA1D1 U1_1_7 ( .A(A[7]), .B(\carry[7] ), .CO(\carry[8] ), .S(SUM[7]) );
  HA1D1 U1_1_8 ( .A(A[8]), .B(\carry[8] ), .CO(\carry[9] ), .S(SUM[8]) );
  HA1D1 U1_1_9 ( .A(A[9]), .B(\carry[9] ), .CO(\carry[10] ), .S(SUM[9]) );
  HA1D1 U1_1_10 ( .A(A[10]), .B(\carry[10] ), .CO(\carry[11] ), .S(SUM[10]) );
  HA1D1 U1_1_11 ( .A(A[11]), .B(\carry[11] ), .CO(\carry[12] ), .S(SUM[11]) );
  HA1D1 U1_1_12 ( .A(A[12]), .B(\carry[12] ), .CO(\carry[13] ), .S(SUM[12]) );
  HA1D1 U1_1_13 ( .A(A[13]), .B(\carry[13] ), .CO(\carry[14] ), .S(SUM[13]) );
  HA1D1 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(\carry[2] ), .S(SUM[1]) );
  HA1D1 U1_1_14 ( .A(A[14]), .B(\carry[14] ), .CO(\carry[15] ), .S(SUM[14]) );
  XOR2D1 U6 ( .A1(\carry[15] ), .A2(A[15]), .Z(SUM[15]) );
endmodule


module baud_rate_DW01_cmp2_16_0 ( A, B, LT_LE );
  input [15:0] A;
  input [15:0] B;
  output LT_LE;
  wire   n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59;

  AOI222D0 U6 ( .A1(n39), .A2(n40), .B1(B[6]), .B2(n41), .C1(B[7]), .C2(n38), 
        .ZN(n33) );
  INV0 U7 ( .I(A[6]), .ZN(n41) );
  AOI22D0 U8 ( .A1(A[6]), .A2(n55), .B1(A[5]), .B2(n56), .ZN(n39) );
  OAI211D0 U9 ( .A1(n42), .A2(n43), .B(n44), .C(n45), .ZN(n40) );
  AOI222D0 U10 ( .A1(n30), .A2(n31), .B1(B[10]), .B2(n32), .C1(B[11]), .C2(n29), .ZN(n24) );
  INV0 U11 ( .I(A[10]), .ZN(n32) );
  AOI22D0 U12 ( .A1(A[9]), .A2(n57), .B1(A[10]), .B2(n58), .ZN(n30) );
  OAI21D0 U13 ( .A1(n33), .A2(n34), .B(n35), .ZN(n31) );
  AOI222D0 U14 ( .A1(n49), .A2(n50), .B1(B[2]), .B2(n51), .C1(B[3]), .C2(n48), 
        .ZN(n42) );
  INV0 U15 ( .I(A[2]), .ZN(n51) );
  OAI22D0 U16 ( .A1(A[1]), .A2(n52), .B1(A[0]), .B2(n53), .ZN(n50) );
  AOI22D0 U17 ( .A1(A[2]), .A2(n54), .B1(A[1]), .B2(n52), .ZN(n49) );
  ND2D0 U18 ( .A1(B[5]), .A2(n47), .ZN(n44) );
  INV0 U19 ( .I(A[5]), .ZN(n47) );
  ND2D0 U20 ( .A1(B[4]), .A2(n46), .ZN(n45) );
  OAI22D0 U21 ( .A1(B[7]), .A2(n38), .B1(B[8]), .B2(n36), .ZN(n34) );
  OAI22D0 U22 ( .A1(B[3]), .A2(n48), .B1(B[4]), .B2(n46), .ZN(n43) );
  AOI21D0 U23 ( .A1(n20), .A2(n21), .B(n22), .ZN(n17) );
  AOI22D0 U24 ( .A1(A[14]), .A2(n23), .B1(A[13]), .B2(n59), .ZN(n20) );
  NR2D0 U25 ( .A1(A[14]), .A2(n23), .ZN(n22) );
  OAI21D0 U26 ( .A1(n24), .A2(n25), .B(n26), .ZN(n21) );
  OAI21D0 U27 ( .A1(n16), .A2(n17), .B(n18), .ZN(LT_LE) );
  ND2D0 U28 ( .A1(B[15]), .A2(n19), .ZN(n18) );
  INV0 U29 ( .I(B[1]), .ZN(n52) );
  INV0 U30 ( .I(B[2]), .ZN(n54) );
  INV0 U31 ( .I(B[6]), .ZN(n55) );
  INV0 U32 ( .I(B[5]), .ZN(n56) );
  INV0 U33 ( .I(B[0]), .ZN(n53) );
  NR2D0 U34 ( .A1(B[15]), .A2(n19), .ZN(n16) );
  OAI22D0 U35 ( .A1(B[11]), .A2(n29), .B1(B[12]), .B2(n27), .ZN(n25) );
  AOI22D0 U36 ( .A1(B[12]), .A2(n27), .B1(B[13]), .B2(n28), .ZN(n26) );
  INV0 U37 ( .I(A[13]), .ZN(n28) );
  AOI22D0 U38 ( .A1(B[8]), .A2(n36), .B1(B[9]), .B2(n37), .ZN(n35) );
  INV0 U39 ( .I(A[9]), .ZN(n37) );
  INV0 U40 ( .I(B[14]), .ZN(n23) );
  INV0 U41 ( .I(B[9]), .ZN(n57) );
  INV0 U42 ( .I(B[10]), .ZN(n58) );
  INV0 U43 ( .I(B[13]), .ZN(n59) );
  INV0 U44 ( .I(A[12]), .ZN(n27) );
  INV0 U45 ( .I(A[3]), .ZN(n48) );
  INV0 U46 ( .I(A[7]), .ZN(n38) );
  INV0 U47 ( .I(A[11]), .ZN(n29) );
  INV0 U48 ( .I(A[8]), .ZN(n36) );
  INV0 U49 ( .I(A[4]), .ZN(n46) );
  INV0 U50 ( .I(A[15]), .ZN(n19) );
endmodule


module baud_rate ( CLK, DIVISOR, RST_N, BAUDOUT_CLK );
  input [15:0] DIVISOR;
  input CLK, RST_N;
  output BAUDOUT_CLK;
  wire   \divisor_copy[15] , \divisor_copy[14] , \divisor_copy[13] ,
         \divisor_copy[12] , \divisor_copy[11] , \divisor_copy[10] ,
         \divisor_copy[9] , \divisor_copy[8] , \divisor_copy[7] ,
         \divisor_copy[6] , \divisor_copy[5] , \divisor_copy[4] ,
         \divisor_copy[3] , \divisor_copy[2] , \divisor_copy[1] , N3, N5, N6,
         N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34,
         N35, N36, N37, n80, n90, n100, n110, n120;
  wire   [15:0] counter;

  DFCN2Q out_clk_reg ( .CDN(n120), .CP(CLK), .D(N21), .Q(BAUDOUT_CLK) );
  AN2D1 U3 ( .A1(n80), .A2(N26), .Z(N9) );
  AN2D1 U4 ( .A1(N25), .A2(N3), .Z(N8) );
  AN2D1 U8 ( .A1(N24), .A2(n80), .Z(N7) );
  AN2D1 U9 ( .A1(N23), .A2(N3), .Z(N6) );
  AN2D1 U10 ( .A1(N22), .A2(n80), .Z(N5) );
  AN2D1 U11 ( .A1(N37), .A2(N3), .Z(N20) );
  AN2D1 U12 ( .A1(N36), .A2(N3), .Z(N19) );
  AN2D1 U13 ( .A1(N35), .A2(N3), .Z(N18) );
  AN2D1 U14 ( .A1(N34), .A2(n80), .Z(N17) );
  AN2D1 U15 ( .A1(N33), .A2(n80), .Z(N16) );
  AN2D1 U16 ( .A1(N32), .A2(n80), .Z(N15) );
  AN2D1 U17 ( .A1(N31), .A2(n80), .Z(N14) );
  AN2D1 U18 ( .A1(N30), .A2(N3), .Z(N13) );
  AN2D1 U19 ( .A1(N29), .A2(N3), .Z(N12) );
  AN2D1 U20 ( .A1(N28), .A2(N3), .Z(N11) );
  AN2D1 U21 ( .A1(N27), .A2(N3), .Z(N10) );
  BUF1 U22 ( .I(N3), .Z(n80) );
  BUF1 U23 ( .I(RST_N), .Z(n90) );
  BUF1 U24 ( .I(RST_N), .Z(n100) );
  BUF1 U25 ( .I(RST_N), .Z(n110) );
  BUF1 U26 ( .I(RST_N), .Z(n120) );
  DFCN1Q \counter_reg[1]  ( .CDN(n110), .CP(CLK), .D(N6), .Q(counter[1]) );
  DFCN1Q \counter_reg[2]  ( .CDN(n110), .CP(CLK), .D(N7), .Q(counter[2]) );
  DFCN1Q \counter_reg[0]  ( .CDN(n120), .CP(CLK), .D(N5), .Q(counter[0]) );
  DFCN1Q \counter_reg[4]  ( .CDN(n110), .CP(CLK), .D(N9), .Q(counter[4]) );
  DFCN1Q \counter_reg[3]  ( .CDN(n110), .CP(CLK), .D(N8), .Q(counter[3]) );
  DFCN1Q \counter_reg[5]  ( .CDN(n110), .CP(CLK), .D(N10), .Q(counter[5]) );
  DFCN1Q \counter_reg[9]  ( .CDN(n110), .CP(CLK), .D(N14), .Q(counter[9]) );
  DFCN1Q \counter_reg[6]  ( .CDN(n110), .CP(CLK), .D(N11), .Q(counter[6]) );
  DFCN1Q \counter_reg[8]  ( .CDN(n110), .CP(CLK), .D(N13), .Q(counter[8]) );
  DFCN1Q \counter_reg[7]  ( .CDN(n110), .CP(CLK), .D(N12), .Q(counter[7]) );
  DFCN1Q \counter_reg[13]  ( .CDN(n100), .CP(CLK), .D(N18), .Q(counter[13]) );
  DFCN1Q \counter_reg[10]  ( .CDN(n110), .CP(CLK), .D(N15), .Q(counter[10]) );
  DFCN1Q \counter_reg[14]  ( .CDN(n100), .CP(CLK), .D(N19), .Q(counter[14]) );
  DFCN1Q \counter_reg[12]  ( .CDN(n100), .CP(CLK), .D(N17), .Q(counter[12]) );
  DFCN1Q \counter_reg[15]  ( .CDN(n100), .CP(CLK), .D(N20), .Q(counter[15]) );
  DFCN1Q \counter_reg[11]  ( .CDN(n100), .CP(CLK), .D(N16), .Q(counter[11]) );
  DFCN1Q \divisor_copy_reg[9]  ( .CDN(n90), .CP(CLK), .D(DIVISOR[9]), .Q(
        \divisor_copy[9] ) );
  DFCN1Q \divisor_copy_reg[8]  ( .CDN(n90), .CP(CLK), .D(DIVISOR[8]), .Q(
        \divisor_copy[8] ) );
  DFCN1Q \divisor_copy_reg[5]  ( .CDN(n100), .CP(CLK), .D(DIVISOR[5]), .Q(
        \divisor_copy[5] ) );
  DFCN1Q \divisor_copy_reg[4]  ( .CDN(n100), .CP(CLK), .D(DIVISOR[4]), .Q(
        \divisor_copy[4] ) );
  DFCN1Q \divisor_copy_reg[10]  ( .CDN(n90), .CP(CLK), .D(DIVISOR[10]), .Q(
        \divisor_copy[10] ) );
  DFCN1Q \divisor_copy_reg[6]  ( .CDN(n90), .CP(CLK), .D(DIVISOR[6]), .Q(
        \divisor_copy[6] ) );
  DFCN1Q \divisor_copy_reg[11]  ( .CDN(n90), .CP(CLK), .D(DIVISOR[11]), .Q(
        \divisor_copy[11] ) );
  DFCN1Q \divisor_copy_reg[7]  ( .CDN(n90), .CP(CLK), .D(DIVISOR[7]), .Q(
        \divisor_copy[7] ) );
  DFCN1Q \divisor_copy_reg[3]  ( .CDN(n100), .CP(CLK), .D(DIVISOR[3]), .Q(
        \divisor_copy[3] ) );
  DFCN1Q \divisor_copy_reg[2]  ( .CDN(n100), .CP(CLK), .D(DIVISOR[2]), .Q(
        \divisor_copy[2] ) );
  DFCN1Q \divisor_copy_reg[1]  ( .CDN(n100), .CP(CLK), .D(DIVISOR[1]), .Q(
        \divisor_copy[1] ) );
  DFCN1Q \divisor_copy_reg[12]  ( .CDN(n90), .CP(CLK), .D(DIVISOR[12]), .Q(
        \divisor_copy[12] ) );
  DFCN1Q \divisor_copy_reg[13]  ( .CDN(n90), .CP(CLK), .D(DIVISOR[13]), .Q(
        \divisor_copy[13] ) );
  DFCN1Q \divisor_copy_reg[15]  ( .CDN(n90), .CP(CLK), .D(DIVISOR[15]), .Q(
        \divisor_copy[15] ) );
  DFCN1Q \divisor_copy_reg[14]  ( .CDN(n90), .CP(CLK), .D(DIVISOR[14]), .Q(
        \divisor_copy[14] ) );
  baud_rate_DW01_cmp2_16_1 lte_54 ( .A(counter), .B({1'b0, \divisor_copy[15] , 
        \divisor_copy[14] , \divisor_copy[13] , \divisor_copy[12] , 
        \divisor_copy[11] , \divisor_copy[10] , \divisor_copy[9] , 
        \divisor_copy[8] , \divisor_copy[7] , \divisor_copy[6] , 
        \divisor_copy[5] , \divisor_copy[4] , \divisor_copy[3] , 
        \divisor_copy[2] , \divisor_copy[1] }), .LT_LE(N21) );
  baud_rate_DW01_inc_16_0 add_42 ( .A(counter), .SUM({N37, N36, N35, N34, N33, 
        N32, N31, N30, N29, N28, N27, N26, N25, N24, N23, N22}) );
  baud_rate_DW01_cmp2_16_0 lt_41 ( .A(counter), .B(DIVISOR), .LT_LE(N3) );
endmodule


module txblock ( clk16, paral_data, serial_data, tx_en, tx_end, rst_n, clk_tx
 );
  input [7:0] paral_data;
  input clk16, tx_en, rst_n;
  output serial_data, tx_end, clk_tx;
  wire   \clk_counter[2] , \clk_counter[1] , \clk_counter[0] ,
         \para_data_copy1[8] , N4, \para_data_copy[9] , te_flag, N5, rst_flag,
         N10, N11, N12, N13, N16, N17, N18, n40, n7, n9, n15, n160, n170, n180,
         n20, n21, n22, n23, n24, n25, n26, n28, n29, n30, n31, n32, n33, n34,
         n35, n36;
  wire   [3:0] tx_counter;

  INV2 U18 ( .I(n25), .ZN(tx_end) );
  AN4D1 U23 ( .A1(n21), .A2(n22), .A3(n23), .A4(n24), .Z(n9) );
  DFCN1 rst_flag_reg ( .CDN(n28), .CP(tx_en), .D(n26), .Q(rst_flag), .QN(n31)
         );
  DFCN2Q \clk_counter_reg[3]  ( .CDN(n28), .CP(clk16), .D(N13), .Q(clk_tx) );
  ND2D0 U30 ( .A1(N17), .A2(n40), .ZN(n170) );
  NR2D0 U31 ( .A1(n35), .A2(n34), .ZN(n36) );
  BUF1 U32 ( .I(rst_n), .Z(n28) );
  BUF1 U33 ( .I(clk_tx), .Z(n29) );
  IND2D2 U34 ( .A1(\para_data_copy[9] ), .B1(tx_end), .ZN(serial_data) );
  DFCN1Q \para_data_copy1_reg[8]  ( .CDN(n28), .CP(tx_en), .D(paral_data[7]), 
        .Q(\para_data_copy1[8] ) );
  XOR2D1 U35 ( .A1(n32), .A2(n23), .Z(N17) );
  XOR2D1 U36 ( .A1(n35), .A2(n34), .Z(N12) );
  ND2D0 U37 ( .A1(tx_counter[1]), .A2(tx_counter[0]), .ZN(n32) );
  IND2D1 U38 ( .A1(tx_counter[0]), .B1(n40), .ZN(n15) );
  ND2D0 U39 ( .A1(N16), .A2(n40), .ZN(n160) );
  ND2D0 U40 ( .A1(N18), .A2(n40), .ZN(n180) );
  NR2D0 U41 ( .A1(n32), .A2(n23), .ZN(n33) );
  INV0 U42 ( .I(n20), .ZN(n40) );
  OAI21D0 U43 ( .A1(tx_counter[2]), .A2(tx_counter[1]), .B(tx_counter[3]), 
        .ZN(N5) );
  ND2D0 U44 ( .A1(\clk_counter[1] ), .A2(\clk_counter[0] ), .ZN(n35) );
  XOR2D1 U45 ( .A1(n36), .A2(clk_tx), .Z(N13) );
  INV0 U46 ( .I(\clk_counter[2] ), .ZN(n34) );
  INV0 U47 ( .I(\clk_counter[0] ), .ZN(N10) );
  ND2D0 U48 ( .A1(te_flag), .A2(rst_flag), .ZN(n20) );
  NR2D0 U49 ( .A1(n31), .A2(te_flag), .ZN(n30) );
  NR2D0 U50 ( .A1(n9), .A2(n7), .ZN(N4) );
  INV0 U51 ( .I(n22), .ZN(tx_counter[1]) );
  INV0 U52 ( .I(n23), .ZN(tx_counter[2]) );
  INV0 U53 ( .I(n24), .ZN(tx_counter[3]) );
  INV0 U54 ( .I(n21), .ZN(tx_counter[0]) );
  ND2D0 U55 ( .A1(n7), .A2(n31), .ZN(n26) );
  INV0 U56 ( .I(tx_en), .ZN(n7) );
  DFCN1Q \clk_counter_reg[0]  ( .CDN(rst_n), .CP(clk16), .D(N10), .Q(
        \clk_counter[0] ) );
  DFCN1Q \clk_counter_reg[1]  ( .CDN(rst_n), .CP(clk16), .D(N11), .Q(
        \clk_counter[1] ) );
  DFCN1Q \clk_counter_reg[2]  ( .CDN(rst_n), .CP(clk16), .D(N12), .Q(
        \clk_counter[2] ) );
  DFF1Q te_flag_reg ( .CP(tx_en), .D(N5), .Q(te_flag) );
  DFCSN1N \tx_counter_reg[3]  ( .CDN(n30), .CP(clk_tx), .D(1'b1), .QN(n24), 
        .SDN(n180) );
  DFCSN1N \tx_counter_reg[0]  ( .CDN(n30), .CP(n29), .D(1'b1), .QN(n21), .SDN(
        n15) );
  DFCSN1N \tx_counter_reg[2]  ( .CDN(n30), .CP(clk_tx), .D(1'b1), .QN(n23), 
        .SDN(n170) );
  DFCSN1N \tx_counter_reg[1]  ( .CDN(n30), .CP(n29), .D(1'b1), .QN(n22), .SDN(
        n160) );
  DFCSN1N tx_end_flag_reg ( .CDN(rst_flag), .CP(n29), .D(1'b0), .QN(n25), 
        .SDN(n20) );
  DFCNS1Q \para_data_copy_reg[9]  ( .CDN(1'b1), .CP(n29), .D(
        \para_data_copy1[8] ), .Q(\para_data_copy[9] ), .S(N4) );
  XOR2D1 U57 ( .A1(tx_counter[1]), .A2(tx_counter[0]), .Z(N16) );
  XNR2D1 U58 ( .A1(n33), .A2(n24), .ZN(N18) );
  XOR2D1 U59 ( .A1(\clk_counter[1] ), .A2(\clk_counter[0] ), .Z(N11) );
endmodule


module rxblock_DW01_inc_8_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;
  wire   \carry[7] , \carry[6] , \carry[5] , \carry[4] , \carry[3] ,
         \carry[2] ;

  HA1D1 U1_1_2 ( .A(A[2]), .B(\carry[2] ), .CO(\carry[3] ), .S(SUM[2]) );
  HA1D1 U1_1_3 ( .A(A[3]), .B(\carry[3] ), .CO(\carry[4] ), .S(SUM[3]) );
  HA1D1 U1_1_4 ( .A(A[4]), .B(\carry[4] ), .CO(\carry[5] ), .S(SUM[4]) );
  HA1D1 U1_1_5 ( .A(A[5]), .B(\carry[5] ), .CO(\carry[6] ), .S(SUM[5]) );
  HA1D1 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(\carry[2] ), .S(SUM[1]) );
  HA1D1 U1_1_6 ( .A(A[6]), .B(\carry[6] ), .CO(\carry[7] ), .S(SUM[6]) );
  INV0 U5 ( .I(A[0]), .ZN(SUM[0]) );
  XOR2D1 U6 ( .A1(\carry[7] ), .A2(A[7]), .Z(SUM[7]) );
endmodule


module rxblock ( clk16, serial_data_in, rst_n, para_data_out, receive_flag );
  output [7:0] para_data_out;
  input clk16, serial_data_in, rst_n;
  output receive_flag;
  wire   N10, \output_regs[8] , \output_regs[7] , \output_regs[6] ,
         \output_regs[5] , \output_regs[4] , \output_regs[3] ,
         \output_regs[2] , \output_regs[1] , N51, N55, N59, N63, N67, N71, N75,
         N79, N88, N89, N90, N91, N92, N93, N94, N95, n9, n100, n13, n14, n15,
         n16, n17, n18, n20, n22, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n510;
  wire   [7:0] clk_sample_counter;

  AN3D1 U15 ( .A1(n29), .A2(n43), .A3(n44), .Z(N79) );
  IND3D1 U18 ( .A1(clk_sample_counter[6]), .B1(n28), .B2(n44), .ZN(n13) );
  AN3D1 U19 ( .A1(n14), .A2(n15), .A3(n16), .Z(N67) );
  AN3D1 U20 ( .A1(clk_sample_counter[4]), .A2(n15), .A3(n16), .Z(N63) );
  AN3D1 U21 ( .A1(clk_sample_counter[5]), .A2(n14), .A3(n16), .Z(N59) );
  AN3D1 U22 ( .A1(clk_sample_counter[5]), .A2(n29), .A3(n16), .Z(N55) );
  IND2D1 U24 ( .A1(n18), .B1(n44), .ZN(n17) );
  AN4D1 U28 ( .A1(n22), .A2(n26), .A3(n43), .A4(n14), .Z(N51) );
  INV0 U40 ( .I(n24), .ZN(n25) );
  BUF1 U41 ( .I(clk_sample_counter[7]), .Z(n26) );
  BUF1 U42 ( .I(n38), .Z(n27) );
  INV0 U43 ( .I(n15), .ZN(n28) );
  INV0 U44 ( .I(n46), .ZN(n29) );
  AN7D1 U45 ( .A1(n9), .A2(n100), .A3(n25), .A4(n43), .A5(
        clk_sample_counter[7]), .A6(clk_sample_counter[3]), .A7(
        clk_sample_counter[4]), .Z(n30) );
  INV0 U46 ( .I(n30), .ZN(n31) );
  INV0 U47 ( .I(n30), .ZN(n32) );
  INV0 U48 ( .I(serial_data_in), .ZN(n33) );
  INV0 U49 ( .I(n33), .ZN(n34) );
  INV0 U50 ( .I(n33), .ZN(n35) );
  INV0 U51 ( .I(rst_n), .ZN(n36) );
  INV0 U52 ( .I(n36), .ZN(n37) );
  INV0 U53 ( .I(n36), .ZN(n38) );
  INV0 U54 ( .I(n36), .ZN(n39) );
  INR2D2 U55 ( .A1(\output_regs[8] ), .B1(n31), .ZN(para_data_out[7]) );
  INR2D2 U56 ( .A1(\output_regs[7] ), .B1(n32), .ZN(para_data_out[6]) );
  INR2D2 U57 ( .A1(\output_regs[6] ), .B1(n31), .ZN(para_data_out[5]) );
  INR2D2 U58 ( .A1(\output_regs[5] ), .B1(n32), .ZN(para_data_out[4]) );
  INR2D2 U59 ( .A1(\output_regs[4] ), .B1(n31), .ZN(para_data_out[3]) );
  INR2D2 U60 ( .A1(\output_regs[3] ), .B1(n31), .ZN(para_data_out[2]) );
  ND2D0 U61 ( .A1(receive_flag), .A2(N10), .ZN(n40) );
  INV0 U62 ( .I(n40), .ZN(n41) );
  INV0 U63 ( .I(n40), .ZN(n42) );
  INR2D2 U64 ( .A1(\output_regs[2] ), .B1(n32), .ZN(para_data_out[1]) );
  DFCN2 re_flag_reg ( .CDN(n37), .CP(n33), .D(N10), .Q(receive_flag) );
  INR2D2 U65 ( .A1(\output_regs[1] ), .B1(n32), .ZN(para_data_out[0]) );
  AN2D1 U66 ( .A1(n18), .A2(n15), .Z(n43) );
  INV0 U67 ( .I(n17), .ZN(n16) );
  NR2D0 U68 ( .A1(n14), .A2(n13), .ZN(N71) );
  INV0 U69 ( .I(clk_sample_counter[5]), .ZN(n15) );
  INV0 U70 ( .I(clk_sample_counter[1]), .ZN(n9) );
  INV0 U71 ( .I(clk_sample_counter[2]), .ZN(n100) );
  INV0 U72 ( .I(clk_sample_counter[6]), .ZN(n18) );
  ND4D0 U73 ( .A1(clk_sample_counter[3]), .A2(n24), .A3(n9), .A4(n100), .ZN(
        n20) );
  INV0 U74 ( .I(clk_sample_counter[0]), .ZN(n24) );
  NR3D0 U75 ( .A1(clk_sample_counter[0]), .A2(clk_sample_counter[2]), .A3(
        clk_sample_counter[1]), .ZN(n47) );
  NR2D0 U76 ( .A1(n20), .A2(n26), .ZN(n44) );
  OAI21D0 U77 ( .A1(n50), .A2(n49), .B(clk_sample_counter[7]), .ZN(N10) );
  ND2D0 U78 ( .A1(n48), .A2(n18), .ZN(n49) );
  NR3D0 U79 ( .A1(n47), .A2(n46), .A3(n45), .ZN(n50) );
  NR2D0 U80 ( .A1(n29), .A2(n13), .ZN(N75) );
  INV0 U81 ( .I(n29), .ZN(n14) );
  INV0 U82 ( .I(n20), .ZN(n22) );
  INV0 U83 ( .I(clk_sample_counter[4]), .ZN(n46) );
  INV0 U84 ( .I(clk_sample_counter[3]), .ZN(n45) );
  INV0 U85 ( .I(n28), .ZN(n48) );
  DFCNS1Q \clk_sample_counter_reg[5]  ( .CDN(rst_n), .CP(n510), .D(N93), .Q(
        clk_sample_counter[5]), .S(n42) );
  DFCNS1Q \clk_sample_counter_reg[4]  ( .CDN(rst_n), .CP(n510), .D(N92), .Q(
        clk_sample_counter[4]), .S(n41) );
  DFCNS1Q \clk_sample_counter_reg[0]  ( .CDN(n37), .CP(clk16), .D(N88), .Q(
        clk_sample_counter[0]), .S(n42) );
  DFCNS1Q \clk_sample_counter_reg[7]  ( .CDN(n39), .CP(clk16), .D(N95), .Q(
        clk_sample_counter[7]), .S(n41) );
  DFCNS1Q \clk_sample_counter_reg[6]  ( .CDN(n39), .CP(clk16), .D(N94), .Q(
        clk_sample_counter[6]), .S(n41) );
  DFCNS1Q \clk_sample_counter_reg[3]  ( .CDN(n37), .CP(clk16), .D(N91), .Q(
        clk_sample_counter[3]), .S(n42) );
  DFCNS1Q \clk_sample_counter_reg[1]  ( .CDN(n27), .CP(n510), .D(N89), .Q(
        clk_sample_counter[1]), .S(n42) );
  DFCNS1Q \clk_sample_counter_reg[2]  ( .CDN(n39), .CP(n510), .D(N90), .Q(
        clk_sample_counter[2]), .S(n41) );
  DFCNS1Q \output_regs_reg[1]  ( .CDN(n37), .CP(n510), .D(n34), .Q(
        \output_regs[1] ), .S(N79) );
  DFCNS1Q \output_regs_reg[2]  ( .CDN(n38), .CP(n510), .D(n35), .Q(
        \output_regs[2] ), .S(N75) );
  DFCNS1Q \output_regs_reg[3]  ( .CDN(n27), .CP(n510), .D(serial_data_in), .Q(
        \output_regs[3] ), .S(N71) );
  DFCNS1Q \output_regs_reg[4]  ( .CDN(n38), .CP(clk16), .D(n35), .Q(
        \output_regs[4] ), .S(N67) );
  DFCNS1Q \output_regs_reg[5]  ( .CDN(n39), .CP(clk16), .D(n34), .Q(
        \output_regs[5] ), .S(N63) );
  DFCNS1Q \output_regs_reg[6]  ( .CDN(n38), .CP(clk16), .D(n35), .Q(
        \output_regs[6] ), .S(N59) );
  DFCNS1Q \output_regs_reg[7]  ( .CDN(rst_n), .CP(clk16), .D(serial_data_in), 
        .Q(\output_regs[7] ), .S(N55) );
  DFCNS1Q \output_regs_reg[8]  ( .CDN(n27), .CP(clk16), .D(n34), .Q(
        \output_regs[8] ), .S(N51) );
  rxblock_DW01_inc_8_0 add_59 ( .A(clk_sample_counter), .SUM({N95, N94, N93, 
        N92, N91, N90, N89, N88}) );
  BUF1 U86 ( .I(clk16), .Z(n510) );
endmodule


module uart ( clk, divisor, rst_n, para_data_in, serial_out, tx_en, tx_flag, 
        serial_in, para_data_out, rx_flag, clk_tx );
  input [15:0] divisor;
  input [7:0] para_data_in;
  output [7:0] para_data_out;
  input clk, rst_n, tx_en, serial_in;
  output serial_out, tx_flag, rx_flag, clk_tx;
  wire   baudout_clk, n1, n2;

  baud_rate u1 ( .CLK(clk), .DIVISOR(divisor), .RST_N(n2), .BAUDOUT_CLK(
        baudout_clk) );
  txblock u2 ( .clk16(baudout_clk), .paral_data(para_data_in), .serial_data(
        serial_out), .tx_en(tx_en), .tx_end(tx_flag), .rst_n(rst_n), .clk_tx(
        clk_tx) );
  rxblock u3 ( .clk16(n1), .serial_data_in(serial_in), .rst_n(rst_n), 
        .para_data_out(para_data_out), .receive_flag(rx_flag) );
  BUF1 U10 ( .I(baudout_clk), .Z(n1) );
  BUF1 U20 ( .I(rst_n), .Z(n2) );

PVDD1M VDD1LEFT();
 PVDD1M VDD1RIGHT();
 PVDD1M VDD1TOP ();
 PVDD1M VDD1BOTTOM();
 PVDD2M VDD2LEFT();
 PVDD2M VDD2RIGHT();
 PVDD2M VDD2TOP();
 PVDD2M VDD2BOTTOM();
 PVSS1M VSS1LEFT();
 PVSS1M VSS1RIGHT();
 PVSS1M VSS1TOP();
 PVSS1M VSS1BOTTOM();
 PVSS2M VSS2LEFT();
 PVSS2M VSS2RIGHT();
 PVSS2M VSS2TOP();
 PVSS2M VSS2BOTTOM();
 PCORNERM CORNERRH();
 PCORNERM CORNERRL();
 PCORNERM CORNERLH();
 PCORNERM CORNERLL();




endmodule

