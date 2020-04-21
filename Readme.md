SimpleProcessor
=====
This processor is designed using *Verilog HDL* language in *Quartus* IDE. Also, to make sure it works properly in the hardware (Altera DE1 Development board), *Modelsim* IDE is used to create a testbench ot test code to eliminate any bugs or potential error.

This processor is broken down into 2 sections, which are **Datapath** and **Control Unit**. Datapath is responsible for processing data input from user and generates corrrect output. Control Unit gives commands or directions for datapath to ensure specific operation is executed properly.

IDE and Hardware
---
1.  Quartus IDE
2.  Modelsim IDE
3.  Altera DE1 Development board (FPGA)

Methodology
------
This is the instruction set of the processor. Each instruction is comes with a specific operation which deals with memory address.
![](https://github.com/Bennyaw/SimpleProcessor_Verilog/blob/master/Resources/Pic/Instruction%20set%20of%20processor.png)

Here, state machine is implemented to show how the processor works. Each instruction is a state and before executes them, processor needs to fetch instructions stored in the memory and decode it. 
![](https://github.com/Bennyaw/SimpleProcessor_Verilog/blob/master/Resources/Pic/state%20machine%20of%20processor.png)


