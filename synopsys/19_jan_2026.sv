// Q. Discussion about previous experience as a Verification IP Intern.
//    AMBA AXI Protocol Explanation.
//
// Q. What is protocol? What is the requirement?
//
// Q. How is USB protocol different from HDMI and Ethernet?
//
// Q. What is the meaning of Verification, IP and Verification IP?
//
// Q. How does a user use a verification IP provided by the company? 
//    Follow up: Is the design code accessible by the user?
//   
// Q. What was your contriution to the VIP team?
//    Follow up: What tools did you use?
//
// Q. Write a D-FF with synchronous and asynchronous reset in verilog.
//    Follow up: Why is output declared as reg and not a wire?
//
// Q. Draw an inverter using CMOS.
//
// Q. A ring oscillator with three flip-flops, the propogation delay for
//    each inverter is 2ps. 
//
//    a) Draw the CMOS diagram of the circuit.
//    b) Find the maximum operatable frequency of the circuit? 
//
// Q. Design an adder in verilog. 
//    Follow up: - If operand 1 has width of x bits and operand 2 has width 
//                 of y bits. What is the minimum number of bits required 
//                 to represent the sum? (x, y != 0, they may be equal)
//
//               - Minimum number of bits required to represent the product?
//
//               - Add a clock, enable and operation signal the ALU such that 
//                 output = sum if op = 0 and output = product if op = 1.
//
// Q. Write a transaction class in SV for testing the ALU.
//    Follow up: - Write a constraint such that operand 1 > 5 and operand_2 < 10.
//              
//               - Write a constraint such that the probability of op = 0 is 
//                 0.2 and being 1 = 0.8 if enable is 1. 
//
//               - What changes should be made to the transaction class to
//                 make it usable in a testbench?
//
//               - Why is the output mentioned in the transaction class?
//
//               - Why is rand keyword not used with the output?
//
// Q. Brief discussion about my testing project with AXI Protocol and Verification Flows
//    in a Verification team.
//
// Q. Discussion about the industry training and projects.
//
// Q. Design a circuit using only 2x1 MUX for a.b'.c + a.b.c'
//
// Q. Write a constraint on 3 variables pre/main/post such that post = 0, 
//    main = 16 and pre + main + post = 48
//
// Q. Code Block Problem 
//  
//    fork 
//        for (int i = 0; i < 10; i++) begin
//            #i;
//            $display("Time: %g, value = ", $time, i);
//        end
//    join
//    
//    What is the expected output of this program? 
//    Follow up: - Tweak this code with join_any, join_none
//      
//               - Put the fork inside the for loop instead of outside,
//                 with join, join_none and join_any.
//
//               - Expected outputs of all these cases. 
