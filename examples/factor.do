version 17
set more off
* i. / c. / # / ##：理解因子变量写法
sysuse auto, clear
fvexpand ib0.foreign##c.weight
display "`r(varlist)'"
generate double foreign_weight = foreign * weight
list make foreign weight foreign_weight in 1/5, noobs
