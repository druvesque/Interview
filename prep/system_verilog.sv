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
//
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
//
//       localparam is used for fixed constants that cannot be overriden and
//       are meant to remain local to the module.
//
//       localparam is not allowed in module parameter port lists, only
//       parameter is allowed for module parameterization. 
//
//     * const is used to make a variable read-only after initialization
//
//
// Q10. Are for-loops synthesizable? 
//      always_comb begin
//          for (int i = 0; i < 8; i++)
//              y[i] = a[i] & b[i];
//      end
//
//      - For-loops in RTL are synthesizable if the iteration bounds are
//        static and known at compile time, because synthesis tools unroll them
//        into parallel hardware.
//
//      * Simulation checks if the code can execute logically.
//        Synthesis checks if the code can be converted into hardware.
//      * Inter-statement delays are not-synthesizable.
//
// Q11. Difference b/w case, unique case and priority case?
//
//      - 'case':- a normal case statement makes no assumption about
//                 exclusivity and typically synthesizes to multiplexer logic.
//
//        'priority case':- enforces ordered evaluation where the first
//                          matching condition wins and is used in applications like priority
//                          encoders, arbitration logic and interrupt controllers.
//
//        'unique case':- assumes that exactly one condition will be true at
//                        a time, which allows better optimization and enables runtime
//                        checking, so it is commonly used in FSM designs where states are
//                        mutually exclusive. 
//
//     * 'default' case is important in combinational logic to ensure all
//       input combinations are covered and to prevent unintended latch
//       inference.
//
// Q12. What is the difference between functions and tasks?
// 
//      - 'function':- used for zero-time computations and return a single
//        value, which makes them suitable for synthesizable combinational logic
//        such as arithmetic and data processing. functions cannot control
//        timing controls like delays and event waits. function does not have an
//        output or inout port. By default, functions are automatic and create
//        separate storage for each cell. 
//
//        'task':- are used for procedural opeartions and can include timing
//        controls and multiple output and inout arguments, so they are
//        commonly used in testbenches and protocol modelling. Tasks are by
//        default static unless declared automatic. 
//
// Q13. Where are delays added to the components?
//     
//      - Setup and hold timing checks cannot be verified at RTL because RTL
//        does not include physical delays. These checks are performed using
//        static timing analysis or gate-level simulation with back-annotated
//        delays.
//
// Q14. What is an assertion?
//
//      - An assertion is a statement that checks whether a design behaviour
//        satisfies a specified condition and reports an error if it is
//        violated. A condition that must always be true during simulation.
//
//        They continuously check design rules during simulation and flag
//        errors automatically.
//
//        Assertions do not stop the simulation. They only report an error or
//        warning. Simulation stops only if you use system tasks like $fatal
//        inside the assertion action.
//
// Q15. Difference between immediate and concurrent assertions?
//
//      - 'immediate':- check a condition at the exact point where the
//                      statement executes. They behave like an if check.
//                      
//        Example: always_comb begin
//                     assert (a != b)
//                       else $error("a and b should not be equal");
//                 end
//
//        'concurrent':- check relationships across time, usually synchronized
//                       to a clock. They are used for protocol and timing
//                       verification.
//
//        Example: assert property (@(posedge clk) req |-> ack);
//                 on every posedge of clk, if req is high, then ack should be
//                 high.
//
//        * Immediate assertions check conditions at the current simulation
//          time, while concurrent assertions monitor signal relationship across
//          clock cycles.
//
// Q16. What is the difference between |-> and |=> operator? 
//    
//      - A |-> B means when A becomes true, B must be true in the next clock
//        cycle, whereas A |=> B means when A becomes true, B must be true in
//        the same clock cycle. The difference is in when the consequence is
//        checked.
//
// Q17. What is the purpose of using disable iff in an assertion? 
//     
//      - disable iff is used to temporarily turn off assertions during reset
//        or invalid operating conditions as during reset, signals are
//        unstable and assertions may falsely fail.
//
//        Example: assert property (@(posedge clk) disable iff (!rst_n)
//                                  req |-> ack);
//
//      * The property block defines the assertion condition and timing
//        relationship, while the action block (else) specifies what to do when
//        the assertion fails, such as printing an error message.
//
//
