version 17
set more off
* scatter / graph export：绘制并导出散点图
sysuse auto, clear
local old_graphics "`c(graphics)'"
set graphics off
scatter price weight, title("Price and weight") ///
    xtitle("Weight (lbs.)") ytitle("Price (US dollars)") ///
    name(tutorial_scatter, replace)
graph export "tutorial_scatter.png", name(tutorial_scatter) replace width(1200)
set graphics `old_graphics'
