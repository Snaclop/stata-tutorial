version 17
set more off
* return list 与 r()：读取结果
clear
input x
10
20
30
end
quietly summarize x
local avg = r(mean)
count if x>20
display "大于20的行数=" r(N)
display "刚才的均值=" `avg'
