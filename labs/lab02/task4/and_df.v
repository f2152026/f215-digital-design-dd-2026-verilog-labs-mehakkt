// and_df.v
// AND gate using dataflow modeling with a 5-unit delay.

module and_df (
  input  a,
  input  b,
  output y
);

  assign #3 y = a & b;

endmodule