module hello(input clk, input d_i, output q_o); 
reg q_o;
always @(posedge clk) begin 
    q_o <= d_i;
end 

`ifdef FORMAL
    always @(posedge clk) begin
        // define properties 



        // tell the tool what properties to check

        assert property (q_o == $past(d_i));
        //assert property (q_o == $past(d_i, 2));
    end

`endif
// `ifdef FORMAL
//     always @(posedge clk) begin
//         if (busy) begin
//             assume (!start);
//             assume ($stable(n));
//         end

//         if (done) begin
//             case ($past(n))
//                 0: assert (q_o == d_i);
//             endcase
//             // assert property (q_o == $past(d_i));
//             // assert property (q_o == $past(d_i, 2));
//         end
//     end

// `endif
endmodule