version 17
set more off
* import excel：读取 Excel 数据
sysuse auto, clear
export excel make price weight foreign using "tutorial_import.xlsx", ///
    sheet("Cars") firstrow(variables) replace
import excel using "tutorial_import.xlsx", describe
import excel using "tutorial_import.xlsx", sheet("Cars") firstrow clear
describe
list make price weight foreign in 1/5, noobs
