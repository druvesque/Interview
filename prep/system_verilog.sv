// Q1. What is the use of scope resolution operator?
//
//    - The scope resolution operator in SystemVerilog is denoted by '::'
//      symbol. The basic purpose of this operator is to specify the scope in
//      which an identifier is defined or should be searched for. 
//
// Q2. What is the difference b/w always block and always_ff, always_comb & always_latch in SV
//     
//     - 'always' is a traditional Verilog procedural block where the
//        sensitivity list must be manually specified.
//     - 'always_comb' is used for combinational logic - the simulator
//        automatically adds all RHS signals to the sensitivity list and
//        ensures no latches are inferred. 
//     - 'always_ff' is used for sequential logic - it enforces that only
//        clocked logic with non-blocking assignments is written and allows only
//        one driver for a signal.
//     - 'always_latch' is used to explicitly model level-sensitive latches.
//
//     * Most tools report warnings, but the semantic intent is to prevent
//       latch inference.
//
// Q3. Why are reg/variables used inside an always block and not net/wire?
//
//     - Signals assigned inside an always block must be variables, not nets,
//       because procedural assignments require storage. Nets like wire are
//       driven by continuous assignments, not procedural blocks. 
//
// Q4. Why are blocking assignments used for combinational circuits and
//     non-blocking assignments used for modelling sequential circuits?
//
//     - Blocking assignments model combinational signal flow, while
//       non-blocking assignments model simultaneous flip-flop updates at clock
//       edges. 
//
// Q5. What is a race condition in RTL simulation and how do non-blocking
//     assignments help prevent it?
//
//     - Race conditions occur due to blocking assignments in parallel always
//       blocks, and non-blocking assignments avoid them by scheduling
//       simultaneious updates.
//
// Q6. Which is preferred synchronous reset or asynchronous reset and why? (REDO)
//
//     - Asynchronous reset acts immediately and uses the reset pin of the
//       flip-flop, while synchronous reset is applied on the clock edge using
//       logic. Synchronous reset is generally preferred becuase it avoids
//       metastability issues during reset release and simplifies timing
//       analysis. 
//
// Q7. logic [7:0] a vs logic a [7:0], packed & unpacked arrays?
//  
//     - logic [7:0] a is a packed array, which represents a single 8-bit
//       vector stored as contiguous bits. It behaves like a number and supports
//       arithmetic and bitwise operations.
//     - logic a [7:0] is an unpacked array, which represents an array of
//       8 separate 1-bit elements. It is treated as an array of variables and
//       is typically used for memories or collections of signals.
//
// Q8. Difference b/w logic [3:0][7:0] x & logic [7:0] x [3:0]? 
//
//     - logic [7:0] x [3:0] :- unpacked array of 4 elements, where each
//                              element is an 8-bit packed vector.
//       logic [3:0][7:0] x  :- two-dimensional packed array, meaning it is
//                              treated as one packed 32-bit vector 
//                              organized as 4 groups of 8 bits.
//
//
//     * logic [3:0][7:0] x & logic [31:0] y, both represent 32 packed bits,
//       but multi-dimensional packed arrays provied structured indexing while
//       single packed vectors are flat.
//
// Q9. Difference between localparam and parameter?
//
//     - parameter is used for configurable constants that can be overridden
//       during module instantiation.
//       localparam is used for fixed constants that cannot be overriden and
//       are meant to remain local to the module.
//       localparam is not allowed in module parameter port lists, only
//       parameter is allowed for module parameterization. 
//
//     * const is used to make a variable read-only after initialization
//
