module hello(input clk, input rst, output [3:0] cnt); 
reg [3:0] cnt = 0;
always @(posedge clk) begin 
    if (rst) 
        cnt <= 0; 
    else 
        cnt <= cnt + 1; 
end 

`ifdef FORMAL
    assume property (cnt != 10);
    assert property (cnt != 15);
`endif
endmodule