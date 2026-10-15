version 17
set more off
* describe、list 与 count
clear
input id score
1 65
2 .
3 90
end
describe
list id score, noobs
count
count if !missing(score)
