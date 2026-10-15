version 17
set more off
* by 与 bysort：组内执行
clear
input region id score
0 1 80
0 2 60
1 3 70
1 4 90
end
bysort region (score id): generate rank_in_group=_n
by region: generate group_size=_N
bysort region: summarize score
list, noobs sepby(region)
