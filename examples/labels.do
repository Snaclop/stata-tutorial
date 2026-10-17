version 17
set more off
* label：数据标签、变量标签和值标签
sysuse auto, clear
label data "1978 年汽车样本"
label variable price "汽车价格（美元）"
label define tutorial_origin 0 "国产车" 1 "进口车"
label values foreign tutorial_origin
tabulate foreign
tabulate foreign, nolabel
label list tutorial_origin
describe price foreign
