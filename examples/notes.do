version 17
set more off
* notes：把数据说明保存在数据集里
sysuse auto, clear
notes: 数据来源：Stata 自带的 1978 年汽车数据 auto.dta。
notes price: 单位为美元；本例不改变原始价格。
notes list
save "tutorial_notes.dta", replace
use "tutorial_notes.dta", clear
notes list price
