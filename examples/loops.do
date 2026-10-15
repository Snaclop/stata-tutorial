version 17
set more off
* foreach / forvalues：重复执行一组命令
clear
input byte id int x int y
1 10 20
2 20 30
3 30 40
end
foreach v of varlist x y {
    generate double `v'_scaled = `v' / 10
}
forvalues j = 1/3 {
    generate double x_power`j' = x^`j'
}
list, noobs
