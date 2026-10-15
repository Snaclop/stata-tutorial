version 17
set more off
* append：把同结构数据纵向追加
clear
tempfile second
input byte id int score
3 78
4 92
end
save "`second'"
clear
input byte id int score
1 85
2 90
end
append using "`second'", generate(source)
sort id
list, noobs
tabulate source
isid id
