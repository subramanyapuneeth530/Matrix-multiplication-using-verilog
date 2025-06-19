# Matrix-multiplication-using-verilog


## Overview

This project implements **matrix multiplication** module using Verilog. It takes various approaches to solve matrix multiplication with each of it's pro's and con's explained. 

## What is Matrix Multiplication?

Matrix multiplication is a fundamental operation in linear algebra that combines two matrices to produce a third matrix. Unlike simple multiplication of individual numbers, matrix multiplication involves performing dot products between rows of the first matrix and columns of the second matrix. It’s widely used in areas like computer graphics, physics simulations, machine learning, and control systems.

For matrix multiplication to be valid, the number of columns in the first matrix must be equal to the number of rows in the second matrix. For example, if the first matrix (Matrix A) is of size 2×2 and the second matrix (Matrix B) is also 2×2, then their product can be computed. The resulting matrix (Matrix C) will also be of size 2×2.

Let us consider two 2×2 matrices:
```math
A=\begin{bmatrix}A00 \ A01 \\ A10 \ A11\end{bmatrix}
```
and 
```math
B=\begin{bmatrix}B00 \ B01 \\ B10 \ B11\end{bmatrix}
```
let the resultant matrix be 
```math
C=\begin{bmatrix}C00 \ C01 \\ C10 \ C11\end{bmatrix}
```

By following the matrix multiplication rule, Each element of the C matrix can be written as a equation 


C00 = A00 × B00 + A01 × B10

C01 = A00 × B01 + A01 × B11

C10 = A10 × B00 + A11 × B10

C11 = A10 × B01 + A11 × B11

These equations come from taking the dot product of each row of matrix A with each column of matrix B.

1.Standard (Naive) Multiplication: Multiply rows of A with columns of B using nested loops or separate equations.

2.Parallel Multiplication: Compute all matrix elements simultaneously using multiple multipliers and adders.

3.Pipelined Multiplication: Break multiplication into stages with registers between them to increase throughput.

4.FSM-Based Sequential Multiplication: Use a finite state machine to control step-by-step calculation of each matrix element over time.
