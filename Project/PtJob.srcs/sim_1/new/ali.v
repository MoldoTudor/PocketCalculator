`timescale 1ns / 1ps



module ali();
    reg [6:0] data0 ;
    reg equal ;
    reg clk ;
    reg reset ;
    reg [6:0] data1 ;
    reg [1:0] op ;
    wire [13:0] out ;
    wire [7:0] add ;
    wire pwrite ;
    
    ALU ai(.op(op),
           .clk(clk),
           .reset(reset),
           .data0(data0),
           .data1(data1),
           .equal(equal),
           .out(out),
           .addr(add),
           .pwrite(pwrite)) ; 
    
    initial begin
    clk=0;
    forever
    #5 clk=~clk;
    end
    
    initial begin
    data0=10;
    data1=20;
    reset=1;
    equal=0;
    op=0;
    
    #10 reset = 0 ;
    #10 equal=1 ;
    #10 equal=0;
    
    end
endmodule
