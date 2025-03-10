module tb_TM_ALU;

    // --- Signals ---
    reg clk;
    reg reset;
    reg [7:0] AvgTxLen;
    reg [7:0] InstExed;
    reg [7:0] CurTxLen;
    wire [7:0] AvgTxLen_new;
    wire [7:0] InstExed_new;

    // --- Instantiate the Unit Under Test (UUT) ---
    TM_ALU uut (
        .clk(clk),
        .reset(reset),
        .AvgTxLen(AvgTxLen),
        .InstExed(InstExed),
        .CurTxLen(CurTxLen),
        .AvgTxLen_new(AvgTxLen_new),
        .InstExed_new(InstExed_new)
    );

    // --- Clock Generation ---
    initial begin
        clk = 0;
        forever #2.5 clk = ~clk; // 5 time unit period
    end

    // --- Helper Function: Calculate Expected AvgTxLen ---
    function [7:0] expected_avg_tx_len;
        input [7:0] avg_tx_len_old;
        input [7:0] inst_exed;
        input [7:0] cur_tx_len;
        integer result;
        begin
            if (inst_exed == 0) begin
                result = cur_tx_len;
            end else begin
                result = ((avg_tx_len_old * inst_exed) + cur_tx_len) / (inst_exed + 1);
            end
            expected_avg_tx_len = result[7:0];
        end
    endfunction


    // --- Monitor for Continuous Output ---
    initial begin
        $monitor("Time=%0t, clk=%b, reset=%b, AvgTxLen=%d, InstExed=%d, CurTxLen=%d, AvgTxLen_new=%d, InstExed_new=%d",
                 $time, clk, reset, AvgTxLen, InstExed, CurTxLen, AvgTxLen_new, InstExed_new);
    end


    // --- Test Procedure ---
    initial begin
        // 1. Reset Test
        reset = 1;
        #(2*5); reset = 0; // 2 clock cycles
        $monitor("Reset Test Complete"); // Changed to $monitor

        // 2. Basic Functionality Test
        test_case(8'd10, 8'd1, 8'd20, 8'd15, 8'd2);
        test_case(8'd15, 8'd2, 8'd30, 8'd20, 8'd3);
        test_case(8'd20, 8'd3, 8'd10, 8'd17, 8'd4);
        $monitor("Basic Functionality Test Complete"); // Changed to $monitor

        // 3. Edge Case Test
        test_case(8'd255, 8'd255, 8'd255, 8'd255, 8'd0);
        test_case(8'd255, 8'd0,  8'd255,  8'd255, 8'd1);
        $monitor("Edge Cases test Complete"); // Changed to $monitor

        // 4. Zero Inputs Test
        test_case(8'd0, 8'd0, 8'd0, 8'd0, 8'd1);
        test_case(8'd10, 8'd0, 8'd25, 8'd25, 8'd1);
        $monitor("Zero Inputs test Complete"); // Changed to $monitor


        // 5. Sequential Transactions Test 
        AvgTxLen = 8'd0;  //Clear value.
        InstExed = 8'd0;
        repeat (5) begin
            CurTxLen = $random;
            InstExed = $random;
            AvgTxLen = $random;
            #(4*5); // Increased delay to 4 clock cycles
        end
        $monitor("Sequential test Complete"); // Changed to $monitor

        // 6. Randomized Testing
        repeat (100) begin
            AvgTxLen = $random;
            InstExed = $random;
            CurTxLen = $random;
            #(3*5); 
        end
        $monitor("Randomized Testing Complete"); // Changed to $monitor

        $monitor("All Tests Complete"); // Changed to $monitor
        $finish;
    end

    // --- Test Case Task ---
    task test_case;
        input [7:0] avg_tx_len_in;
        input [7:0] inst_exed_in;
        input [7:0] cur_tx_len_in;
        input [7:0] expected_avg_tx_len_new;
        input [7:0] expected_inst_exed_new;

        begin
            AvgTxLen = avg_tx_len_in;
            InstExed = inst_exed_in;
            CurTxLen = cur_tx_len_in;

            #(4*5); // Wait for 4 clock cycles (Increased from 3)

            if (AvgTxLen_new !== expected_avg_tx_len_new || InstExed_new !== expected_inst_exed_new) begin
                $monitor("ERROR: Test Case Failed!");  //Keep this as $display for error emphasis
                $monitor("  Input: AvgTxLen=%d, InstExed=%d, CurTxLen=%d", avg_tx_len_in, inst_exed_in, cur_tx_len_in);
                $monitor("  Expected: AvgTxLen_new=%d, InstExed_new=%d", expected_avg_tx_len_new, expected_inst_exed_new);
                $monitor("  Actual:   AvgTxLen_new=%d, InstExed_new=%d", AvgTxLen_new, InstExed_new);
                $finish;
            end
        end
    endtask

endmodule