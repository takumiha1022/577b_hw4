module tb_traffic_control;

    // Inputs to the DUT
    reg CLK;
    reg reset;
    reg ERR;
    reg PA;
    reg PB;

    // Outputs from the DUT
    wire [2:0] L_A;
    wire [2:0] L_B;
    wire RA;
    wire RB;

    // Instantiate the Device Under Test (DUT) - Use the BINARY version here
    traffic_control_one_hot test1 (
        .CLK(CLK),
        .reset(reset),
        .ERR(ERR),
        .PA(PA),
        .PB(PB),
        .L_A(L_A),
        .L_B(L_B),
        .RA(RA),
        .RB(RB)
    );

    // Clock generation (1.25 time units per half-cycle = 2.5 time units period)
    initial begin
        CLK = 0;
        forever #2.5 CLK = ~CLK; // Changed to 1.25 for 2.5 time unit period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        ERR   = 0;
        PA    = 0;
        PB    = 0;
        #7.5;  // Wait for a few clock cycles with reset asserted (3 cycles * 2.5)
        reset = 0;
        #5;   //wait to finish reset (2 cycles * 2.5)

        // --- Test Case 1: Normal operation (no pedestrian requests) ---
        #40;  // Let it run through several cycles (STATE1 -> STATE6) (16 cycles * 2.5)

        // --- Test Case 2: Pedestrian request on A Ave (PA) ---
        PA = 1;
        #5;   // Keep PA high for a few cycles (2 cycles * 2.5)
        PA = 0;
        #60;  // Observe transition to pedestrian crossing and back (24 cycles *2.5)

        // --- Test Case 3: Pedestrian request on B Ave (PB) ---
        PB = 1;
        #5;
        PB = 0;
        #60; //(24 cycles *2.5)

        // --- Test Case 4:  Pedestrian requests on BOTH A and B
        //    Request on A, then a request on B while in State 3
        @(posedge CLK);
          PA = 1'b1;
        #15; // (6 cycles * 2.5)
        @(posedge CLK);
          PA = 1'b0;
        #20; // (8 cycles * 2.5)
        @(posedge CLK);
          PB = 1;
        #5;// (2 cycles * 2.5)
          PB = 0;
        #70;// (28 cycles * 2.5)


        // --- Test Case 5: Error condition (ERR) ---
        ERR = 1;
        #10;  // Keep ERR high for a while (4 cycles * 2.5)
        ERR = 0;
        #75; // Observe recovery (goes to pedestrian crossing first) (30 cycles * 2.5)

        // --- Test Case 6: Reset condition ---
        reset = 1;
        #5;// (2 cycles * 2.5)
        reset = 0;
        #40;// (16 cycles * 2.5)

        // --- Test Case 7: Reset during normal operation
        #20;// (8 cycles * 2.5)
        reset = 1;
        #5;// (2 cycles * 2.5)
        reset = 0;
        #40;// (16 cycles * 2.5)

       //--- Test Case 8 PA during state 0
        PA = 1;
        #5;// (2 cycles * 2.5)
        PA = 0;
        #30; //(12 cycles * 2.5)
        #5; // (2 cycles * 2.5)
        PA = 1;
        #5;// (2 cycles * 2.5)
        PA =0;
        #75;// (30 cycles * 2.5)

        //--- Test Case 9 PB during state 0
        PB = 1;
        #5;// (2 cycles * 2.5)
        PB = 0;
        #30;//(12 cycles * 2.5)
        #5;// (2 cycles * 2.5)
        PB = 1;
        #5;// (2 cycles * 2.5)
        PB =0;
        #75;// (30 cycles * 2.5)

        // Finish simulation
        $finish;
    end
      // Monitor for debugging
    initial begin
         $monitor("Time=%0t, CLK=%b, reset=%b, ERR=%b, PA=%b, PB=%b, state=%d, L_A=%b, L_B=%b, RA=%b, RB=%b",
            $time, CLK, reset, ERR, PA, PB, dut.state, L_A, L_B, RA, RB);
    end
endmodule