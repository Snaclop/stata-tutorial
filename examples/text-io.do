version 17
set more off
* import delimited：读写 CSV 和文本表
clear
input str3 code double sales
"001" 125.5
"002" 80
"010" 210.25
end
export delimited code sales using "tutorial_text.csv", replace
clear
import delimited using "tutorial_text.csv", varnames(1) stringcols(1) encoding("UTF-8") clear
describe
list, noobs
