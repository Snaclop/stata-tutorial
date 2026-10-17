version 17
set more off
* recode：按阈值划分类别
sysuse auto, clear
recode rep78 (1/2 = 1 "较差") (3 = 2 "一般") (4/5 = 3 "较好"), generate(repair_group)
generate byte group0 = irecode(rep78, 2, 3) if !missing(rep78)
tabulate rep78 repair_group, missing
list make rep78 repair_group group0 in 1/5, noobs
