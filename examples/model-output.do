version 17
set more off
* estimates store：保存回归结果
sysuse auto, clear
regress price weight
estimates store m1
regress price weight length
estimates store m2
