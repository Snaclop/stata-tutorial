version 17
set more off
* scatter / graph export：绘制并导出散点图
clear
input byte id byte hours int score
1 1 55
2 2 63
3 3 61
4 4 76
5 5 82
6 6 86
end
local old_graphics "`c(graphics)'"
set graphics off
scatter score hours, title("Practice scores") xtitle("Study hours") ytitle("Score") mcolor(navy) msymbol(O) name(tutorial_scatter, replace)
graph export "tutorial_scatter.png", name(tutorial_scatter) replace width(1200)
set graphics `old_graphics'
