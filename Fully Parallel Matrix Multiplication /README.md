# Fully Parallel Multiplication
The fully parallel matrix multiplication method leverages the inherent parallelism in matrix operations by computing all output elements simultaneously. Each element in the result matrix is calculated using a dedicated hardware path comprising multipliers and adders, which eliminates the need for iterative computation. This approach is especially advantageous for small, fixed-size matrices like 2×2, where all indices are predetermined and the logic can be unrolled into parallel structures. The result is a highly efficient and fast implementation suitable for hardware designs requiring low-latency performance.

# Equation-Based Parallel Implementation
In this implementation, each output element of the result matrix is derived using a direct expression corresponding to its row-column dot product, and all these calculations occur concurrently. For a 2×2 matrix multiplication, four multipliers handle the necessary element-wise products, and the resulting values are summed using two adders per output element. For example, element C00 is computed as C00 = A00×B00 + A01×B10, while C01 = A00×B01 + A01×B11. All operations are mapped onto separate wires to enable full combinational parallel execution in a single clock cycle, without looping or state management.

# Testbench for Parallel Matrix Multiplication
To verify the correctness of the fully parallel multiplication module, a Verilog testbench named matrix1_tb is created. This testbench instantiates the multiplication module and provides predefined input matrices A and B. For example, matrix A is defined as |1 2|; |3 4|, and matrix B as |5 6|; |7 8|. Upon applying these inputs, the design computes the output matrix C in a single cycle. The testbench then displays the output after a short delay to account for combinational propagation. The expected result matrix |19 22|; |43 50| confirms that the parallel logic is functioning as intended. This verification step is essential for ensuring design correctness before hardware synthesis.

# Results :
Waveform :
![image](https://github.com/user-attachments/assets/73b52763-6a85-4979-8d04-17f534fc6f61)
Schematic :
![image](https://github.com/user-attachments/assets/3feb6ffb-a9e6-4499-b7e2-b69d165de197)
