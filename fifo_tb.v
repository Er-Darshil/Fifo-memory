/************************************************
*************************************************
											   **
	Project Title : TB of fifo memory          ** 
	BY : Darshil R. Sachdev                    **
	Emailid : sachdevdarshil1999@gmail.com     **
											   **
*************************************************
************************************************/
`include "fifo.v"
module fifo_tb;

reg [7:0] data_in;
reg clk,rst,rd,wr;
wire empty,full;

wire [3:0] fifo_cnt;
wire [7:0] data_out;

fifo DUT ( .data_in(data_in) , .clk(clk) , .rst(rst) , .rd(rd) , .wr(wr) , .empty(empty) , .full(full) , .fifo_cnt(fifo_cnt) , .data_out(data_out));

initial

	$monitor ("data_in=%b, clk=%b , rst=%b , rd=%b , wr=%b , empty=%b , full=%b , fifo_cnt=%b , data_out=%b", data_in,clk,rst,rd,wr,empty,full,fifo_cnt,data_out);
	
initial

	begin
	
	$dumpfile("fifo.vcd");
	$dumpvars(0,fifo_tb);
	
	data_in = 8'b0;
	rst=1'b1;
	rd=1'b0;
	wr=1'b0;
	clk=1'b0;
	
	#20  rst = 1'b0;
		 rd = 1'b0;
		 wr = 1'b1;
		 data_in = 8'b00000001;
		 
    #20 data_in = 8'b00000010;
	
	#20 data_in = 8'b00000011;
	
	#20 data_in = 8'b00000100;
	
	#20 wr = 1'b0;
		rd = 1'b1;
	
	#80 $finish;
		 
	end
	
	always #10 clk= ~clk;
	
endmodule