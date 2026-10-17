version 17
set more off
* sort 与 gsort：排序
sysuse auto, clear
sort price make
list make price in 1/5, noobs
list make price in 11, noobs
gsort -price make
list make price in 1/5, noobs
sort foreign price make
list make foreign price in 1/10, noobs
