version 17
set more off
* 大样本：选择读取、压缩与可复现抽样
clear
set obs 1000
generate double id = _n
generate double group = mod(id, 10)
generate double value = id/10
compress
preserve
set seed 20261022
sample 10
count
assert _N == 100
restore
preserve
set seed 20261022
sample 10, count
count
assert _N == 10
restore
isid id
count
