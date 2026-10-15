version 17
set more off
* summarize：描述统计
clear
input score
20
40
60
80
.
end
summarize score, detail
display "有效N=" r(N)
display "均值=" r(mean) "；中位数=" r(p50)
display "p25=" r(p25) "；p75=" r(p75)
