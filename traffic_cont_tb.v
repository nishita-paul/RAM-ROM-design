// Code your testbench here
// or browse Examples
module test_cyclic_lamp;
  reg clk;
  wire [0:2] light;
  cyclic_lamp lamp(clk,light);
  always #5 clk=~clk;
  initial begin
    clk=1'b0;
    #100 $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars (0,test_cyclic_lamp);
    $monitor ($time,"RGY: %b",light);
  end
endmodule

