`include "inputBitSet.v"
module inputBitSet_tb();
reg bitEnable;
reg bitIn1;
reg bitIn2;

wire bitOut1;
wire bitOut2;

inputBitSet bitSetter(bitEnable, bitIn1, bitIn2, bitOut1, bitOut2);

initial begin
assign bitIn1=1;
assign bitIn2=0;
assign bitEnable=1;
#1
$display("input: %b, %b, enable: %b, output: %b, %b", bitIn1, bitIn2, bitEnable, bitOut1, bitOut2);

assign bitIn1=1;
assign bitIn2=1;
assign bitEnable=0;
#1
$display("input: %b, %b, enable: %b, output: %b, %b", bitIn1, bitIn2, bitEnable, bitOut1, bitOut2);
end


endmodule