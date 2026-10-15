version 17
set more off
* tabstat：定制统计表
clear
input region x y
0 10 2
0 20 4
1 30 6
1 40 8
end
tabstat x y, statistics(n mean sd min p50 max) ///
    columns(statistics) by(region) format(%12.3f) noseparator
