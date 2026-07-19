# Synchronous Traffic Light Controller FSM

A fully synthesizable, highly reliable Traffic Light Controller IP Core modeled in Verilog HDL. This design utilizes a clean, synchronous Finite State Machine (FSM) architecture to manage multi-way intersection signaling, optimized with accurate internal timing delays and safety-critical state transition constraints.

## Key Technical Features
* **Robust FSM Architecture:** Modeled using a structured, industry-standard 3-process or 2-process FSM style (Separate Sequential and Combinational logic blocks) ensuring zero glitch generation on output signals.
* * **Programmable/Fixed State Timers:** Integrated hardware counters to precisely manage individual timing cycles for `GREEN`, `YELLOW`, and `RED` light intervals dynamically or via parameters.
* * **Deterministic State Encoding:** Utilizes clean binary or One-Hot state encoding methodologies to minimize combinational logic width, optimize setup/hold timing paths, and prevent illegal state conditions.
* * **Synchronous Reset & Enable:** Designed with a reliable system reset path to immediately force the controller into a safe fallback state (e.g., All-Red or Flashing Yellow) during initialization or system faults.
* * **Sensor & Override Integration:** Flexible control structure capable of sampling external pedestrian walk requests or priority emergency vehicle sensor overrides.
       
* ## Core Modules & Design Blocks
* * **Main Controller FSM:** The core state machine evaluating current conditions and driving next-state transition logic.
* * **Frequency Divider / Time Base:** Scales down the system clock to generate predictable, precise 1-second delay pulses for the timing counters.
* * **Timer Counter Unit:** Tracks the elapsed seconds in the current state against the preconfigured light duration parameters.
             
* ## Simulation & Verification
* * **HDL Language:** Verilog HDL
* * **Simulation Tool:** ModelSim SE
    * * **Testbench Methodology:** Exhaustive behavioral testbench simulating multiple complete junction cycles, validation of exact light transition intervals, and strict corner-case verification checking correct response behavior during emergency reset assertion.
                    * 
