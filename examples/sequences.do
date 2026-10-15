version 17
set more off
* seq 与 fill：生成练习序列
clear
set obs 6
egen year=seq(), from(2021) to(2023)
egen id=seq(), from(1) block(3)
egen even=fill(2 4)
isid id year
list, noobs
