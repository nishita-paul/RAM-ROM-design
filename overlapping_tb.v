//`include "overlapping.v"
module test_seq;
  reg clk,x,reset;
  wire z;
  seq_det SEQ(x,clk,reset,z);
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0,test_seq);
      clk=1'b0;
      reset=1'b1;
      #15 reset=1'b0;
    end
  always #5clk=~clk;
  initial begin
    #12 x=0; #10 x=1; #10 x=1; #10 x=0; #10x=1;
     #10 x=1; #10 x=0; #10 x=1; #10 x=0; #10x=0;
     #10 x=0; #10 x=0; #10 x=0; #10 x=0; #10  x=0;
     #10 x=0; #10 x=1; #10 x=1; #10 x=0; #10x=1;
    #10 $finish;
  end
endmodule