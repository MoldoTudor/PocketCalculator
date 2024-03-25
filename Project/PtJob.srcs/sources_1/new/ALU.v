`timescale 1ns / 1ps



module ALU(
    input [6:0] data0 ,
    input equal ,
    input clk ,
    input reset ,
    input [6:0] data1 ,
    input [1:0] op ,
    output reg [13:0] out ,
    output reg [7:0] addr ,
    output reg pwrite);
    
     
    
    always@(posedge clk)
       if(reset==1) begin
          out<=0;
          addr<=0; 
          pwrite<=0; end
        else
            if(equal) begin
                case(op)
                0:begin
                out<=data0+data1;
                pwrite<=1 ;
                end  
                1:begin
                out<=data0-data1;
                pwrite<=1;
                end
                2:begin
                out<=data0*data1;
                pwrite<=1;
                end
                3:begin
                out<=data0/data1;
                pwrite<=1;
                end
                default:begin
                        out<=0 ;
                        pwrite<=0;
                        end
                endcase
                end
            else      
                if(pwrite) begin
                    pwrite<=0;
                    addr<=addr+1;
                    end 

             
        
        
    
endmodule
