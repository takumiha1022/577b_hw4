module TM_ALU (
    input  wire        clk,
    input  wire        reset,
    input  wire [7:0]  AvgTxLen,
    input  wire [7:0]  InstExed,
    input  wire [7:0]  CurTxLen,
    output wire [7:0]  AvgTxLen_new,
    output wire [7:0]  InstExed_new
);

    // Stage 1: Multiply-Accumulate and Increment
    reg [15:0] mac_result; // Wider to hold multiplication result
    reg [7:0]  inc_result;
    reg [15:0] mac_reg;    // Pipeline register for MAC result
    reg [7:0]  inc_reg;     // Pipeline register for InstExed + 1
    reg [7:0]  AvgTxLen_reg; // Pipeline register for AvgTxLen

    always @(posedge clk) begin
        if (reset) begin
            mac_reg      <= 0;
            inc_reg      <= 0;
            AvgTxLen_reg <= 0;
        end else begin
            mac_result     <= AvgTxLen * InstExed;
            mac_reg      <= mac_result + CurTxLen;
            inc_result     <= InstExed + 1;
            inc_reg      <= inc_result;
            AvgTxLen_reg <= AvgTxLen; // Capture AvgTxLen
        end
    end

    // Stage 2: Division
    reg [7:0] AvgTxLen_new_reg;

    // Behavioral division (synthesis tool will implement)
    always @(posedge clk) begin
        if (reset) begin
            AvgTxLen_new_reg <= 0;
        end else begin
            if (inc_reg == 0) begin // Prevent division by zero
                AvgTxLen_new_reg <= 0;
            end else begin
                AvgTxLen_new_reg <= mac_reg / inc_reg;
            end
        end
    end

    // Output Assignments
    assign AvgTxLen_new  = AvgTxLen_new_reg;
    assign InstExed_new = (reset) ? 8'b0 : AvgTxLen_reg; // Use registered value

endmodule
