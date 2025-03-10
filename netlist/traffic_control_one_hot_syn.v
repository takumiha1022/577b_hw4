/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-5
// Date      : Sun Mar  9 14:13:03 2025
/////////////////////////////////////////////////////////////


module traffic_control_one_hot ( CLK, reset, ERR, PA, PB, L_A, L_B, RA, RB );
  output [2:0] L_A;
  output [2:0] L_B;
  input CLK, reset, ERR, PA, PB;
  output RA, RB;
  wire   n172, n173, from_state3, req_A, req_B, ped_A, ped_B, N244, N245, N246,
         N247, N248, N249, N250, N251, N252, N253, N254, N255, n1, n2, n4, n5,
         n6, n7, n8, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171;
  wire   [7:0] state;
  wire   [3:0] counter;

  DFFPOSX1 state_reg_0_ ( .D(N244), .CLK(CLK), .Q(state[0]) );
  DFFPOSX1 req_B_reg ( .D(n107), .CLK(CLK), .Q(req_B) );
  DFFPOSX1 from_state3_reg ( .D(n106), .CLK(CLK), .Q(from_state3) );
  DFFPOSX1 state_reg_1_ ( .D(N245), .CLK(CLK), .Q(state[1]) );
  DFFPOSX1 counter_reg_0_ ( .D(N252), .CLK(CLK), .Q(counter[0]) );
  DFFPOSX1 counter_reg_1_ ( .D(N253), .CLK(CLK), .Q(counter[1]) );
  DFFPOSX1 counter_reg_2_ ( .D(N254), .CLK(CLK), .Q(counter[2]) );
  DFFPOSX1 counter_reg_3_ ( .D(N255), .CLK(CLK), .Q(counter[3]) );
  DFFPOSX1 state_reg_5_ ( .D(n138), .CLK(CLK), .Q(state[5]) );
  DFFPOSX1 state_reg_7_ ( .D(n113), .CLK(CLK), .Q(state[7]) );
  DFFPOSX1 state_reg_6_ ( .D(n112), .CLK(CLK), .Q(state[6]) );
  DFFPOSX1 state_reg_4_ ( .D(N248), .CLK(CLK), .Q(state[4]) );
  DFFPOSX1 state_reg_2_ ( .D(n153), .CLK(CLK), .Q(state[2]) );
  DFFPOSX1 state_reg_3_ ( .D(n143), .CLK(CLK), .Q(state[3]) );
  DFFPOSX1 req_A_reg ( .D(n105), .CLK(CLK), .Q(req_A) );
  DFFPOSX1 ped_B_reg ( .D(n135), .CLK(CLK), .Q(ped_B) );
  DFFPOSX1 ped_A_reg ( .D(n140), .CLK(CLK), .Q(ped_A) );
  AOI22X1 U47 ( .A(n137), .B(n35), .C(ped_B), .D(n36), .Y(n33) );
  AOI22X1 U50 ( .A(n142), .B(n35), .C(ped_A), .D(n36), .Y(n38) );
  OAI21X1 U52 ( .A(n158), .B(n11), .C(n157), .Y(n105) );
  OAI21X1 U56 ( .A(n123), .B(n127), .C(n117), .Y(n106) );
  NAND3X1 U57 ( .A(n32), .B(n126), .C(from_state3), .Y(n48) );
  AOI22X1 U59 ( .A(n171), .B(n165), .C(n53), .D(n14), .Y(n50) );
  OAI21X1 U62 ( .A(n149), .B(n10), .C(n148), .Y(n107) );
  AOI21X1 U66 ( .A(n22), .B(n1), .C(n57), .Y(n43) );
  NOR3X1 U67 ( .A(n57), .B(n2), .C(n147), .Y(N255) );
  AOI21X1 U68 ( .A(counter[3]), .B(n162), .C(n5), .Y(n58) );
  NOR3X1 U69 ( .A(n57), .B(n2), .C(n60), .Y(N254) );
  XNOR2X1 U70 ( .A(n61), .B(counter[2]), .Y(n60) );
  NOR3X1 U71 ( .A(n57), .B(n2), .C(n62), .Y(N253) );
  XOR2X1 U72 ( .A(n7), .B(counter[1]), .Y(n62) );
  NOR3X1 U73 ( .A(n57), .B(counter[0]), .C(n2), .Y(N252) );
  NAND3X1 U75 ( .A(n15), .B(n13), .C(n171), .Y(n63) );
  AOI22X1 U78 ( .A(state[6]), .B(n133), .C(n17), .D(n6), .Y(n64) );
  AOI22X1 U80 ( .A(state[5]), .B(n68), .C(n5), .D(n21), .Y(n67) );
  NAND3X1 U81 ( .A(n121), .B(n125), .C(n129), .Y(n69) );
  NAND3X1 U83 ( .A(n16), .B(n6), .C(n53), .Y(n71) );
  NAND3X1 U84 ( .A(from_state3), .B(n22), .C(n4), .Y(n70) );
  AOI22X1 U86 ( .A(state[3]), .B(n68), .C(n18), .D(n6), .Y(n74) );
  AOI22X1 U88 ( .A(state[2]), .B(n77), .C(n5), .D(n19), .Y(n76) );
  NAND3X1 U89 ( .A(n120), .B(n124), .C(n128), .Y(n79) );
  NAND3X1 U91 ( .A(n14), .B(n6), .C(n53), .Y(n81) );
  NAND3X1 U92 ( .A(n22), .B(n8), .C(n4), .Y(n80) );
  OAI21X1 U93 ( .A(n2), .B(n31), .C(n116), .Y(n35) );
  AOI21X1 U94 ( .A(n122), .B(n6), .C(n12), .Y(n84) );
  NAND3X1 U95 ( .A(n37), .B(n87), .C(state[7]), .Y(n86) );
  AOI21X1 U96 ( .A(n160), .B(n165), .C(n53), .Y(n85) );
  OAI21X1 U98 ( .A(n6), .B(n161), .C(n65), .Y(n68) );
  AOI21X1 U100 ( .A(n167), .B(n14), .C(n91), .Y(n51) );
  NAND3X1 U101 ( .A(counter[2]), .B(counter[0]), .C(n156), .Y(n83) );
  NAND3X1 U103 ( .A(n93), .B(n26), .C(state[0]), .Y(n40) );
  AOI22X1 U104 ( .A(n16), .B(n167), .C(n19), .D(n78), .Y(n89) );
  OAI21X1 U105 ( .A(n6), .B(n169), .C(n134), .Y(n77) );
  NAND3X1 U108 ( .A(counter[1]), .B(n7), .C(n168), .Y(n90) );
  NAND2X1 U110 ( .A(n152), .B(n15), .Y(L_B[1]) );
  NAND2X1 U111 ( .A(n164), .B(n161), .Y(L_B[0]) );
  NAND3X1 U112 ( .A(n169), .B(n164), .C(n160), .Y(n172) );
  NAND3X1 U113 ( .A(n146), .B(n24), .C(state[3]), .Y(n88) );
  NAND2X1 U114 ( .A(n164), .B(n13), .Y(L_A[1]) );
  NAND3X1 U115 ( .A(n161), .B(n152), .C(n165), .Y(n173) );
  NAND3X1 U116 ( .A(n146), .B(n28), .C(state[6]), .Y(n52) );
  NOR3X1 U118 ( .A(state[0]), .B(state[5]), .C(n151), .Y(n87) );
  NAND3X1 U119 ( .A(state[5]), .B(n37), .C(n100), .Y(n66) );
  NOR3X1 U120 ( .A(n151), .B(state[7]), .C(state[0]), .Y(n100) );
  NAND3X1 U121 ( .A(n29), .B(n27), .C(n30), .Y(n94) );
  NAND3X1 U122 ( .A(n20), .B(n29), .C(state[1]), .Y(n95) );
  NAND2X1 U123 ( .A(n169), .B(n152), .Y(L_A[0]) );
  NAND3X1 U124 ( .A(state[4]), .B(n93), .C(n101), .Y(n97) );
  NOR3X1 U125 ( .A(state[0]), .B(state[2]), .C(state[1]), .Y(n101) );
  NAND3X1 U126 ( .A(n20), .B(n30), .C(state[2]), .Y(n75) );
  NAND3X1 U127 ( .A(n31), .B(n27), .C(n93), .Y(n102) );
  NOR3X1 U128 ( .A(state[5]), .B(state[7]), .C(n170), .Y(n93) );
  OR2X1 U130 ( .A(n162), .B(counter[3]), .Y(n78) );
  AND2X1 U131 ( .A(n163), .B(n159), .Y(n41) );
  AND2X1 U132 ( .A(n111), .B(n132), .Y(n49) );
  AND2X1 U133 ( .A(n163), .B(n150), .Y(n54) );
  AND2X1 U134 ( .A(n141), .B(n32), .Y(n104) );
  AND2X1 U135 ( .A(n136), .B(n32), .Y(n103) );
  AND2X1 U136 ( .A(n163), .B(n158), .Y(n42) );
  OR2X1 U137 ( .A(n144), .B(n57), .Y(N247) );
  OR2X1 U138 ( .A(n154), .B(n57), .Y(N246) );
  AND2X1 U139 ( .A(n32), .B(n115), .Y(N248) );
  OR2X1 U140 ( .A(n139), .B(n57), .Y(N249) );
  AND2X1 U141 ( .A(n32), .B(n114), .Y(N245) );
  AND2X1 U142 ( .A(n163), .B(n149), .Y(n55) );
  AND2X1 U143 ( .A(n110), .B(n132), .Y(n65) );
  AND2X1 U144 ( .A(n22), .B(n155), .Y(n91) );
  BUFX2 U145 ( .A(n102), .Y(n108) );
  BUFX2 U146 ( .A(n86), .Y(n109) );
  BUFX2 U147 ( .A(n89), .Y(n110) );
  BUFX2 U148 ( .A(n50), .Y(n111) );
  OR2X1 U149 ( .A(n119), .B(n57), .Y(N250) );
  INVX1 U150 ( .A(N250), .Y(n112) );
  AND2X1 U151 ( .A(n32), .B(n118), .Y(N251) );
  INVX1 U152 ( .A(N251), .Y(n113) );
  BUFX2 U153 ( .A(n79), .Y(n114) );
  BUFX2 U154 ( .A(n69), .Y(n115) );
  BUFX2 U155 ( .A(n84), .Y(n116) );
  BUFX2 U156 ( .A(n48), .Y(n117) );
  BUFX2 U157 ( .A(n63), .Y(n118) );
  BUFX2 U158 ( .A(n64), .Y(n119) );
  BUFX2 U159 ( .A(n80), .Y(n120) );
  BUFX2 U160 ( .A(n70), .Y(n121) );
  BUFX2 U161 ( .A(n85), .Y(n122) );
  AND2X1 U162 ( .A(n6), .B(n166), .Y(n46) );
  INVX1 U163 ( .A(n46), .Y(n123) );
  BUFX2 U164 ( .A(n81), .Y(n124) );
  BUFX2 U165 ( .A(n71), .Y(n125) );
  INVX1 U166 ( .A(n49), .Y(n126) );
  AND2X1 U167 ( .A(n32), .B(n16), .Y(n47) );
  INVX1 U168 ( .A(n47), .Y(n127) );
  AND2X1 U169 ( .A(state[1]), .B(n73), .Y(n82) );
  INVX1 U170 ( .A(n82), .Y(n128) );
  AND2X1 U171 ( .A(state[4]), .B(n73), .Y(n72) );
  INVX1 U172 ( .A(n72), .Y(n129) );
  BUFX2 U173 ( .A(n173), .Y(L_B[2]) );
  BUFX2 U174 ( .A(n172), .Y(L_A[2]) );
  BUFX2 U175 ( .A(n51), .Y(n132) );
  INVX1 U176 ( .A(n65), .Y(n133) );
  AND2X1 U177 ( .A(n21), .B(n78), .Y(n96) );
  INVX1 U178 ( .A(n96), .Y(n134) );
  INVX1 U179 ( .A(n103), .Y(n135) );
  BUFX2 U180 ( .A(n33), .Y(n136) );
  AND2X1 U181 ( .A(n170), .B(n10), .Y(n34) );
  INVX1 U182 ( .A(n34), .Y(n137) );
  INVX1 U183 ( .A(N249), .Y(n138) );
  BUFX2 U184 ( .A(n67), .Y(n139) );
  INVX1 U185 ( .A(n104), .Y(n140) );
  BUFX2 U186 ( .A(n38), .Y(n141) );
  AND2X1 U187 ( .A(n170), .B(n11), .Y(n39) );
  INVX1 U188 ( .A(n39), .Y(n142) );
  AND2X1 U189 ( .A(n1), .B(n145), .Y(n36) );
  INVX1 U190 ( .A(N247), .Y(n143) );
  BUFX2 U191 ( .A(n74), .Y(n144) );
  BUFX2 U192 ( .A(n40), .Y(n145) );
  OR2X1 U193 ( .A(n25), .B(state[7]), .Y(n99) );
  INVX1 U194 ( .A(n99), .Y(n146) );
  BUFX2 U195 ( .A(n58), .Y(n147) );
  INVX1 U196 ( .A(n55), .Y(n148) );
  INVX1 U197 ( .A(n54), .Y(n149) );
  AND2X1 U198 ( .A(PB), .B(n171), .Y(n56) );
  INVX1 U199 ( .A(n56), .Y(n150) );
  BUFX2 U200 ( .A(n94), .Y(n151) );
  BUFX2 U201 ( .A(n97), .Y(n152) );
  INVX1 U202 ( .A(N246), .Y(n153) );
  BUFX2 U203 ( .A(n76), .Y(n154) );
  BUFX2 U204 ( .A(n83), .Y(n155) );
  OR2X1 U205 ( .A(counter[3]), .B(counter[1]), .Y(n92) );
  INVX1 U206 ( .A(n92), .Y(n156) );
  INVX1 U207 ( .A(n42), .Y(n157) );
  INVX1 U208 ( .A(n41), .Y(n158) );
  AND2X1 U209 ( .A(PA), .B(n171), .Y(n44) );
  INVX1 U210 ( .A(n44), .Y(n159) );
  BUFX2 U211 ( .A(n88), .Y(n160) );
  BUFX2 U212 ( .A(n66), .Y(n161) );
  AND2X1 U213 ( .A(counter[2]), .B(n61), .Y(n59) );
  INVX1 U214 ( .A(n59), .Y(n162) );
  BUFX2 U215 ( .A(n43), .Y(n163) );
  BUFX2 U216 ( .A(n95), .Y(n164) );
  BUFX2 U217 ( .A(n52), .Y(n165) );
  AND2X1 U218 ( .A(n10), .B(n11), .Y(n53) );
  INVX1 U219 ( .A(n53), .Y(n166) );
  BUFX2 U220 ( .A(n90), .Y(n167) );
  OR2X1 U221 ( .A(counter[3]), .B(counter[2]), .Y(n98) );
  INVX1 U222 ( .A(n98), .Y(n168) );
  BUFX2 U223 ( .A(n75), .Y(n169) );
  AND2X1 U224 ( .A(n24), .B(n28), .Y(n37) );
  INVX1 U225 ( .A(n37), .Y(n170) );
  OR2X1 U226 ( .A(n12), .B(n22), .Y(n45) );
  INVX1 U227 ( .A(n45), .Y(n171) );
  INVX1 U228 ( .A(n73), .Y(n2) );
  INVX1 U229 ( .A(L_B[2]), .Y(n13) );
  INVX1 U230 ( .A(L_A[2]), .Y(n15) );
  AND2X1 U231 ( .A(n35), .B(n32), .Y(N244) );
  INVX1 U232 ( .A(n35), .Y(n1) );
  OR2X1 U233 ( .A(n77), .B(n68), .Y(n73) );
  INVX1 U234 ( .A(n57), .Y(n32) );
  INVX1 U235 ( .A(n145), .Y(n22) );
  INVX1 U236 ( .A(n108), .Y(n20) );
  INVX1 U237 ( .A(n167), .Y(n6) );
  INVX1 U238 ( .A(n165), .Y(n14) );
  INVX1 U239 ( .A(n164), .Y(n19) );
  INVX1 U240 ( .A(n160), .Y(n16) );
  INVX1 U241 ( .A(n152), .Y(n21) );
  INVX1 U242 ( .A(n155), .Y(n4) );
  INVX1 U243 ( .A(n78), .Y(n5) );
  OR2X1 U244 ( .A(ERR), .B(reset), .Y(n57) );
  INVX1 U245 ( .A(n151), .Y(n26) );
  INVX1 U246 ( .A(n87), .Y(n25) );
  INVX1 U247 ( .A(n169), .Y(n18) );
  INVX1 U248 ( .A(n161), .Y(n17) );
  INVX1 U249 ( .A(state[0]), .Y(n31) );
  INVX1 U250 ( .A(state[1]), .Y(n30) );
  INVX1 U251 ( .A(state[2]), .Y(n29) );
  INVX1 U252 ( .A(state[3]), .Y(n28) );
  INVX1 U253 ( .A(state[6]), .Y(n24) );
  INVX1 U254 ( .A(state[4]), .Y(n27) );
  AND2X1 U255 ( .A(ped_B), .B(n22), .Y(RB) );
  AND2X1 U256 ( .A(ped_A), .B(n22), .Y(RA) );
  AND2X1 U257 ( .A(counter[0]), .B(counter[1]), .Y(n61) );
  INVX1 U258 ( .A(counter[0]), .Y(n7) );
  INVX1 U259 ( .A(n109), .Y(n12) );
  INVX1 U260 ( .A(req_B), .Y(n10) );
  INVX1 U261 ( .A(req_A), .Y(n11) );
  INVX1 U262 ( .A(from_state3), .Y(n8) );
endmodule

