/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-5
// Date      : Sun Mar  9 15:35:21 2025
/////////////////////////////////////////////////////////////


module ham_74_decoder ( c, qc, qd, x );
  input [7:0] c;
  output [7:0] qc;
  output [3:0] qd;
  output x;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52;
  assign qc[7] = c[7];
  assign qc[6] = qd[3];
  assign qc[5] = qd[2];
  assign qc[4] = qd[1];
  assign qc[2] = qd[0];

  NAND2X1 U15 ( .A(n14), .B(n7), .Y(qd[3]) );
  NOR3X1 U16 ( .A(n51), .B(c[6]), .C(n43), .Y(n15) );
  OAI21X1 U17 ( .A(n52), .B(n43), .C(c[6]), .Y(n14) );
  NAND3X1 U18 ( .A(n18), .B(n9), .C(n19), .Y(n17) );
  NAND2X1 U19 ( .A(n20), .B(n6), .Y(qd[2]) );
  NOR3X1 U20 ( .A(n51), .B(c[5]), .C(n49), .Y(n21) );
  OAI21X1 U21 ( .A(n52), .B(n49), .C(c[5]), .Y(n20) );
  NAND3X1 U22 ( .A(n19), .B(n18), .C(n23), .Y(n22) );
  NAND2X1 U23 ( .A(n24), .B(n5), .Y(qd[1]) );
  NOR3X1 U24 ( .A(n51), .B(c[4]), .C(n46), .Y(n25) );
  OAI21X1 U25 ( .A(n52), .B(n46), .C(c[4]), .Y(n24) );
  NAND3X1 U26 ( .A(n18), .B(n9), .C(n10), .Y(n26) );
  NAND2X1 U27 ( .A(n27), .B(n4), .Y(qd[0]) );
  NOR3X1 U28 ( .A(n51), .B(c[2]), .C(n45), .Y(n28) );
  OAI21X1 U29 ( .A(n52), .B(n45), .C(c[2]), .Y(n27) );
  NAND3X1 U30 ( .A(n19), .B(n9), .C(n11), .Y(n29) );
  NAND2X1 U31 ( .A(n30), .B(n3), .Y(qc[3]) );
  NOR3X1 U32 ( .A(n51), .B(c[3]), .C(n44), .Y(n31) );
  OAI21X1 U33 ( .A(n52), .B(n44), .C(c[3]), .Y(n30) );
  NAND2X1 U35 ( .A(n33), .B(n2), .Y(qc[1]) );
  NOR3X1 U36 ( .A(n51), .B(c[1]), .C(n47), .Y(n34) );
  OAI21X1 U37 ( .A(n52), .B(n47), .C(c[1]), .Y(n33) );
  NAND2X1 U39 ( .A(n36), .B(n1), .Y(qc[0]) );
  NOR3X1 U40 ( .A(n51), .B(c[0]), .C(n50), .Y(n37) );
  OAI21X1 U41 ( .A(n52), .B(n50), .C(c[0]), .Y(n36) );
  NAND3X1 U44 ( .A(n11), .B(n10), .C(n23), .Y(n12) );
  XNOR2X1 U45 ( .A(n39), .B(n40), .Y(n19) );
  FAX1 U46 ( .A(c[3]), .B(n41), .C(c[1]), .YS(n18) );
  FAX1 U47 ( .A(c[7]), .B(n40), .C(n9), .YS(n13) );
  FAX1 U48 ( .A(c[4]), .B(c[1]), .C(n39), .YS(n23) );
  XNOR2X1 U49 ( .A(c[0]), .B(n41), .Y(n39) );
  XOR2X1 U50 ( .A(c[2]), .B(c[6]), .Y(n41) );
  XOR2X1 U51 ( .A(c[5]), .B(c[3]), .Y(n40) );
  AND2X1 U52 ( .A(n13), .B(n42), .Y(n16) );
  AND2X1 U53 ( .A(n8), .B(n42), .Y(x) );
  BUFX2 U54 ( .A(n12), .Y(n42) );
  BUFX2 U55 ( .A(n17), .Y(n43) );
  AND2X1 U56 ( .A(n23), .B(n10), .Y(n32) );
  INVX1 U57 ( .A(n32), .Y(n44) );
  BUFX2 U58 ( .A(n29), .Y(n45) );
  BUFX2 U59 ( .A(n26), .Y(n46) );
  AND2X1 U60 ( .A(n23), .B(n11), .Y(n35) );
  INVX1 U61 ( .A(n35), .Y(n47) );
  INVX1 U62 ( .A(n16), .Y(n48) );
  BUFX2 U63 ( .A(n22), .Y(n49) );
  AND2X1 U64 ( .A(n11), .B(n10), .Y(n38) );
  INVX1 U65 ( .A(n38), .Y(n50) );
  INVX1 U66 ( .A(n19), .Y(n10) );
  BUFX2 U67 ( .A(n48), .Y(n51) );
  BUFX2 U68 ( .A(n48), .Y(n52) );
  INVX1 U69 ( .A(n23), .Y(n9) );
  INVX1 U70 ( .A(n18), .Y(n11) );
  INVX1 U71 ( .A(n13), .Y(n8) );
  INVX1 U72 ( .A(n37), .Y(n1) );
  INVX1 U73 ( .A(n34), .Y(n2) );
  INVX1 U74 ( .A(n28), .Y(n4) );
  INVX1 U75 ( .A(n31), .Y(n3) );
  INVX1 U76 ( .A(n25), .Y(n5) );
  INVX1 U77 ( .A(n21), .Y(n6) );
  INVX1 U78 ( .A(n15), .Y(n7) );
endmodule

