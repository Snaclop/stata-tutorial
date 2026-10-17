version 17
set more off
* do 文件、注释与续行
clear all
set more off
* 项目：auto 汽车数据的描述统计。
sysuse auto, clear
capture log close tutorial_project
log using "tutorial_project.log", text replace name(tutorial_project)
* 检查车型标识，再输出统计表。
isid make
tabstat price weight length, ///
    statistics(n mean min max) ///
    columns(statistics) format(%12.2f)
save "tutorial_project_clean.dta", replace
log close tutorial_project
