//
// Module UART_V.uart_tb.struct
//
// Created:
//          by - user.group (host.domain)
//          at - 10:56:07 30 Aug 2001
//
// Generated by Mentor Graphics' HDL Designer(TM) 2001.5
//

`resetall
`timescale 1ns/10ps
module uart_tb;


// Internal Declarations



// Local declarations


   
// Internal signal declarations
wire [2:0] addr;// 3-bit address bus
wire       clk;// 10 MHz clock
wire       cs;// chip select
wire [7:0] data_in;// 8-bit data in bus from cpu
wire [7:0] data_out;// 8-bit data out bus to cpu
wire       int;// interrupt(1)
wire       nrw;// read(0), write(1)
wire       rst;// reset(0)
wire       sin;// serial input
wire       sout;// serial output


// Instances 
tester I0( 
   .data_out (data_out), 
   .int      (int), 
   .sout     (sout), 
   .addr     (addr), 
   .clk      (clk), 
   .cs       (cs), 
   .data_in  (data_in), 
   .nrw      (nrw), 
   .rst      (rst), 
   .sin      (sin)
); 

uart_top I1( 
   .addr     (addr), 
   .clk      (clk), 
   .cs       (cs), 
   .data_in  (data_in), 
   .nrw      (nrw), 
   .rst      (rst), 
   .sin      (sin), 
   .data_out (data_out), 
   .int      (int), 
   .sout     (sout)
); 

// ModuleWare instances.

endmodule // uart_tb

