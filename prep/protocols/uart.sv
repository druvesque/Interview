// Q. What is UART?
//   
//    - Universal Asynchronous Receiver Transmitter, it is a hardware
//      communication protocol used to send data serially (1 bit at 
//      a time) between two devices.
//
//    - There is no shared clock between sender and receiver.
//
//    - UART sends data in a frame, data-frame:
//
//      
//      Idle | Start Bit |         Data Bits       | Parity Bit | Stop Bit
//        1  |     0     | D0 D1 D2 D3 D4 D5 D6 D7 |     P0     |    1 
//
// Q. What is Baud Rate? Explain baud rate generator for both TX & RX?
//   
//    - Differnt Baud Rates: 2400, 9600, 19200, 38400, 115200
//
//    - Number of bits transmitted per second
//
//    - Let's say that the baud rate is 115200 baud (bits per second).
//      That means that the UART needs to hold 1 bit for 8.68 microseconds
//      at the TX Line. 
//
//    - Let's say that our system clock is 50 MHz that's 20ns and it's too
//      fast for the UART.
//
//    - Baud Rate Generator divides system clock and produces a slower 'baud tick'
//      1 baud tick = 1 bit time
//
//    - Divider = System Clock / Baud Rate (For Transmitter)
//      In this case, divider = 50,000,000 / 115200 = 434 (approx.)
//
//    - Count from 0 - 433, generate enable pulse, that pulse tells the UART,
//      "send next bit now"
//
//    - if (counter == DIVIDER - 1) 
//          baud_tick = 1;
//      else
//          baud_tick = 0;
//
//    - RX shares the same system clock source, but TX uses baud rate divider
//      while RX uses a faster oversampling divider, typically 16x the baud rate.
//
//    - DIVIDER = System Clock / (Baud Rate * Oversampling Rate)
//
//    - Similar to TX, there is counter that counts from 0 to DIVIDER - 1 and
//      samples at DIVIDER / 2.
//
// Q. Why do you still need synchronizer if using single clock?
//    
//    - Even though UART design uses a single internal clock, the RX input
//      comes from an external asynchronous source, so it can violate setup and
//      hold times and cause metastability. Therefore a synchronizer is still
//      required.
//
// Q. Explain your project.
//   
//    - I worked on designing and verifying a UART module to understand
//      asynchronous serial communication at RTL Level. The goal was to
//      implement a configurable transmitter and receiver supporting different
//      baud rates and frame formats.
