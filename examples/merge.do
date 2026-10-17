version 17
set more off
* merge：按键匹配数据
sysuse auto, clear
generate int auto_id = _n
tempfile attributes
preserve
keep auto_id foreign weight
drop if auto_id == 74
isid auto_id
save "`attributes'"
restore
keep auto_id make price
isid auto_id
merge 1:1 auto_id using "`attributes'"
tabulate _merge
list auto_id make price foreign weight _merge in 1/5, noobs
list auto_id make _merge if _merge != 3, noobs
