version 17
set more off
* tabulate：频数和交叉表
clear
input region passed
0 0
0 1
1 1
1 1
. 0
end
tabulate region
tabulate region, missing
tabulate region passed, row
