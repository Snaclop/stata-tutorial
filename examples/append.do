version 17
set more off
* append：把同结构数据纵向追加
sysuse auto, clear
tempfile domestic imported
preserve
keep if foreign == 0
save "`domestic'"
restore
keep if foreign == 1
save "`imported'"
use "`domestic'", clear
append using "`imported'", generate(source)
tabulate source foreign
count
list make foreign source in 1/5, noobs
