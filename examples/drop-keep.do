version 17
set more off
* drop 与 keep：保留需要的数据
clear
input id score extra
1 50 9
2 80 9
3 . 9
4 90 9
end
drop extra
keep if score>=60 & !missing(score)
list, noobs
