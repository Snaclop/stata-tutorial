version 17
set more off
* format：控制小数位和显示方式
sysuse auto, clear
list make price gear_ratio in 1/5, noobs
format price %10.2f
format gear_ratio %8.3f
list make price gear_ratio in 1/5, noobs
describe price gear_ratio
summarize price gear_ratio
