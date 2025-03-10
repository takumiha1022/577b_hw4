// ham_74_encoder.v

module ham_74_encoder (
  input  [3:0] d,  // 4-bit data input
  output [7:0] c   // 8-bit encoded codeword output
);

  // Intermediate wires for the 7-bit Hamming code
  wire [6:0] hamming_code;

  // --- Hamming (7, 4) Encoding ---
  // Using the Generator Matrix (G) from the first image.
  // All additions are modulo 2 (XOR)

  assign hamming_code[0] = d[0] ^ d[1] ^ d[3];
  assign hamming_code[1] = d[0] ^ d[2] ^ d[3];
  assign hamming_code[2] = d[0];
  assign hamming_code[3] = d[1] ^ d[2] ^ d[3];
  assign hamming_code[4] = d[1];
  assign hamming_code[5] = d[2];
  assign hamming_code[6] = d[3];

  // --- SEC-DED: Add Overall Parity Bit (Even Parity) ---
  assign c[7] = hamming_code[0] ^ hamming_code[1] ^ hamming_code[2] ^ hamming_code[3] ^ hamming_code[4] ^ hamming_code[5] ^ hamming_code[6];

  // Assign the 7-bit Hamming code to the lower bits of the output
  assign c[6:0] = hamming_code;

endmodule