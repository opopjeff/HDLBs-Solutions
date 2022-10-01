# HDLBs-Solutions

网址：[HDLBits (01xz.net)](https://hdlbits.01xz.net/wiki/Main_Page)

本文档是HDLBits练习题的求解方案。采用语言为Verilog HDL。

[TOC]

## 问题合集

### Question1：Alwaysblock1

分别使用assign语句和组合always模块设计一个AND门。（赋值语句和always模块功能相同，但是这是用来练习的。）

![HDLBs-Solutions/Alwaysblock1.png at main · opopjeff/HDLBs-Solutions (github.com)](https://github.com/opopjeff/HDLBs-Solutions/blob/main/pictures/Alwaysblock1.png)

求解：

```verilog
module Alwaysblock1(
	input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
    );
	assign out_assign = a & b ;
	always@(*) out_alwaysblock = a & b ;
endmodule
```



### Question2：Alwaysblock2

使用assign赋值语句、组合always模块和带时钟的always模块三种方法建立一个异或（XOR）门。带时钟的always模块会综合为与其他两个不同的电路：有一个触发器，因此输出延迟。

![HDLBs-Solutions/Alwaysblock2.png at main · opopjeff/HDLBs-Solutions (github.com)](https://github.com/opopjeff/HDLBs-Solutions/blob/main/pictures/Alwaysblock2.png)

求解：

```verilog
module Alwaysblock2(
	input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff
    );
	
	assign out_assign = a ^ b;
	always@(*) out_always_comb = a ^ b;
	always@(posedge clk) out_always_ff = a ^ b;
endmodule
```

代码运行结果如下：注意带时钟的always模块有一个周期的延迟。

![HDLBs-Solutions/Alwaysblock2(2).png at main · opopjeff/HDLBs-Solutions (github.com)](https://github.com/opopjeff/HDLBs-Solutions/blob/main/pictures/Alwaysblock2(2).png)

### Question3：Always if

​		设计一个二选一双路选择器（输入是a和b）。当sel_b1和sel_b2都为1时，输出为b，其余情况下输出a。要求分别使用assign语句和always模块实现。

| sel_b1 | sel_b2 | out_assing / out_always |
| :----: | :----: | :---------------------: |
|   0    |   0    |            a            |
|   0    |   1    |            a            |
|   1    |   0    |            a            |
|   1    |   1    |            b            |

```verilog
module AlwaysIf(
	input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always 
    );
	assign out_assign = (sel_b1 & sel_b2)?b:a;
	always@(*)begin
		if((sel_b1 == 1'b1)&(sel_b2 == 1'b1))
			out_always = b;
		else
			out_always = a;
	
	end
endmodule
```

代码运行结果如下：

![HDLBs-Solutions/AlwaysIF.png at main · opopjeff/HDLBs-Solutions (github.com)](https://github.com/opopjeff/HDLBs-Solutions/blob/main/pictures/AlwaysIF.png)



### Question4：Always if2

接下来的代码包含一个行为错误，请修复这个Bug。

```verilog
always @(*) begin
    if (cpu_overheated)
       shut_off_computer = 1;
end

always @(*) begin
    if (~arrived)
       keep_driving = ~gas_tank_empty;
end
```

if分支语句没有指明全部分支的结果，导致行为错误。为两个if分支添加else。

```verilog
module AlwaysIf2(
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving
    );
	

    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else
			shut_off_computer = 0;
    end

    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
		else
			keep_driving = 0;
    end
	
endmodule
```

代码运行结果如下所示。

![HDLBs-Solutions/Alwaysif2.png at main · opopjeff/HDLBs-Solutions (github.com)](https://github.com/opopjeff/HDLBs-Solutions/blob/main/pictures/Alwaysif2.png)



### Question5：Alwayscase

如果有大量的分支情况使用case语句更加方便。在本练习中，要求设计一个6-1多路选通器。当sel介于0~5，选择相对应的数据输入。其他情况下，输出0。输入和输出数据都是4bit宽的。

```verilog
module Alwayscase(
	  input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out
    );
	
	 always@(*) begin  // This is a combinational circuit
        case(sel)
			0 : out <= data0;
			1 : out <= data1;
			2 : out <= data2;
			3 : out <= data3;
			4 : out <= data4;
			5 : out <= data5;
			default : out <= 1'b0;
		endcase
    end
endmodule

```

![HDLBs-Solutions/Alwayscase.png at main · opopjeff/HDLBs-Solutions (github.com)](https://github.com/opopjeff/HDLBs-Solutions/blob/main/pictures/Alwayscase.png)



### Question6：Alwayscase2

优先级编码器是一个组合逻辑电路。它的功能是输入为一组bit，输出为1bit，表示输入第一次出现1‘b1的位置。比如，8位优先级编码器输入位8’b10010000，输出将会是3‘d4。设计一个4-bit'的优先级编码器，对于该问题，当输入没有1，输出为0。值得注意的是4-bit有16种可能的结果。





