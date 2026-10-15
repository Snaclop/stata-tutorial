version 17
set more off
* collapse：把明细表汇总成分组表
clear
input str1 team int score
"A" 80
"A" 90
"B" 70
"B" .
end
generate byte one = 1
collapse (mean) mean_score=score (sum) total_score=score n_rows=one (count) n_valid=score, by(team)
list, noobs
