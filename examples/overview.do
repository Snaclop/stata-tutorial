version 17
set more off
* 认识 Stata 的工作流程
clear all
set more off
sysuse auto, clear
describe
summarize price mpg weight
count
