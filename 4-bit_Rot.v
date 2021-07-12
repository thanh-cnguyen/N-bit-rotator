module fourBit_Rot (A, rotamt, Yleft, Yright);
	
	parameter N = 4;
	input [(N-1):0] A;
	input [1:0] rotamt;
	output reg [(N-1):0] Yleft, Yright;

	// Left rotate
	always @(A or rotamt) begin
		case(rotamt)
			2'b00: // 0_bit rotation
				Yleft <= A;
			2'b01: // 1_bit rotation
				Yleft <= {A[(N-2):0], A[(N-1)]};
			2'b10: // 2_bit rotation
				Yleft <= {A[(N-3):0], A[(N-1):(N-2)]};
			2'b11: // 3_bit rotation
				Yleft <= {A[(N-4):0], A[(N-1):(N-3)]};
			default:
				Yleft <= A;
		endcase
	end

	// Right rotate
	always @(A or rotamt) begin
		case(rotamt)
			2'b00: // 0_bit rotation
				Yright <= A;
			2'b01: // 1_bit rotation
				Yright <= {A[0], A[(N-1):1]};
			2'b10: // 2_bit rotation
				Yright <= {A[1:0], A[(N-1):2]};
			2'b11: // 3_bit rotation
				Yright <= {A[2:0], A[(N-1):3]};
			default:
				Yright <= A;
		endcase
	end

endmodule