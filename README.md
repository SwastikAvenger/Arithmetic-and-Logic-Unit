The Arithmetic and Logic Unit is a fundamental computing resource in a Central Processing Unit. It carries out __Arithmetic__ and __Logical__ operations. The ALU
is divided into two parts, the Arithmetic Unit and the Logical Unit. Some processors contain more than one Arithmetic Units, for example, one for **Fixed Point** Operations 
and another for **Floating Point** Operations. 
All present day processors have an ALU or equivalent its circuitry in the CPU. This includes the x86 architecture, the ARM and RISC-V architectures. 
GPUs can also contain circuitry to perform arithmetic, but these are more specialized and are often named with a different term. More information can be found [here](https://www.tutorialspoint.com/digital-electronics/arithmetic-logic-unit.htm) .

### Features of the provided design
The provided ALU Design can perform a total of 15 different operations. These are again divided into Arithmetic and Logic funtions.
The entire function list is as follows :
1. Arithmetic Unit
   * Addition
   * Subtraction
   * Multiplication
   * Division
   * Increment
   * Decrement
   * Shift Right
   * Shift Left
2. Logical Unit
   * Logical And
   * Logical Or
   * Logical Not
   * Bitwise Xor
   * Bitwise Nor
   * Bitwise Xnor
   * Logical Buffer

The selection operation is done by a 4 bit select line, which can take upto 16 different states. The input ports are 8 bits wide each and he output port is 16 bit wide. Additionally, a zero flag and a carry flag is also provided in the RTL code which go into a high logic state whenever the output result is zero or the output result has a carry generated respectively. Additionally, an error check is also provided in the division section, to prevent division by zero. 
However, a future scope of this project is to optimize the multiplication algorithm, since it is a well known fact that, using the __*__ operator for multiplication in Verilog can infer a large number of LUT-RAM and make synthesis a long process. The Multiplication algorithm will be updated accordingly. We can use either Booth Algorithm or the DSP slices (for Synthesis and Implementation) for the multiplication logic.

This rtl code is free to use as a reference. Once can use this code as a reference to build their own Arithmetic and Logical Unit and expand their knowledge base.
