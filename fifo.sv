// address generator/counter
module addr_gen 
#(  parameter MAX_DATA=16
) ( input en, clk, rst,
    output reg [3:0] addr
);
    initial addr <= 0;

    // async reset
    // increment address when enabled
    always @(posedge clk or posedge rst)
        if (rst)
            addr <= 0;
        else if (en) begin
            if (addr == MAX_DATA-1)
                addr <= 0;
            else
                addr <= addr + 1;
        end
endmodule