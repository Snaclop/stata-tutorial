version 17
set more off
* 数学函数：对数、平方根和取整
clear
input double x
-1.8
0
1.8
4
end
generate trunc_x=int(x)
generate down_x=floor(x)
generate up_x=ceil(x)
generate log_x=ln(x) if x>0 & x<.
generate root_x=sqrt(x) if x>=0 & x<.
list, noobs
