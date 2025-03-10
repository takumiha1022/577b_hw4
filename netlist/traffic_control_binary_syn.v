/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-5
// Date      : Sun Mar  9 13:59:29 2025
/////////////////////////////////////////////////////////////


module traffic_control_binary ( CLK, reset, ERR, PA, PB, L_A, L_B, RA, RB );
  output [2:0] L_A;
  output [2:0] L_B;
  input CLK, reset, ERR, PA, PB;
  output RA, RB;
  wire   n132, from_state3, req_A, req_B, ped_A, ped_B, N144, N145, N146, N147,
         N148, N149, N150, n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n12, n14,
         n15, n16, n17, n18, n19, n20, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131;
  wire   [2:0] state;
  wire   [3:0] counter;

  DFFPOSX1 state_reg_0_ ( .D(n106), .CLK(CLK), .Q(state[0]) );
  DFFPOSX1 req_A_reg ( .D(n80), .CLK(CLK), .Q(req_A) );
  DFFPOSX1 state_reg_2_ ( .D(n111), .CLK(CLK), .Q(state[2]) );
  DFFPOSX1 counter_reg_0_ ( .D(N147), .CLK(CLK), .Q(counter[0]) );
  DFFPOSX1 counter_reg_1_ ( .D(N148), .CLK(CLK), .Q(counter[1]) );
  DFFPOSX1 counter_reg_2_ ( .D(N149), .CLK(CLK), .Q(counter[2]) );
  DFFPOSX1 counter_reg_3_ ( .D(N150), .CLK(CLK), .Q(counter[3]) );
  DFFPOSX1 state_reg_1_ ( .D(n105), .CLK(CLK), .Q(state[1]) );
  DFFPOSX1 req_B_reg ( .D(n79), .CLK(CLK), .Q(req_B) );
  DFFPOSX1 from_state3_reg ( .D(n107), .CLK(CLK), .Q(from_state3) );
  DFFPOSX1 ped_B_reg ( .D(n87), .CLK(CLK), .Q(ped_B) );
  DFFPOSX1 ped_A_reg ( .D(n86), .CLK(CLK), .Q(ped_A) );
  AOI22X1 U34 ( .A(req_B), .B(n1), .C(ped_B), .D(n24), .Y(n22) );
  AOI21X1 U36 ( .A(n1), .B(n26), .C(n32), .Y(n23) );
  AOI22X1 U37 ( .A(req_A), .B(n1), .C(ped_A), .D(n24), .Y(n25) );
  OAI21X1 U38 ( .A(n10), .B(n101), .C(n94), .Y(n79) );
  NAND3X1 U39 ( .A(n101), .B(n124), .C(n131), .Y(n30) );
  OAI21X1 U42 ( .A(n11), .B(n100), .C(n93), .Y(n80) );
  NAND3X1 U43 ( .A(n100), .B(n124), .C(n131), .Y(n36) );
  NAND3X1 U46 ( .A(state[2]), .B(state[1]), .C(state[0]), .Y(n38) );
  AOI21X1 U47 ( .A(n123), .B(n17), .C(n32), .Y(n27) );
  AOI22X1 U49 ( .A(n1), .B(n16), .C(from_state3), .D(n123), .Y(n39) );
  NAND3X1 U50 ( .A(n4), .B(n41), .C(n2), .Y(n28) );
  NOR3X1 U51 ( .A(n32), .B(n42), .C(n119), .Y(N150) );
  AOI21X1 U52 ( .A(counter[3]), .B(n122), .C(n129), .Y(n43) );
  NOR3X1 U53 ( .A(n32), .B(n42), .C(n46), .Y(N149) );
  XNOR2X1 U54 ( .A(n47), .B(counter[2]), .Y(n46) );
  NOR3X1 U55 ( .A(n32), .B(n42), .C(n48), .Y(N148) );
  XNOR2X1 U56 ( .A(counter[0]), .B(counter[1]), .Y(n48) );
  NOR3X1 U57 ( .A(n32), .B(counter[0]), .C(n42), .Y(N147) );
  AOI22X1 U58 ( .A(n115), .B(n125), .C(n14), .D(n45), .Y(n49) );
  NAND3X1 U60 ( .A(n53), .B(n97), .C(n98), .Y(n52) );
  NAND3X1 U62 ( .A(n130), .B(n121), .C(n3), .Y(n56) );
  NAND3X1 U63 ( .A(n17), .B(n5), .C(from_state3), .Y(n54) );
  OAI21X1 U65 ( .A(n128), .B(n45), .C(n103), .Y(n60) );
  AOI22X1 U66 ( .A(state[1]), .B(n104), .C(n6), .D(n115), .Y(n62) );
  AOI21X1 U70 ( .A(state[0]), .B(n68), .C(n69), .Y(n67) );
  OAI21X1 U71 ( .A(n117), .B(n127), .C(n92), .Y(n69) );
  NAND3X1 U72 ( .A(n5), .B(n9), .C(n17), .Y(n71) );
  NAND3X1 U73 ( .A(n11), .B(n10), .C(n6), .Y(n59) );
  OAI21X1 U74 ( .A(n6), .B(n130), .C(n3), .Y(n68) );
  OAI21X1 U75 ( .A(n129), .B(n128), .C(n109), .Y(n72) );
  AOI21X1 U76 ( .A(n125), .B(n116), .C(n110), .Y(n65) );
  NAND3X1 U78 ( .A(counter[2]), .B(counter[0]), .C(n113), .Y(n74) );
  NAND3X1 U80 ( .A(n19), .B(n18), .C(n20), .Y(n31) );
  NAND3X1 U82 ( .A(state[1]), .B(n18), .C(state[0]), .Y(n40) );
  AOI22X1 U83 ( .A(n14), .B(n129), .C(n15), .D(n6), .Y(n66) );
  NAND3X1 U84 ( .A(counter[1]), .B(n8), .C(n126), .Y(n51) );
  NAND2X1 U89 ( .A(n128), .B(n130), .Y(L_B[0]) );
  OAI21X1 U90 ( .A(state[2]), .B(n19), .C(n128), .Y(L_A[2]) );
  NAND2X1 U91 ( .A(n128), .B(n12), .Y(L_A[1]) );
  NAND3X1 U92 ( .A(n130), .B(n121), .C(n127), .Y(n132) );
  NAND3X1 U93 ( .A(state[1]), .B(n20), .C(state[2]), .Y(n70) );
  NAND3X1 U94 ( .A(state[2]), .B(n19), .C(state[0]), .Y(n57) );
  NAND3X1 U95 ( .A(n19), .B(n18), .C(state[0]), .Y(n61) );
  NAND2X1 U96 ( .A(n118), .B(n121), .Y(L_A[0]) );
  NAND3X1 U97 ( .A(n20), .B(n19), .C(state[2]), .Y(n58) );
  NAND3X1 U98 ( .A(n20), .B(n18), .C(state[1]), .Y(n64) );
  AND2X1 U99 ( .A(state[2]), .B(n89), .Y(n55) );
  AND2X1 U100 ( .A(n85), .B(n124), .Y(n34) );
  AND2X1 U101 ( .A(n102), .B(n91), .Y(n29) );
  AND2X1 U102 ( .A(n84), .B(n3), .Y(n42) );
  OR2X1 U103 ( .A(n117), .B(n120), .Y(n53) );
  AND2X1 U104 ( .A(n102), .B(n90), .Y(n35) );
  AND2X1 U105 ( .A(n83), .B(n88), .Y(n41) );
  OR2X1 U106 ( .A(n108), .B(n32), .Y(n81) );
  OR2X1 U107 ( .A(n122), .B(counter[3]), .Y(n45) );
  AND2X1 U108 ( .A(n102), .B(n123), .Y(n24) );
  BUFX2 U109 ( .A(n52), .Y(n82) );
  BUFX2 U110 ( .A(n66), .Y(n83) );
  BUFX2 U111 ( .A(n49), .Y(n84) );
  BUFX2 U112 ( .A(n38), .Y(n85) );
  AND2X1 U113 ( .A(n95), .B(n114), .Y(n78) );
  INVX1 U114 ( .A(n78), .Y(n86) );
  AND2X1 U115 ( .A(n96), .B(n114), .Y(n77) );
  INVX1 U116 ( .A(n77), .Y(n87) );
  BUFX2 U117 ( .A(n67), .Y(n88) );
  BUFX2 U118 ( .A(n56), .Y(n89) );
  AND2X1 U119 ( .A(PA), .B(n34), .Y(n37) );
  INVX1 U120 ( .A(n37), .Y(n90) );
  AND2X1 U121 ( .A(PB), .B(n34), .Y(n33) );
  INVX1 U122 ( .A(n33), .Y(n91) );
  BUFX2 U123 ( .A(n71), .Y(n92) );
  BUFX2 U124 ( .A(n36), .Y(n93) );
  BUFX2 U125 ( .A(n30), .Y(n94) );
  BUFX2 U126 ( .A(n25), .Y(n95) );
  BUFX2 U127 ( .A(n22), .Y(n96) );
  BUFX2 U128 ( .A(n54), .Y(n97) );
  INVX1 U129 ( .A(n55), .Y(n98) );
  BUFX2 U130 ( .A(n132), .Y(L_B[2]) );
  INVX1 U131 ( .A(n35), .Y(n100) );
  INVX1 U132 ( .A(n29), .Y(n101) );
  BUFX2 U133 ( .A(n27), .Y(n102) );
  BUFX2 U134 ( .A(n62), .Y(n103) );
  AND2X1 U135 ( .A(n109), .B(n118), .Y(n63) );
  INVX1 U136 ( .A(n63), .Y(n104) );
  AND2X1 U137 ( .A(n131), .B(n4), .Y(N145) );
  INVX1 U138 ( .A(N145), .Y(n105) );
  AND2X1 U139 ( .A(n131), .B(n41), .Y(N144) );
  INVX1 U140 ( .A(N144), .Y(n106) );
  INVX1 U141 ( .A(n81), .Y(n107) );
  BUFX2 U142 ( .A(n39), .Y(n108) );
  BUFX2 U143 ( .A(n65), .Y(n109) );
  OR2X1 U144 ( .A(n124), .B(n5), .Y(n73) );
  INVX1 U145 ( .A(n73), .Y(n110) );
  AND2X1 U146 ( .A(n131), .B(n2), .Y(N146) );
  INVX1 U147 ( .A(N146), .Y(n111) );
  BUFX2 U148 ( .A(n74), .Y(n112) );
  OR2X1 U149 ( .A(counter[3]), .B(counter[1]), .Y(n75) );
  INVX1 U150 ( .A(n75), .Y(n113) );
  BUFX2 U151 ( .A(n23), .Y(n114) );
  AND2X1 U152 ( .A(n118), .B(n130), .Y(n50) );
  INVX1 U153 ( .A(n50), .Y(n115) );
  AND2X1 U154 ( .A(n120), .B(n127), .Y(n26) );
  INVX1 U155 ( .A(n26), .Y(n116) );
  BUFX2 U156 ( .A(n59), .Y(n117) );
  BUFX2 U157 ( .A(n64), .Y(n118) );
  BUFX2 U158 ( .A(n43), .Y(n119) );
  BUFX2 U159 ( .A(n40), .Y(n120) );
  BUFX2 U160 ( .A(n58), .Y(n121) );
  AND2X1 U161 ( .A(n47), .B(counter[2]), .Y(n44) );
  INVX1 U162 ( .A(n44), .Y(n122) );
  BUFX2 U163 ( .A(n28), .Y(n123) );
  BUFX2 U164 ( .A(n31), .Y(n124) );
  BUFX2 U165 ( .A(n51), .Y(n125) );
  OR2X1 U166 ( .A(counter[3]), .B(counter[2]), .Y(n76) );
  INVX1 U167 ( .A(n76), .Y(n126) );
  BUFX2 U168 ( .A(n70), .Y(n127) );
  BUFX2 U169 ( .A(n61), .Y(n128) );
  INVX1 U170 ( .A(n45), .Y(n129) );
  BUFX2 U171 ( .A(n57), .Y(n130) );
  OR2X1 U172 ( .A(ERR), .B(reset), .Y(n32) );
  INVX1 U173 ( .A(n32), .Y(n131) );
  INVX1 U174 ( .A(n124), .Y(n17) );
  INVX1 U175 ( .A(n123), .Y(n1) );
  INVX1 U176 ( .A(n121), .Y(n14) );
  INVX1 U177 ( .A(L_B[2]), .Y(n12) );
  OR2X1 U178 ( .A(n14), .B(L_A[2]), .Y(L_B[1]) );
  INVX1 U179 ( .A(n125), .Y(n6) );
  INVX1 U180 ( .A(n118), .Y(n15) );
  INVX1 U181 ( .A(n72), .Y(n3) );
  INVX1 U182 ( .A(state[1]), .Y(n19) );
  INVX1 U183 ( .A(state[2]), .Y(n18) );
  INVX1 U184 ( .A(state[0]), .Y(n20) );
  INVX1 U185 ( .A(n120), .Y(n16) );
  AND2X1 U186 ( .A(ped_B), .B(n17), .Y(RB) );
  AND2X1 U187 ( .A(ped_A), .B(n17), .Y(RA) );
  INVX1 U188 ( .A(counter[0]), .Y(n8) );
  INVX1 U189 ( .A(from_state3), .Y(n9) );
  AND2X1 U190 ( .A(counter[1]), .B(counter[0]), .Y(n47) );
  INVX1 U191 ( .A(n112), .Y(n5) );
  INVX1 U192 ( .A(n60), .Y(n4) );
  INVX1 U193 ( .A(n82), .Y(n2) );
  INVX1 U194 ( .A(req_B), .Y(n10) );
  INVX1 U195 ( .A(req_A), .Y(n11) );
endmodule

