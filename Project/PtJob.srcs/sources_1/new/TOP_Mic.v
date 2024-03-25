`timescale 1ns / 1ps



module TOP_Mic(
    input [6:0] Keyboard ,
    input [6:0] Memory ,
    input clk ,
    input equal ,
    input reset ,
    input selData ,
    input selDirection ,
    input [1:0] op ,
    output [13:0]out ,
    output [7:0] addr,
    output pwrite ); 
    
    wire [6:0] Data_1 ;
    wire [6:0] Data_0 ;
    wire equal1;
    
    DataEntry dat(.clk(clk),
                  .reset(reset),
                  .Keyboard(Keyboard),
                  .Memory(Memory),
                  .selData(selData),
                  .selDirection(selDirection),
                  .data0(Data_0),
                  .data1(Data_1),
                  .equal(equal1));
                  
     ALU al (.op(op),
             .clk(clk),
             .reset(reset),
             .data0(Data_0),
             .data1(Data_1),
             .equal(equal1),
             .out(out),
             .addr(addr),
             .pwrite(pwrite)) ;             
endmodule
