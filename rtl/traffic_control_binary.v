module traffic_control_binary (
    input CLK,        // Clock input
    input reset,      // Synchronous active-high reset
    input ERR,        // Synchronous active-high error signal
    input PA,         // Pedestrian request for A Ave
    input PB,         // Pedestrian request for B Ave
    output reg [2:0] L_A, // Traffic light A signal
    output reg [2:0] L_B, // Traffic light B signal
    output reg RA,        // Audio response for A Ave pedestrian
    output reg RB        // Audio response for B Ave pedestrian
);

    // State parameters - Using localparam for synthesis-friendly constants
    localparam STATE0 = 3'b000; // Pedestrian-crossing (Flashing Red on both)
    localparam STATE1 = 3'b001; // Normal cycle: A: Green,      B: Red
    localparam STATE2 = 3'b010; // Normal cycle: A: Green Left, B: Green Right
    localparam STATE3 = 3'b011; // Normal cycle: A: Yellow,     B: Green Right
    localparam STATE4 = 3'b100; // Normal cycle: A: Red,        B: Green
    localparam STATE5 = 3'b101; // Normal cycle: A: Green Right,B: Green Left
    localparam STATE6 = 3'b110; // Normal cycle: A: Green Right,B: Yellow
    localparam STATE7 = 3'b111; // External error (Flashing Yellow on both)

    // Internal registers
    reg [2:0] state;       // Current state
    reg [2:0] next_state;  // Next state (combinational)
    reg [3:0] counter;     // Clock cycle counter
    reg [3:0] next_counter;// next counter
    reg req_A, req_B;     // Pedestrian request flags (latched)
    reg ped_A, ped_B;     // Flags to indicate pedestrian crossing active
    reg from_state3;      // Flag to remember where we came from

  // Combinational next-state logic
    always @(*) begin
        next_state = state; // Default: stay in the same state
        next_counter = counter + 1; // Default: increment counter

        if (ERR) begin
            next_state = STATE7;
        end else if (reset) begin
            next_state = STATE7;
        end else begin
            case (state)
                STATE7: begin
                    // Exit from error/reset: go to pedestrian crossing
                    next_state = STATE0;
                    next_counter = 4'd0; // Reset counter for STATE0
                end
                STATE0: begin //Pedestrian
                    if (counter == 4'd5) begin
                        next_state = from_state3 ? STATE4 : STATE1;
                        next_counter = 4'd0; // Reset
                    end
                     // No else needed: counter increment is handled by default
                end
                STATE1: begin // Normal
                    if (counter == 4'd7) begin
                        next_state = STATE2;
                        next_counter = 4'd0;
                    end
                end
                STATE2: begin // Normal
                    if (counter == 4'd2) begin
                        next_state = STATE3;
                        next_counter = 4'd0;
                    end
                end
                STATE3: begin // Normal
                    if (counter == 4'd2) begin
                        if (req_A || req_B) begin
                            next_state = STATE0;
                            next_counter = 4'd0;
                        end else begin
                            next_state = STATE4;
                            next_counter = 4'd0;
                        end
                    end
                end
                STATE4: begin
                    if (counter == 4'd7) begin
                        next_state = STATE5;
                        next_counter = 4'd0;
                    end
                end
                STATE5: begin
                    if (counter == 4'd2) begin
                        next_state = STATE6;
                        next_counter = 4'd0;
                    end
                end
                STATE6: begin
                    if (counter == 4'd2) begin
                        if (req_A || req_B) begin
                            next_state = STATE0;
                            next_counter = 4'd0;
                        end else begin
                            next_state = STATE1;
                            next_counter = 4'd0;
                        end
                    end
                end
                default: begin // Defensive coding: should never happen
                    next_state = STATE7;
                    next_counter = 4'd0; // Ensure counter is reset in the default case.
                end
            endcase
        end
    end

    // Sequential logic (state updates and latched requests)
   always @(posedge CLK) begin
        if (reset || ERR) begin // Highest priority
            state      <= STATE7;
            counter    <= 4'd0;
            req_A      <= 1'b0;
            req_B      <= 1'b0;
            ped_A      <= 1'b1; //RA, RB are on during error.
            ped_B      <= 1'b1;
            from_state3<= 1'b0;
        end else begin
            state <= next_state; // Update the state register
            counter <= next_counter; //Update the counter

             // Capture pedestrian requests only if not in crossing/error state
            if (state != STATE0 && state != STATE7) begin
                if (PA) req_A <= 1'b1; // Latch the request
                if (PB) req_B <= 1'b1;
            end

            // Set pedestrian flags when entering STATE0
            if(next_state == STATE0) begin //when we decide to change to state0.
              if(state == STATE3 || state == STATE6) begin //if we are entering from state3 or state6, we set it based on PA, PB
                ped_A <= req_A; // Activate if request was latched
                ped_B <= req_B;
                from_state3 <= (state == STATE3); //we enter from state3.
              end
              else begin
                ped_A <= 1'b1;
                ped_B <= 1'b1;
                from_state3 <= 1'b0;
              end
            end
            // Clear pedestrian crossing flags and latches when leaving STATE0.
            else if (state == STATE0) begin
                ped_A <= 1'b0;
                ped_B <= 1'b0;
                req_A <= 1'b0;  // Clear latched requests
                req_B <= 1'b0;
            end
        end
    end

    // Output logic (combinational - use blocking assignments)
    always @(*) begin
        // Default values (for safety and to avoid latches)
        L_A = 3'b000; // Default to Flashing Yellow
        L_B = 3'b000;
        RA = 1'b0;
        RB = 1'b0;

        case (state)
            STATE0: begin
                L_A = 3'b000; // Flashing Yellow
                L_B = 3'b000;
                RA = ped_A;  // Audio response if request was registered
                RB = ped_B;
            end
            STATE1: begin
                L_A = 3'b110; // Green
                L_B = 3'b011; // Red
            end
            STATE2: begin
                L_A = 3'b101; // Green Left Arrow
                L_B = 3'b010; // Green Right Arrow
            end
            STATE3: begin
                L_A = 3'b100; // Yellow
                L_B = 3'b010; // Green Right Arrow
            end
            STATE4: begin
                L_A = 3'b011; // Red
                L_B = 3'b110; // Green
            end
            STATE5: begin
                L_A = 3'b010; // Green Right Arrow
                L_B = 3'b101; // Green Left Arrow
            end
            STATE6: begin
                L_A = 3'b010; // Green Right Arrow
                L_B = 3'b100; // Yellow
            end
            STATE7: begin
                L_A = 3'b000; // Flashing Yellow
                L_B = 3'b000;
            end
            default: begin
                L_A = 3'b000; // Default to Flashing Yellow - for safety
                L_B = 3'b000; // Default to Flashing Yellow - for safety
            end
        endcase
    end

endmodule