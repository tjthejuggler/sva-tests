module hello(input clk, input d_i, output q_o); 
reg q_o;
always @(posedge clk) begin 
    q_o <= d_i;
end 

`ifdef FORMAL
    always @(posedge clk) begin
        if (!$initstate) begin
            assert property (q_o == $past(d_i));
            assert property (q_o == $past(d_i, 1));
        end        
    end
`endif
endmodule