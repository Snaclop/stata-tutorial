version 17
set more off
* preserve / restore：临时修改后恢复
sysuse auto, clear
count
preserve
keep if foreign == 1
count
collapse (mean) mean_price=price mean_weight=weight
list, noobs
restore
count
summarize price weight
