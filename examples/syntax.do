version 17
set more off
* 命令结构与变量列表
sysuse auto, clear
summarize price-headroom
summarize l*
summarize ?u?n
summarize price weight if foreign == 1, detail
