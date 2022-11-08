`ifndef VERILATOR
module testbench;
  reg [4095:0] vcdfile;
  reg clock;
`else
module testbench(input clock, output reg genclock);
  initial genclock = 1;
`endif
  reg genclock = 1;
  reg [31:0] cycle = 0;
  wire [0:0] PI_clk = clock;
  reg [0:0] PI_rst;
  hello UUT (
    .clk(PI_clk),
    .rst(PI_rst)
  );
`ifndef VERILATOR
  initial begin
    if ($value$plusargs("vcd=%s", vcdfile)) begin
      $dumpfile(vcdfile);
      $dumpvars(0, testbench);
    end
    #5 clock = 0;
    while (genclock) begin
      #5 clock = 0;
      #5 clock = 1;
    end
  end
`endif
  initial begin
`ifndef VERILATOR
    #1;
`endif
    UUT.cnt = 11'b11111111110;

    // state 0
    PI_rst = 1'b1;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_rst <= 1'b0;
    end

    // state 2
    if (cycle == 1) begin
      PI_rst <= 1'b0;
    end

    // state 3
    if (cycle == 2) begin
      PI_rst <= 1'b0;
    end

    // state 4
    if (cycle == 3) begin
      PI_rst <= 1'b0;
    end

    // state 5
    if (cycle == 4) begin
      PI_rst <= 1'b0;
    end

    // state 6
    if (cycle == 5) begin
      PI_rst <= 1'b0;
    end

    // state 7
    if (cycle == 6) begin
      PI_rst <= 1'b0;
    end

    // state 8
    if (cycle == 7) begin
      PI_rst <= 1'b0;
    end

    // state 9
    if (cycle == 8) begin
      PI_rst <= 1'b0;
    end

    // state 10
    if (cycle == 9) begin
      PI_rst <= 1'b0;
    end

    genclock <= cycle < 10;
    cycle <= cycle + 1;
  end
endmodule
