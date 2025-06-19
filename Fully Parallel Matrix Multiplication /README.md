# Standard (Naive) Multiplication
The standard (naive) matrix multiplication method involves directly applying the definition of matrix multiplication. For each element in the resulting matrix, you compute the dot product of the corresponding row from the first matrix and the column from the second matrix. This method is straightforward and easy to understand, making it ideal for implementing fixed-size matrix operations like 2×2 or 3×3 matrices. While it may not be the most efficient for large matrices, it is perfectly suitable for small matrices in hardware design and is often used as the base model for comparison.

# Nested Loop Implementation 
In the nested loop approach, matrix multiplication is implemented using for loops that iterate over the rows and columns of the matrices. Typically, three nested loops are used: the outer two loop through the result matrix elements, and the innermost loop accumulates the product of corresponding elements. This method is scalable for NxN matrix sizes and is a common choice in software, but in Verilog, it is used carefully in combination with clocked logic and finite state machines (FSM) to avoid synthesis issues. The nested loop version is well-suited for sequential operation in resource-constrained environments.

# Standard Equation Implementation 
In the standard equation method, each element of the result matrix is computed explicitly using a direct mathematical expression. This is practical and highly efficient when dealing with small fixed-size matrices like 2×2, where all indices are known in advance. For instance, the element C00 is assigned as C00 = A00 * B00 + A01 * B10. This method allows for a fully combinational circuit and can be executed in parallel, leading to faster performance. It is the preferred approach for implementing small matrix multiplication in Verilog due to its simplicity and parallelism.

This Verilog project consists of a module matrix1 that performs standard 2×2 matrix multiplication using the equation-based method. It takes two input matrices, A and B, where each element is 4 bits wide, and computes the output matrix C, with each element being 8 bits wide to hold the result of the summed products. Intermediate wires (M000 to M111) are used to store all the partial products. Each output element of matrix C (C00, C01, C10, C11) is computed by summing two appropriate partial products, corresponding to the dot product of rows from matrix A and columns from matrix B.

To verify this module, the matrix1_tb testbench is used. It defines the same inputs and outputs as the matrix1 module, instantiates the module as a Device Under Test (DUT), and provides sample data through an initial block. In this test, Matrix A is set to |1 2|; |3 4| and Matrix B to |5 6|; |7 8|. The testbench waits for 10 time units to allow the combinational logic to evaluate, then prints the input matrices and the computed output matrix C. The expected output matrix is |19 22|; |43 50|, which confirms correct multiplication. This testbench helps validate the design in simulation.

# Results :
Waveform :
![image](https://github.com/user-attachments/assets/73b52763-6a85-4979-8d04-17f534fc6f61)
Schematic :
![image](https://github.com/user-attachments/assets/3feb6ffb-a9e6-4499-b7e2-b69d165de197)
