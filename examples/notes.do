version 17
set more off
* notes：把数据说明保存在数据集里
clear
input byte id double score
1 88
2 .
3 76
end
notes: 教学用模拟成绩数据。
notes score: 单位为分；数值缺失表示未参加考试。
notes score: 成绩允许范围为0到100。
notes list score
notes replace score in 2: 有效成绩范围为0到100，含端点。
save "tutorial_notes.dta", replace
clear
use "tutorial_notes.dta", clear
notes
