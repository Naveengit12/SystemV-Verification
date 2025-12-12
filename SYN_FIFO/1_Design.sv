`timescale 1ns / 1ps

module sync_fifo #(parameter fifo_depth = 10, data_width = 4)
(
    input  wire clk,
    input  wire rstn,       // active-low reset
    input  wire wt_ena,
    input  wire rd_ena,
    input  wire [data_width-1:0] data_in,
    output reg  [data_width-1:0] data_out,
    output wire full,
    output wire empty
);

localparam addr_width = $clog2(fifo_depth);

reg [data_width-1:0] fifo [0:fifo_depth-1];
reg [addr_width:0] write_pointer;
reg [addr_width:0] read_pointer;

// ------------------------------------------------------
// WRITE POINTER
// ------------------------------------------------------
always @(posedge clk or negedge rstn) begin
    if (!rstn)
        write_pointer <= 0;
    else if (wt_ena && !full) begin
        fifo[write_pointer[addr_width-1:0]] <= data_in;
        write_pointer <= write_pointer + 1;  
    end
end

// ------------------------------------------------------
// READ POINTER
// ------------------------------------------------------
always @(posedge clk or negedge rstn) begin
    if (!rstn)
        read_pointer <= 0;
    else if (rd_ena && !empty) begin
        data_out <= fifo[read_pointer[addr_width-1:0]];
        read_pointer <= read_pointer + 1;   
    end
end

// ------------------------------------------------------
// STATUS FLAGS
// ------------------------------------------------------
assign empty = (read_pointer == write_pointer);
 assign full  = (write_pointer[addr_width] != read_pointer[addr_width]) &&
               (write_pointer[addr_width-1:0] == read_pointer[addr_width-1:0]);
endmodule
