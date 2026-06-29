`timescale 1ns/1ps

module alu_16bit_tb;

reg [15:0] A;
reg [15:0] B;
reg [2:0] opcode;

wire [15:0] result;
wire carry;

alu_16bit dut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry(carry)
);

// Generate VCD file
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, alu_16bit_tb);
end

initial begin
    // Addition
    A = 16'd25; B = 16'd15; opcode = 3'b000; #10;

    // Subtraction
    A = 16'd50; B = 16'd20; opcode = 3'b001; #10;

    // AND
    A = 16'h00FF; B = 16'h0F0F; opcode = 3'b010; #10;

    // OR
    opcode = 3'b011; #10;

    // XOR
    opcode = 3'b100; #10;

    // NOT
    A = 16'hAAAA; opcode = 3'b101; #10;

    // Left Shift
    A = 16'd8; opcode = 3'b110; #10;

    // Right Shift
    A = 16'd16; opcode = 3'b111; #10;

    $finish;
end

initial begin
    $monitor("Time=%0t A=%d B=%d Opcode=%b Result=%d Carry=%b",
             $time, A, B, opcode, result, carry);
end

endmodule
