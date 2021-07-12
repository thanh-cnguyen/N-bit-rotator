//  A testbench for 4-bit_Rot
`timescale 10ns/100ps
//Set 50ns
module fourBit_Rot_tb ();
	
	//Declare test variables
	parameter N = 4;
	reg [(N-1):0] A;
	reg [1:0] rotamt;
	reg [1:0] patterns[0:3];
	wire [(N-1):0] Yleft, Yright;
	integer i;

	//Instantiate the design with testbench variables
	fourBit_Rot funct (.A(A), .rotamt(rotamt), .Yleft(Yleft), .Yright(Yright));

	//4-bit Rotator Test
	initial begin
		patterns[0] = 2'b00;
		patterns[1] = 2'b01;
		patterns[2] = 2'b10;
		patterns[3] = 2'b11;

		for(i=0; i<4; i=i+1) begin
			 	A <= 4'b0110;
				rotamt <= patterns[i];
				#1
				case(rotamt)
				2'b00:
				begin
					if (Yleft !== A) begin
						$display ("Error: 0_bit left rotation!!! -> %b", Yleft);
						$stop;
					end
					else 
						$display ("0_bit left rotation passed.");
					if (Yright !== A) begin
						$display ("Error: 0_bit right rotation!!! -> %b", Yright);
						$stop;
					end
					else 
						$display ("0_bit right rotation passed.");
				end
				2'b01:
				begin
					if (Yleft !== 4'b1100) begin
						$display ("Error: 1_bit left rotation!!! -> %b", Yleft);
						$stop;
					end
					else
						$display ("1_bit left rotation passed.");
					if (Yright !== 4'b0011) begin
						$display ("Error: 1_bit right rotation!!! -> %b", Yright);
						$stop;
					end
					else
						$display ("1_bit right rotation passed.");
				end
				2'b10:
				begin
					if (Yleft !== 4'b1001) begin
						$display ("Error: 2_bit left rotation!!! -> %b", Yleft);
						$stop;
					end
					else
						$display ("2_bit left rotation passed.");
					if (Yright !== 4'b1001) begin
						$display ("Error: 2_bit right rotation!!! -> %b", Yright);
						$stop;
					end
					else
						$display ("2_bit right rotation passed.");
				end
				2'b11:
				begin
					if (Yleft !== 4'b0011) begin
						$display ("Error: 3_bit left rotation!!! -> %b", Yleft);
						$stop;
					end
					else
						$display ("3_bit left rotation passed.");
					if (Yright !== 4'b1100) begin
						$display ("Error: 3_bit right rotation!!! -> %b", Yright);
						$stop;
					end
					else
						$display ("3_bit right rotation passed.");
				end
				endcase
		end
		
	end
endmodule