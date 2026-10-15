version 17
set more off
* log：记录分析过程
sysuse auto, clear
capture log close tutorial
log using "tutorial_log.log", text replace name(tutorial)
summarize price mpg
count if foreign==1
log close tutorial
