`timescale 1ns / 1ps



module RAM(
    input pwrite,
    input clk,
    input [7:0]addr_write,
    input [7:0]addr_read,
    input [6:0]data_write,
    output reg [6:0]data_read);
    
    reg [6:0] memory [0:127] ;
    
    always@(posedge clk) begin
        data_read=memory[addr_read] ;
        if(pwrite)
        memory[addr_write]=data_write ;
     
        
        end
    
endmodule
