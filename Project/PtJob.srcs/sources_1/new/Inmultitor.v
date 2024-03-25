`timescale 1ns / 1ps



module Inmultitor(
    input ck ,
    input [0:3]a ,
    input [0:3]b ,
    input reset ,
    output reg [0:3]cat,
    output  reg [0:4]rezultat );
    
    always @ (posedge ck ) begin
    if (reset==1) begin
        cat=0;
        rezultat=0;
                 end
    else
        if(cat < b ) begin
        rezultat=rezultat + a;   
        cat = cat+1 ;
        end 
        end          
        
        
endmodule
