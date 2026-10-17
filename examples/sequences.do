version 17
set more off
* seq 与 fill：生成练习序列
sysuse auto, clear
keep in 1/6
egen wave = seq(), from(1) to(3)
egen block_id = seq(), from(1) block(3)
egen even = fill(2 4)
isid block_id wave
list make block_id wave even, noobs
