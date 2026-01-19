// Q. FIFO Project Explanation.
//
//    - I developed both synchronous and asynchronous FIFOs and verified them
//      using directed test cases. In synchronous FIFO, I used binary read and
//      write pointers with wrap-around logic to generate full and empty
//      flags. 
//
//    - In Asynchronous FIFO, since read and write clocks are different,
//      I used Gray-coded pointers and two-flop synchronizer to safely transfer
//      pointer information across clock domains and avoid metastability.
//
//    - For verification, I tested basic read-write functionality, full and
//      empty boundary conditions, simultaneous read-write operations,
//      pointer-wrap around, reset behaviour, and for async FIFO I validated
//      different clock frequencies and flag stability using reference data
//      comparison.
//
// Q. Explain FIFO and what different types of FIFOs are there?
//
//    - FIFO is a buffer that stores data such that the first data written
//      is the first data read.
//
//    - Synchronous FIFO
//      Same clock for read and write.
