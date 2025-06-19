`timescale 1ns / 1ps

module matrix1_tb;

    // Inputs
    reg [3:0] A00, A01, A10, A11;
    reg [3:0] B00, B01, B10, B11;

    // Outputs
    wire [7:0] C00, C01, C10, C11;

    // Instantiate the DUT (Device Under Test)
    matrix1 uut (
        .A00(A00), .A01(A01),
        .A10(A10), .A11(A11),
        .B00(B00), .B01(B01),
        .B10(B10), .B11(B11),
        .C00(C00), .C01(C01),
        .C10(C10), .C11(C11)
    );

    initial begin
        // Initialize inputs (Matrix A and B)
        A00 = 4'd1; A01 = 4'd2;
        A10 = 4'd3; A11 = 4'd4;

        B00 = 4'd5; B01 = 4'd6;
        B10 = 4'd7; B11 = 4'd8;

        // Wait for computation
        #10;

        // Display inputs and outputs
        $display("Matrix A:");
        $display("%d %d", A00, A01);
        $display("%d %d", A10, A11);

        $display("\nMatrix B:");
        $display("%d %d", B00, B01);
        $display("%d %d", B10, B11);

        $display("\nMatrix C = A x B:");
        $display("%d %d", C00, C01); // Expected: 19 22
        $display("%d %d", C10, C11); // Expected: 43 50

        $finish;
    end

endmodule
