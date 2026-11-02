version 17
set more off
* i. / c. / # / ##：理解因子变量写法
sysuse auto, clear
fvset base 0 foreign
regress price i.foreign##c.weight
