version 17
set more off
* isid：检查观测标识是否唯一
sysuse auto, clear
isid make
list make in 1/5, noobs
count
