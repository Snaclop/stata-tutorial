version 17
set more off
* pwd 与 cd：工作目录
sysuse auto, clear
pwd
local here `"`c(pwd)'"'
cd "."
pwd
describe make price
