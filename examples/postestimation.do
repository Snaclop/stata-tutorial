version 17
set more off
* predict：回归后的预测值
sysuse auto, clear
regress price mpg trunk foreign
predict fitted
list make price fitted in 1/5, noobs
