// and_beh_intra.v
// AND gate using behavioral modeling.
// Intra-assignment delay: RHS is evaluated immediately,
// but the result is assigned after 5 time units.

module and_beh_intra (
  input  a,
  input  b,
  output reg y
);

  always @(*) begin
    y = #3 (a & b);
  end

endmodule