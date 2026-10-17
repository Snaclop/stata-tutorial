version 17
set more off
* misstable 与 rowmiss：诊断缺失模式
sysuse auto, clear
misstable summarize rep78 headroom trunk
misstable patterns rep78 headroom trunk
egen byte n_missing = rowmiss(rep78 headroom trunk)
egen byte n_observed = rownonmiss(rep78 headroom trunk)
generate byte complete_case = (n_missing == 0)
tabulate complete_case
list make rep78 n_missing n_observed if missing(rep78), noobs
