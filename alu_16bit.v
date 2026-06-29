module alu_16bit(
    input [15:0] A,
    input [15:0] B,
    input [2:0] opcode,
    output reg [15:0] result,
    output reg carry
);

always @(*) begin

    carry = 0;

    case(opcode)

        3'b000: begin
            {carry, result} = A + B;
        end

        3'b001: begin
            {carry, result} = A - B;
        end

        3'b010: begin
            result = A & B;
        end

        3'b011: begin
            result = A | B;
        end

        3'b100: begin
            result = A ^ B;
        end

        3'b101: begin
            result = ~A;
        end

        3'b110: begin
            result = A << 1;
        end

        3'b111: begin
            result = A >> 1;
        end

        default: begin
            result = 16'b0;
            carry = 0;
        end

    endcase

end

endmodule
