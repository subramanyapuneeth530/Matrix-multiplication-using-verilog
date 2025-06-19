module matrix1 (
    input  [3:0] A00, A01, A10, A11,  // 2×2 matrix A
    input  [3:0] B00, B01, B10, B11,  // 2×2 matrix B
    output [7:0] C00, C01, C10, C11   // 2×2 matrix C
);

    wire [7:0] M000, M001, M010, M011;
    wire [7:0] M100, M101, M110, M111;

    // Compute all products
    assign M000 = A00 * B00;
    assign M001 = A01 * B10;
    assign M010 = A00 * B01;
    assign M011 = A01 * B11;

    assign M100 = A10 * B00;
    assign M101 = A11 * B10;
    assign M110 = A10 * B01;
    assign M111 = A11 * B11;

    // Final outputs
    assign C00 = M000 + M001;
    assign C01 = M010 + M011;
    assign C10 = M100 + M101;
    assign C11 = M110 + M111;

endmodule
