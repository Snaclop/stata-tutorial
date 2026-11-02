version 17
set more off
* correlate 与 pwcorr：看清相关系数和样本
sysuse auto, clear
correlate price mpg rep78
pwcorr price mpg rep78, sig obs
