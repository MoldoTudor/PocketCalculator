`timescale 1ns / 1ps



module TOP(input clk,
           input reset,
           input equal,
           input [7:0]addr_read,
           input [6:0] Keyboard ,
           input selData ,
           input selDirection,
           input [1:0]op,
           output [13:0]out);
           
           wire [6:0] wire_memory ;
           wire pwrite1;
           wire [7:0]addr1 ;
           
           TOP_Mic topul(.Keyboard(Keyboard),
                         .Memory(wire_memory),
                         .clk(clk),
                         .equal(equal),
                         .reset(reset),
                         .selData(selData),
                         .selDirection(selDirection),
                         .op(op),
                         .out(out),
                         .pwrite(pwrite1),
                         .addr(addr1));
                         
           RAM rami(.clk(clk),
                    .pwrite(pwrite1),
                    .addr_write(addr1),
                    .addr_read(addr_read),
                    .data_write(out),
                    .data_read(wire_memory));
                                  
endmodule
