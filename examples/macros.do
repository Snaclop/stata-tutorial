version 17
set more off
* local / global：用宏复用文字和参数
clear
input byte id int score
1 72
2 86
3 93
end
local cutoff = 80 + 5
local variables "id score"
display "Cutoff = `cutoff'"
list `variables' if score >= `cutoff', noobs
generate byte selected = score >= `cutoff' if !missing(score)
