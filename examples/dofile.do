version 17
set more off
* do 文件、注释与续行
sysuse auto, clear
* 统计三个指标；换行只是为了便于阅读。
tabstat price weight length, ///
    statistics(n mean min max) ///
    columns(statistics) format(%12.2f)
