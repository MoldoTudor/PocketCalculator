`timescale 1ns / 1ps



module Dati();



    reg [6:0] Keyboard ;
    reg [6:0] Memory ;
    reg clk ;
    reg reset ;
    reg selData ;
    reg selDirection ; 
    reg write_enable ;
    wire [6:0]data1  ;
    wire [6:0]data0 ;
    wire equal ;

    DataEntry Date(.clk(clk),
                 .Keyboard(Keyboard),
                 .Memory(Memory),
                 .reset(reset),
                 .selData(selData),
                 .selDirection(selDirection),
                 .write_enable(write_enable),
                 .data1(data1),
                 .data0(data0),
                 .equal(equal));
                 

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




#7 reset = 0 ;

#10 write_enable=0 ;

#10 selDirection=1;
    Keyboard=20;
    

#100 $stop ;

end

endmodule 
