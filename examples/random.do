version 17
set more off
* 随机数与 set seed：生成可复现的演示数据
sysuse auto, clear
set rng mt64
set seed 20261014
generate double u = runiform()
set seed 20261014
generate double u_again = runiform()
generate byte dice = runiformint(1, 6)
generate double z = rnormal(0, 1)
list make u u_again dice z in 1/5, noobs
