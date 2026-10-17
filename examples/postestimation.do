version 17
set more off
* 回归后：预测、检验与估计样本
clear
set seed 20261017
set obs 240
generate double education = 8 + 8 * runiform()
generate double experience = 25 * runiform()
generate double wage = 5 + 2 * education + .4 * experience + 3 * rnormal()
replace wage = . in 1/3
regress wage education experience, vce(robust)
generate byte sample_used = e(sample)
predict double fitted if e(sample), xb
predict double residual if e(sample), residuals
test education experience
lincom education + 5*experience
summarize residual if sample_used
list wage fitted residual sample_used in 1/6, noobs
