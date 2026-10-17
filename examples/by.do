version 17
set more off
* by 与 bysort：组内执行
sysuse auto, clear
bysort foreign (price make): generate int group_rank = _n
by foreign: generate int group_size = _N
by foreign: summarize price
list make foreign price group_rank group_size if group_rank <= 3, sepby(foreign) noobs
