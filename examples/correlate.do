version 17
set more off
* correlate 与 pwcorr：看清相关系数和样本
clear
input byte id byte hours int score int income
1 1 50 100
2 2 60 120
3 3 70 140
4 4 80 .
5 . 90 180
6 6 . 200
end
correlate hours score income
matrix C = r(C)
pwcorr hours score income, sig obs
list, noobs
