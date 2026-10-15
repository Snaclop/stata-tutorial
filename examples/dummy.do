version 17
set more off
* 虚拟变量：0/1 编码
clear
input region
0
1
1
.
end
generate byte urban=(region==1) if !missing(region)
tabulate region, generate(r_)
summarize urban
list, noobs
