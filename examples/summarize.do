version 17
set more off
* summarize：描述统计
sysuse auto, clear
summarize price weight length
summarize price, detail
summarize price if foreign == 1
