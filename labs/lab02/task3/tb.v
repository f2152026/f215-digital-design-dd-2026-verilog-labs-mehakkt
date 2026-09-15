// tb.v
// Self-checking testbench for 2-bit unsigned comparator

module tb;

  reg  [1:0] t_A;
  reg  [1:0] t_B;

  wire t_GT;
  wire t_LT;
  wire t_EQ;

  integer errors;

  // Instantiate comparator
  comp2 U1 (
    .A  (t_A),
    .B  (t_B),
    .GT (t_GT),
    .LT (t_LT),
    .EQ (t_EQ)
  );

  // Waveform dump configuration
  string vcd_file;

  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, tb);
    end
  end

  // Self-checking test
  initial begin

    errors = 0;

    // Test all 16 combinations of A and B

    t_A = 2'b00; t_B = 2'b00;
    #1;
    if (t_GT !== 0 || t_LT !== 0 || t_EQ !== 1) begin
      $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
               t_A, t_B, t_GT, t_LT, t_EQ);
      errors = errors + 1;
    end

    t_A = 2'b00; t_B = 2'b01;
    #1;
    if (t_GT !== 0 || t_LT !== 1 || t_EQ !== 0) begin
      $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
               t_A, t_B, t_GT, t_LT, t_EQ);
      errors = errors + 1;
    end

    t_A = 2'b00; t_B = 2'b10;
    #1;
    if (t_GT !== 0 || t_LT !== 1 || t_EQ !== 0) begin
      $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
               t_A, t_B, t_GT, t_LT, t_EQ);
      errors = errors + 1;
    end

    t_A = 2'b00; t_B = 2'b11;
    #1;
    if (t_GT !== 0 || t_LT !== 1 || t_EQ !== 0) begin
      $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
               t_A, t_B, t_GT, t_LT, t_EQ);
      errors = errors + 1;
    end

    t_A = 2'b01; t_B = 2'b00;
    #1;
    if (t_GT !== 1 || t_LT !== 0 || t_EQ !== 0) begin
      $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
               t_A, t_B, t_GT, t_LT, t_EQ);
      errors = errors + 1;
    end

    t_A = 2'b01; t_B = 2'b01;
    #1;
    if (t_GT !== 0 || t_LT !== 0 || t_EQ !== 1) begin
      $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
               t_A, t_B, t_GT, t_LT, t_EQ);
      errors = errors + 1;
    end

    t_A = 2'b01; t_B = 2'b10;
    #1;
    if (t_GT !== 0 || t_LT !== 1 || t_EQ !== 0) begin
      $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
               t_A, t_B, t_GT, t_LT, t_EQ);
      errors = errors + 1;
    end

    t_A = 2'b01; t_B = 2'b11;
    #1;
    if (t_GT !== 0 || t_LT !== 1 || t_EQ !== 0) begin
      $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
               t_A, t_B, t_GT, t_LT, t_EQ);
      errors = errors + 1;
    end

    t_A = 2'b10; t_B = 2'b00;
    #1;
    if (t_GT !== 1 || t_LT !== 0 || t_EQ !== 0) begin
      $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
               t_A, t_B, t_GT, t_LT, t_EQ);
      errors = errors + 1;
    end

    t_A = 2'b10; t_B = 2'b01;
    #1;
    if (t_GT !== 1 || t_LT !== 0 || t_EQ !== 0) begin
      $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
               t_A, t_B, t_GT, t_LT, t_EQ);
      errors = errors + 1;
    end

    t_A = 2'b10; t_B = 2'b10;
    #1;
    if (t_GT !== 0 || t_LT !== 0 || t_EQ !== 1) begin
      $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
               t_A, t_B, t_GT, t_LT, t_EQ);
      errors = errors + 1;
    end

    t_A = 2'b10; t_B = 2'b11;
    #1;
    if (t_GT !== 0 || t_LT !== 1 || t_EQ !== 0) begin
      $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
               t_A, t_B, t_GT, t_LT, t_EQ);
      errors = errors + 1;
    end

    t_A = 2'b11; t_B = 2'b00;
    #1;
    if (t_GT !== 1 || t_LT !== 0 || t_EQ !== 0) begin
      $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
               t_A, t_B, t_GT, t_LT, t_EQ);
      errors = errors + 1;
    end

    t_A = 2'b11; t_B = 2'b01;
    #1;
    if (t_GT !== 1 || t_LT !== 0 || t_EQ !== 0) begin
      $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
               t_A, t_B, t_GT, t_LT, t_EQ);
      errors = errors + 1;
    end

    t_A = 2'b11; t_B = 2'b10;
    #1;
    if (t_GT !== 1 || t_LT !== 0 || t_EQ !== 0) begin
      $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
               t_A, t_B, t_GT, t_LT, t_EQ);
      errors = errors + 1;
    end

    t_A = 2'b11; t_B = 2'b11;
    #1;
    if (t_GT !== 0 || t_LT !== 0 || t_EQ !== 1) begin
      $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
               t_A, t_B, t_GT, t_LT, t_EQ);
      errors = errors + 1;
    end

    // Final result
    if (errors == 0)
      $display("PASS: All 16 comparator tests passed.");
    else
      $display("FAIL: %0d test(s) failed.", errors);

    $finish;

  end

endmodule