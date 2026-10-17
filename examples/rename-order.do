version 17
set more off
* rename 与 order：名字和列位置
sysuse auto, clear
rename price newprice
order foreign newprice, after(make)
describe
list make foreign newprice in 1/5, noobs
