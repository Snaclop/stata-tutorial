version 17
set more off
* 命令结构与变量列表
sysuse auto, clear
describe price mpg rep78 headroom
summarize price-headroom
summarize price mpg if foreign==1, detail
