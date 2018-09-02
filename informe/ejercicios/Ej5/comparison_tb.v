`include "comparison.v"
module comparison_tb();

reg [3:0]A;
reg[3:0]B;

wire equal;
wire greater;
wire lower;

comparison #(4)comparator(A, B, equal, greater, lower);

initial begin
assign A=10;
assign B=12;
#1
$display("A: %d , B: %d , eq:%b, gt:%b, lt:%b", A, B, equal, greater, lower);

assign A=10;
assign B=1;
#1
$display("A: %d , B: %d , eq:%b, gt:%b, lt:%b", A, B, equal, greater, lower);

assign A=10;
assign B=12;
#3
$display("A: %d , B: %d , eq:%b, gt:%b, lt:%b", A, B, equal, greater, lower);
end

endmodule