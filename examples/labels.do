version 17
set more off
* label：数据标签、变量标签和值标签
clear
input byte id employed double income
1 1 6000
2 0 0
3 1 7500
end
label data "演示调查数据"
label variable employed "是否就业"
label variable income "月收入（元）"
label define yesno 0 "否" 1 "是"
label values employed yesno
label list yesno
list, noobs
list id employed, nolabel noobs
count if employed == 1
