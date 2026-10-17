version 17
set more off
* save 与 export：保存数据和交换文件
sysuse auto, clear
save "tutorial_saved.dta", replace
export excel make price mpg using "tutorial_saved.xlsx", ///
    sheet("Cars") firstrow(variables) replace
export delimited make price mpg using "tutorial_saved.csv", replace
clear
use "tutorial_saved.dta", clear
describe make price mpg
count
