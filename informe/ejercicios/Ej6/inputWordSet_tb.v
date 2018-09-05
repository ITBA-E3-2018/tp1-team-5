`include "inputWordSet.v"
module inputWordSet_tb();
reg bitEnable;
reg [3:0]wordIn1;
reg [3:0]wordIn2;

wire [3:0]wordOut1;
wire [3:0]wordOut2;

inputWordSet wordSetter(bitEnable, wordIn1, wordIn2, wordOut1, wordOut2);

initial begin
assign wordIn1=6;
assign wordIn2=7;
assign bitEnable=1;
#1
$display("input: %b, %b, enable: %b, output: %b, %b", wordIn1, wordIn2, bitEnable, wordOut1, wordOut2);

assign wordIn1=6;
assign wordIn2=7;
assign bitEnable=0;
#1
$display("input: %b, %b, enable: %b, output: %b, %b", wordIn1, wordIn2, bitEnable, wordOut1, wordOut2);
end
endmodule