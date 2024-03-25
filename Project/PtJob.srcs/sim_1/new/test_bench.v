`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 04:57:21 AM
// Design Name: 
// Module Name: test_bench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_bench();

    reg [6:0] Keyboard ;
    reg [6:0] Memory ;
    reg clk ;
    reg reset ;
    reg selData ;
    reg selDirection ;
    reg write_enable ;
    reg [1:0] op ;
    wire [13:0]out  ;

    TOP_Mic topi(.clk(clk),
                 .Keyboard(Keyboard),
                 .Memory(Memory),
                 .reset(reset),
                 .selData(selData),
                 .selDirection(selDirection),
                 .write_enable(write_enable),
                 .op(op),
                 .out(out));
                 

initial begin
clk=0;
forever 
#5 clk=~clk ;

end 

initial begin

reset=1;
Keyboard=10;
Memory=20;
selData=0;
selDirection=0;
write_enable=1;
op=0;



#7 reset = 0 ;

#10 write_enable=0 ;

#10 selDirection=1;
    Keyboard=20;
    

#100 $stop ;

end 
endmodule
