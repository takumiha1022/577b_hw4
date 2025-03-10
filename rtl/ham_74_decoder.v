module ham_74_decoder (
  input       [7:0] c,     // 8-bit received codeword
  output reg  [7:0] qc,  // 8-bit corrected codeword
  output reg  [3:0] qd,    // 4-bit corrected data  <--- CORRECT
  output      reg   x     // Double-error flag
);

  // Intermediate wires for syndrome calculation and 7-bit correction
  wire [2:0] syndrome;
  wire [6:0] corrected_hamming;

  // --- Syndrome Calculation (using Parity-Check Matrix H) ---
  assign syndrome[0] = c[0] ^ c[1] ^ c[2] ^ c[4] ^ c[6];
  assign syndrome[1] = c[0] ^ c[2] ^ c[3] ^ c[5] ^ c[6];
  assign syndrome[2] = c[1] ^ c[2] ^ c[3] ^ c[6];

  // --- Overall Parity Check ---
  wire overall_parity;
  assign overall_parity = c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[7];

  // --- Error Correction Logic (7-bit Hamming Code) ---
  // Correct the potentially erroneous bit based on the syndrome
  assign corrected_hamming[0] = c[0] ^ (syndrome == 3'b001);
  assign corrected_hamming[1] = c[1] ^ (syndrome == 3'b010);
  assign corrected_hamming[2] = c[2] ^ (syndrome == 3'b011);
  assign corrected_hamming[3] = c[3] ^ (syndrome == 3'b100);
  assign corrected_hamming[4] = c[4] ^ (syndrome == 3'b101);
  assign corrected_hamming[5] = c[5] ^ (syndrome == 3'b110);
  assign corrected_hamming[6] = c[6] ^ (syndrome == 3'b111);

  // --- SEC-DED Output Logic and Data Extraction ---

  always @* begin
    // Calculate qc and x
    if (syndrome == 3'b000 && overall_parity == 1'b0) begin // No error
      qc = c;
      x = 1'b0;
    end else if(syndrome != 3'b000 && overall_parity == 1'b1)  begin     // Single-bit error
      qc[6:0] = corrected_hamming;
      qc[7] =  ^(qc[6:0]); // Recalculate even parity bit
      x = 1'b0;
    end else if (syndrome != 3'b000 && overall_parity == 1'b0) begin // Double-bit error
      qc = c;  //Do not correct
      x = 1'b1;
    end else begin
        qc = c;// Other cases are ignored
        x = 1'b0; //
    end

    // --- Extract Corrected Data --- (Inside the always block, NO assign)
    qd[0] = qc[2];  // Direct procedural assignment
    qd[1] = qc[4];
    qd[2] = qc[5];
    qd[3] = qc[6];
  end

endmodule
