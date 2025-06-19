module matrix_loop (
    input clk,
    input rst,
    input start,
    input [3:0] A00, A01, A10, A11,
    input [3:0] B00, B01, B10, B11,
    output reg [7:0] C00, C01, C10, C11,
    output reg done
);

    // FSM States (Verilog-2001 style)
    reg [3:0] state;

    localparam IDLE     = 4'd0,
               C00_MUL  = 4'd1,
               C00_ACC  = 4'd2,
               C01_MUL  = 4'd3,
               C01_ACC  = 4'd4,
               C10_MUL  = 4'd5,
               C10_ACC  = 4'd6,
               C11_MUL  = 4'd7,
               C11_ACC  = 4'd8,
               DONE     = 4'd9;

    // Internal registers
    reg [3:0] a1, b1, a2, b2;
    reg [7:0] temp1, temp2, sum;

    // Parallel multipliers
    wire [7:0] mul1 = a1 * b1;
    wire [7:0] mul2 = a2 * b2;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            C00 <= 0; C01 <= 0; C10 <= 0; C11 <= 0;
            done <= 0;
            temp1 <= 0; temp2 <= 0; sum <= 0;
            a1 <= 0; a2 <= 0; b1 <= 0; b2 <= 0;
        end else begin
            case (state)
                IDLE: begin
                    done <= 0;
                    if (start) begin
                        a1 <= A00; b1 <= B00;
                        a2 <= A01; b2 <= B10;
                        state <= C00_MUL;
                    end
                end

                C00_MUL: begin
                    temp1 <= mul1;
                    temp2 <= mul2;
                    state <= C00_ACC;
                end

                C00_ACC: begin
                    sum <= temp1 + temp2;
                    C00 <= temp1 + temp2;
                    a1 <= A00; b1 <= B01;
                    a2 <= A01; b2 <= B11;
                    state <= C01_MUL;
                end

                C01_MUL: begin
                    temp1 <= mul1;
                    temp2 <= mul2;
                    state <= C01_ACC;
                end

                C01_ACC: begin
                    sum <= temp1 + temp2;
                    C01 <= temp1 + temp2;
                    a1 <= A10; b1 <= B00;
                    a2 <= A11; b2 <= B10;
                    state <= C10_MUL;
                end

                C10_MUL: begin
                    temp1 <= mul1;
                    temp2 <= mul2;
                    state <= C10_ACC;
                end

                C10_ACC: begin
                    sum <= temp1 + temp2;
                    C10 <= temp1 + temp2;
                    a1 <= A10; b1 <= B01;
                    a2 <= A11; b2 <= B11;
                    state <= C11_MUL;
                end

                C11_MUL: begin
                    temp1 <= mul1;
                    temp2 <= mul2;
                    state <= C11_ACC;
                end

                C11_ACC: begin
                    sum <= temp1 + temp2;
                    C11 <= temp1 + temp2;
                    state <= DONE;
                end

                DONE: begin
                    done <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule
