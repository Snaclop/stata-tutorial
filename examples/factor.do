version 17
set more off
* i. / c. / # / ##：理解因子变量写法
clear
input byte id byte group int hours
1 1 2
2 1 4
3 2 3
4 2 5
end
fvexpand ib1.group##c.hours
display "`r(varlist)'"
generate byte group2 = group == 2 if !missing(group)
generate double group2_hours = group2 * hours
list, noobs
