version 17
set more off
* drop 与 keep：保留需要的数据
sysuse auto, clear
drop turn
keep make price foreign rep78
drop if missing(rep78)
count
keep if foreign == 1
count
list make price foreign rep78 in 1/5, noobs
