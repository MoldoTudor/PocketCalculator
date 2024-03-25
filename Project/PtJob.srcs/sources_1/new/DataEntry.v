`timescale 1ns / 1ps




module DataEntry(
    input [6:0] Keyboard ,
    input [6:0] Memory ,
    input selData ,
    input clk ,
    input reset ,
    input selDirection ,
    output reg [6:0] data0 ,
    output reg [6:0] data1 ,
    output reg equal);
    
    reg [6:0] Data ;
    reg [6:0] Reg ;
    reg write_enable;    
    always@(*) 
        case(selData)
        0: Data<=Keyboard ;
        1: Data<=Memory ;
        default Data<=6'b0;
        endcase
      
      always@(posedge clk)  
        case(selDirection)
        0: begin 
           Reg <=Data;
           write_enable<=1 ;
           end
        1: begin
           Data<=Data;
           data1<=Data;
           equal<=1;
           
           end 
        default:begin
               Reg<=7'bz ;
               data1<=7'bz ;
               end 
               
         endcase
         
         always@(posedge clk)
         if(reset==1) begin
            data0<=0;
            data1<=0;
            equal<=0;
            write_enable<=0;
            equal<=0;
            end
         else
            if(write_enable==1) begin
            data0<=Reg;
            write_enable<=0; end
            else
            data0<=data0; 
        
        always@(posedge clk)
            if(equal)
            equal<=0;      
    
endmodule
