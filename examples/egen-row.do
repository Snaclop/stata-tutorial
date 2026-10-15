version 17
set more off
* egen rowmean：在同一行跨变量计算
clear
input byte id double q1 q2 q3
1 80 90 100
2 70 . 90
3 . . .
4 60 . .
end
egen double average = rowmean(q1 q2 q3)
generate double strict_average = (q1 + q2 + q3)/3
egen answered = rownonmiss(q1 q2 q3)
egen missing_items = rowmiss(q1 q2 q3)
egen double total = rowtotal(q1 q2 q3), missing
generate double usable_average = average
replace usable_average = . if answered < 2
list, noobs
