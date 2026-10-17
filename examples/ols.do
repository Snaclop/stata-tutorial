version 17
set more off
* regress：OLS 回归与结果解读
sysuse auto, clear
regress price weight
estimates store simple
regress price weight length mpg i.foreign, vce(robust)
estimates store adjusted
estimates table simple adjusted, b(%9.3f) se(%9.3f) stats(N r2)
