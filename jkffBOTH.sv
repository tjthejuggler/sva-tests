module jkff(clk, j_i, k_i, q_o);
    input clk;
    input j_i;
    input k_i;
    output q_o;

    wire d;
    wire q;

    assign d = ((~q & j_i) | (q & ~k_i)); //bitwise operations

    dff dff0(.clk(clk), .d_i(d), .q_o(q));

    assign q_o = q;

endmodule


module dff(clk, d_i, q_o);
    input clk;
    input d_i;
    output q_o;

    reg q_o;

    always @(posedge clk) 
    begin
        q_o <= d_i;
    end
endmodule

// @lang=sva @ts=2

module jkff_property_suite(clk, j_i, k_i, q_o);

input logic clk;
input logic j_i,k_i;
input logic q_o;
	
 
// sequence definitions
sequence s_jkff;
    j_i == 0 && k_i == 0;
    j_i == 0 && k_i == 1;
    j_i == 1 && k_i == 0;
    j_i == 1 && k_i == 1;


// property definitions
property p_jkff;
    s_jkff;


// make assertion on properties to be checked
assert property (p_jkff);

endmodule

// bind the verification IP to the design

bind jkff jkff0 jkff_property_suite (
    .clk(clk),
    .j_i(j_i),
    .k_i(k_i),
    .q_o(q_o)
);
