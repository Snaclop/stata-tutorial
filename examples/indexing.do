version 17
set more off
* _n、_N 与下标：编号和引用
clear
input x
30
10
20
end
generate id=_n
sort x
generate position=_n
generate previous=x[_n-1]
list, noobs
