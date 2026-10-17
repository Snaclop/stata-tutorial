version 17
set more off
* tabulate：频数和交叉表
sysuse auto, clear
tabulate foreign
tabulate foreign, nolabel
tabulate rep78, missing
tabulate foreign rep78, row
tabulate foreign, summarize(price)
