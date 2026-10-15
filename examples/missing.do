version 17
set more off
* 缺失值与 missing()
clear
input x
10
120
.
.a
end
count if x>100
count if x>100 & !missing(x)
count if missing(x)
summarize x
