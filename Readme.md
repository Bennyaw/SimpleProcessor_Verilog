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

To have a clearer view on the processor architecture, the circuit below shows the I/O of both control unit and datapath.
![](https://github.com/Bennyaw/SimpleProcessor_Verilog/blob/master/Resources/Pic/circuit%20of%20processor.png)

For specific instruction, control unit need to send sepecific signal/data bits on the data line to datapath or receive data from datapath. Therefore a control unit truth table is needed to implement the code. Our verilog code will be depending on this truth table.

![](https://github.com/Bennyaw/SimpleProcessor_Verilog/blob/master/Resources/Pic/control%20unit%20truth%20table%20.png)

We have truth table for control unit to implement the I/O signal of the control unit. Now, take a look at the datapath circuit, datapath will be more complex than control unit. Before implementing the code, we need to justify what is the components we need to use, for this datapath, we need 1 memory, 3 registers, 3 multiplexers and 2 adders. Then, we have a clearer picture of the codings.

![](https://github.com/Bennyaw/SimpleProcessor_Verilog/blob/master/Resources/Pic/Datapath%20of%20processor.png).

Results
----
This processor will be finding *Greatest Common Decimal* of the 2 input numbers. This is the result of the testbench in modelsim below, the testbench verilog file has a *_tb* to indicates that is the testbench file.

![](https://github.com/Bennyaw/SimpleProcessor_Verilog/blob/master/Resources/Pic/GCD.PNG)



