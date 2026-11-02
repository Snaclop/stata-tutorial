version 17
set more off
* set seed 与 runiform：生成可复现的随机数
sysuse auto, clear
set seed 1234666
generate double u = runiform()
set seed 1234666
generate double u_again = runiform()
list make u u_again in 1/5, noobs
