`timescale 1ns / 1ps

module matrix_loop_tb;

    // Inputs
    reg clk;
    reg rst;
    reg start;
    reg [3:0] A00, A01, A10, A11;
    reg [3:0] B00, B01, B10, B11;

    // Outputs
    wire [7:0] C00, C01, C10, C11;
    wire done;

    // Instantiate the DUT
    matrix_loop uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .A00(A00), .A01(A01), .A10(A10), .A11(A11),
        .B00(B00), .B01(B01), .B10(B10), .B11(B11),
        .C00(C00), .C01(C01), .C10(C10), .C11(C11),
        .done(done)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 100 MHz clock

    initial begin
        // Initialize inputs
        rst = 1;
        start = 0;
        A00 = 0; A01 = 0; A10 = 0; A11 = 0;
        B00 = 0; B01 = 0; B10 = 0; B11 = 0;

        // Wait a few clock cycles
        #20;
        rst = 0;

        // Set input matrices
        // A = [1 2; 3 4], B = [5 6; 7 8]
        A00 = 4'd1; A01 = 4'd2;
        A10 = 4'd3; A11 = 4'd4;
        B00 = 4'd5; B01 = 4'd6;
        B10 = 4'd7; B11 = 4'd8;

        // Trigger multiplication
        #10;
        start = 1;
        #10;
        start = 0;  // Pulse start

        // Wait for completion
        wait(done == 1);

        // Display result
        $display("Matrix C = A x B:");
        $display("[ %0d  %0d ]", C00, C01);
        $display("[ %0d  %0d ]", C10, C11);

        // Expected:
        // C00 = 1*5 + 2*7 = 5 + 14 = 19
        // C01 = 1*6 + 2*8 = 6 + 16 = 22
        // C10 = 3*5 + 4*7 = 15 + 28 = 43
        // C11 = 3*6 + 4*8 = 18 + 32 = 50

        $finish;
    end

endmodule
