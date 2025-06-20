# Loop-Based FSM Matrix Multiplication
The loop-based FSM matrix multiplication approach performs 2×2 matrix multiplication by sequentially executing operations across multiple clock cycles using a finite state machine (FSM). Unlike a fully parallel architecture, which allocates separate hardware units for each computation path, this method reuses limited resources—specifically two multipliers and one adder—to carry out the entire multiplication process. This significantly reduces hardware area and power consumption, making it suitable for low-resource environments such as microcontrollers, embedded FPGAs, and ASIC designs targeting power-sensitive applications.

In this design, each element of the result matrix is computed over two major FSM stages: one for multiplying the necessary operands and another for accumulating their sum. For example, to compute C00, the FSM first calculates A00×B00 and A01×B10 using two parallel multipliers, then feeds the results into a single adder to produce the final value. This process repeats for the other output elements—C01, C10, and C11—over dedicated FSM states. The architecture ensures proper sequencing of operations by storing intermediate values in temporary registers and progressing through states only after required calculations are completed, ensuring correctness with minimal hardware overhead.

To validate this FSM-based matrix multiplier, a Verilog testbench named matrix_loop_tb is used. The testbench initializes the inputs with predefined 2×2 matrices (e.g., A = [[1, 2], [3, 4]], B = [[5, 6], [7, 8]]) and pulses a start signal to trigger the computation. It then waits for the done flag from the FSM, which indicates the completion of all matrix element computations. The outputs are then compared to the expected result matrix [[19, 22], [43, 50]]. This verification process confirms that the FSM-controlled sequencing and reuse of multipliers and adder produce accurate results, making the design reliable and efficient for sequential hardware implementation.

#Results:

Waveform
![image](https://github.com/user-attachments/assets/3320f6fa-37e5-4ea7-abe5-b0e57ed4d0ea)

Schematic:
![image](https://github.com/user-attachments/assets/31a11fd3-9c62-4ee5-afb7-c8b42ec2356a)
