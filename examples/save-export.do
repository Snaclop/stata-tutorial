version 17
set more off
* save 与 export：保存数据和交换文件
clear
input byte id double score
1 82.5
2 91
3 76.25
end
label variable score "练习成绩（分）"
format score %9.2f
notes score: 演示数据，满分100分。
save "tutorial_saved.dta", replace
export excel id score using "tutorial_saved.xlsx", sheet("scores") firstrow(variables) replace
clear
use "tutorial_saved.dta", clear
describe
notes score
list, noobs
