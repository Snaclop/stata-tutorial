version 17
set more off
* rename 与 order：名字和列位置
clear
input id x y
1 120 80
2 150 90
end
rename (x y) (income expense)
order income expense id
describe
list, noobs
