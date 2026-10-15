version 17
set more off
* if 与 in：选择观测
clear
input id score
1 60
2 80
3 100
4 .
end
summarize score if score>=80 & !missing(score)
list id score in 1/2, noobs
count
