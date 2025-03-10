module tb_ham_74;

  reg [3:0] d;
  reg [2:0] e0, e1;
  reg clk, rst;
  wire [7:0] c; // Output of encoder
  wire [7:0] qc;
  wire [3:0] qd;
  wire x;
  reg [3:0] counter;

  // Instantiate Encoder and Decoder
  ham_74_encoder encoder(.d(d), .c(c));
  ham_74_decoder decoder(.c(corrupted_codeword), .qc(qc), .qd(qd), .x(x));

  // Clock generation
  initial begin
    clk = 0;
    forever #2.5 clk = ~clk; // 10 time units per cycle
  end

  // Reset generation
  initial begin
    rst = 1;
    #20 rst = 0;
  end

  // Counter
  always @(posedge clk) begin
    if (rst) begin
      counter <= 0;
    end else begin
      counter <= counter + 1;
    end
  end

  // Random data and error signals
  always @(posedge clk) begin
    if (rst) begin
      d <= 0;
      e0 <= 0;
      e1 <= 0;
    end else begin
      d <= $random;
      e0 <= $random;
      e1 <= $random;
    end
  end

  // 3-to-8 Decoders
  wire [7:0] e0_decoder_out;
  wire [7:0] e1_decoder_out;

  always @* begin : e0_decoder
    case (e0)
      3'b000: e0_decoder_out = 8'b00000001;
      3'b001: e0_decoder_out = 8'b00000010;
      3'b010: e0_decoder_out = 8'b00000100;
      3'b011: e0_decoder_out = 8'b00001000;
      3'b100: e0_decoder_out = 8'b00010000;
      3'b101: e0_decoder_out = 8'b00100000;
      3'b110: e0_decoder_out = 8'b01000000;
      3'b111: e0_decoder_out = 8'b10000000;
      default: e0_decoder_out = 8'b00000000;
    endcase
  end

  always @* begin : e1_decoder
      case (e1)
        3'b000: e1_decoder_out = 8'b00000001;
        3'b001: e1_decoder_out = 8'b00000010;
        3'b010: e1_decoder_out = 8'b00000100;
        3'b011: e1_decoder_out = 8'b00001000;
        3'b100: e1_decoder_out = 8'b00010000;
        3'b101: e1_decoder_out = 8'b00100000;
        3'b110: e1_decoder_out = 8'b01000000;
        3'b111: e1_decoder_out = 8'b10000000;
        default: e1_decoder_out = 8'b00000000;
      endcase
  end

  // Error Injection - Two XOR stages with implied MUXes
  wire [7:0] intermediate_codeword;
  wire [7:0] corrupted_codeword;

  genvar i;
  generate
    // First XOR stage (controlled by C[3] and OR of decoders)
    for (i = 0; i < 8; i = i + 1) begin : xor_stage1
      assign intermediate_codeword[i] = c[i] ^ (counter[3] & (e0_decoder_out[i] | e1_decoder_out[i]));
    end

    // Second XOR stage (controlled by C[3], selects e0)
     for (i = 0; i < 8; i = i + 1) begin : xor_stage2
       assign corrupted_codeword[i] = intermediate_codeword[i] ^ (counter[3] & e0_decoder_out[i]);
     end
  endgenerate

  // Display results
  always @(posedge clk) begin
    if (!rst) begin
      $display("Time=%0t, d=%b, e0=%b, e1=%b, c=%b, inter_c=%b, corrupted_c=%b, qc=%b, qd=%b, x=%b",
               $time, d, e0, e1, c, intermediate_codeword, corrupted_codeword, qc, qd, x);
    end
  end

endmodule