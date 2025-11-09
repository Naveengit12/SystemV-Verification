// design code for up/down counter

module up_down_counter (
    input clk,    
    input rstn,    
    input up_down,     
  output reg [2:0] count );

    always @(posedge clk) begin
      if (rstn) begin
            count <= 3'b000; // Reset counter 0
        end
        else begin
          if (up_down) 
                count <= count + 1; // Counting up
            else 
                count <= count - 1; // Counting down
        end
    end

endmodule
