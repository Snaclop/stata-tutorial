version 17
set more off
* local / global：用宏复用文字和参数
sysuse auto, clear
local variables price weight length
local cutoff = 6000
summarize `variables' if price >= `cutoff'
local old_source "$tutorial_source"
global tutorial_source "auto.dta"
display "$tutorial_source"
global tutorial_source "`old_source'"
