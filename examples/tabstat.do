version 17
set more off
* tabstat：定制统计表
sysuse auto, clear
tabstat price weight mpg, ///
    statistics(n mean sd min p25 p50 p75 max) ///
    columns(statistics) format(%12.3f) noseparator
tabstat price weight, by(foreign) ///
    statistics(n mean sd min max) ///
    columns(statistics) format(%12.3f)
