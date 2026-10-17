version 17
set more off
* duplicates：发现重复并谨慎去重
sysuse auto, clear
keep make price foreign
keep in 1/5
tempfile first_five
save "`first_five'"
append using "`first_five'"
duplicates report
duplicates tag make price foreign, generate(duplicate_count)
list, noobs
duplicates drop
isid make
count
