`timescale 1ns / 1ps



module test_bench1();

    reg [6:0] Keyboard ;
    reg [7:0]addr_read ;
    reg clk ;
    reg reset ;
    reg selData ;
    reg selDirection ;
    reg [1:0] op ;
    wire [13:0]out  ;


       TOP topiu(.clk(clk),
                 .equal(equal),
                 .Keyboard(Keyboard),
                 .reset(reset),
                 .selData(selData),
                 .selDirection(selDirection),
                 .op(op),
                 .addr_read(addr_read),
                 .out(out));
                 

initial begin
clk=0;
forever 
#5 clk=~clk ;

end 

initial begin

reset=1;
Keyboard=10;
addr_read=0;
selData=0;
selDirection=0;
op=0;




#20 reset = 0 ;

    

#10 selDirection=1;
    Keyboard=20;


#10 selData=0;
    Keyboard=33;
    selDirection=0;
    
#30 selData=1;
    selDirection=1;
    op=1;
   
          

#50 $stop ;

end 
endmodule
