// tb.v
// Self-checking testbench for 4-bit ALU

module tb;

  reg  [3:0] t_a;
  reg  [3:0] t_b;
  reg        t_op;

  wire [3:0] t_result;

  integer errors;

  // Instantiate ALU
  alu U1 (
    .a      (t_a),
    .b      (t_b),
    .op     (t_op),
    .result (t_result)
  );

  // Waveform dump configuration
  string vcd_file;

  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, tb);
    end
  end

  // Self-checking tests
  initial begin

    errors = 0;

    // ADD: 3 + 2 = 5
    t_a = 4'd3;
    t_b = 4'd2;
    t_op = 1'b0;
    #1;

    if (t_result !== 4'd5) begin
      $display("FAIL: ADD 3 + 2 | result=%d expected=5", t_result);
      errors = errors + 1;
    end
    else begin
      $display("PASS: ADD 3 + 2 | result=%d", t_result);
    end


    // ADD: 7 + 4 = 11
    t_a = 4'd7;
    t_b = 4'd4;
    t_op = 1'b0;
    #1;

    if (t_result !== 4'd11) begin
      $display("FAIL: ADD 7 + 4 | result=%d expected=11", t_result);
      errors = errors + 1;
    end
    else begin
      $display("PASS: ADD 7 + 4 | result=%d", t_result);
    end


    // SUB: 7 - 3 = 4
    t_a = 4'd7;
    t_b = 4'd3;
    t_op = 1'b1;
    #1;

    if (t_result !== 4'd4) begin
      $display("FAIL: SUB 7 - 3 | result=%d expected=4", t_result);
      errors = errors + 1;
    end
    else begin
      $display("PASS: SUB 7 - 3 | result=%d", t_result);
    end


    // SUB: 10 - 6 = 4
    t_a = 4'd10;
    t_b = 4'd6;
    t_op = 1'b1;
    #1;

    if (t_result !== 4'd4) begin
      $display("FAIL: SUB 10 - 6 | result=%d expected=4", t_result);
      errors = errors + 1;
    end
    else begin
      $display("PASS: SUB 10 - 6 | result=%d", t_result);
    end


    // Test sensitivity to OP change.
    // Keep a and b unchanged, change op from SUB to ADD.
    // 10 + 6 = 0 (4-bit result, 16 wraps around)
    t_a = 4'd10;
    t_b = 4'd6;
    t_op = 1'b0;
    #1;

    if (t_result !== 4'd0) begin
      $display("FAIL: ADD after OP change 10 + 6 | result=%d expected=0",
               t_result);
      errors = errors + 1;
    end
    else begin
      $display("PASS: ADD after OP change 10 + 6 | result=%d", t_result);
    end


    // Another OP-only change.
    // Keep a and b unchanged, change ADD to SUB.
    // 10 - 6 = 4
    t_op = 1'b1;
    #1;

    if (t_result !== 4'd4) begin
      $display("FAIL: SUB after OP change 10 - 6 | result=%d expected=4",
               t_result);
      errors = errors + 1;
    end
    else begin
      $display("PASS: SUB after OP change 10 - 6 | result=%d", t_result);
    end


    // Final result
    if (errors == 0)
      $display("PASS: All ALU tests passed.");
    else
      $display("FAIL: %0d ALU test(s) failed.", errors);

    $finish;

  end

  initial
    $monitor($time,
             " a=%d b=%d op=%b | result=%d",
             t_a, t_b, t_op, t_result);

endmodule