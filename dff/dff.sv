module dff(clk, d_i, q_o);
    input clk;
    input d_i;
    output q_o;

    reg q_o;
    //maybe removing posedge will pass, 
    //or maybe always @(posedge clk or negedge clk) 
    always @(posedge clk) 
    begin
        q_o <= d_i;
    end

    
endmodule