version 17
set more off
* preserve / restore：临时修改后恢复
clear
input byte id str1 team int score
1 "A" 80
2 "A" 90
3 "B" 70
end
preserve
collapse (mean) score, by(team)
list, noobs
restore
list, noobs
