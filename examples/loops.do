version 17
set more off
* foreach / forvalues：重复执行一组命令
sysuse auto, clear
foreach v of varlist price weight length {
    generate double ln_`v' = ln(`v')
    summarize `v' ln_`v'
}
forvalues j = 1/3 {
    generate double weight_power`j' = (weight/1000)^`j'
}
list make weight weight_power1 weight_power2 weight_power3 in 1/5, noobs
