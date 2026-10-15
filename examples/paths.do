version 17
set more off
* pwd 与 cd：工作目录
clear
pwd
local here `"`c(pwd)'"'
cd "."
pwd
display `"原目录：`here'"'
