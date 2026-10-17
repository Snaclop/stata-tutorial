version 17
set more off
* import delimited：读写 CSV 和文本表
sysuse auto, clear
export delimited make price foreign using "tutorial_text.csv", replace
import delimited using "tutorial_text.csv", ///
    varnames(1) stringcols(1) encoding("UTF-8") clear
describe
list make price foreign in 1/5, noobs
