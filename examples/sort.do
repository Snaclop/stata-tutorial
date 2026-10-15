version 17
set more off
* sort 与 gsort：排序
clear
input id gdp
1 120
2 200
3 120
4 90
end
sort gdp id
list, noobs
gsort -gdp id
list, noobs
