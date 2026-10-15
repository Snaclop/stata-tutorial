version 17
set more off
* generate 与 replace：创建和修改
clear
input id price qty score
1 12 3 80
2 15 2 575
3 20 4 .
end
generate double amount=price*qty
* 假设已经核实 id=2 的原始分数应为57.5。
replace score=57.5 if id==2 & score==575
list, noobs
