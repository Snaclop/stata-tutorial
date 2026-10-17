version 17
set more off
* twoway、直方图与箱线图：选择合适的图形
sysuse auto, clear
local old_graphics "`c(graphics)'"
set graphics off
twoway (scatter price weight) (lfit price weight), ///
    title("Price and weight") xtitle("Weight (lbs.)") ///
    ytitle("Price (US dollars)") name(tutorial_fit, replace)
graph export "tutorial_fit.png", name(tutorial_fit) replace width(1200)
histogram price, normal title("Car price distribution") ///
    xtitle("Price (US dollars)") name(tutorial_hist, replace)
graph export "tutorial_hist.png", name(tutorial_hist) replace width(1200)
graph box price, over(foreign) title("Price by car origin") ///
    ytitle("Price (US dollars)") name(tutorial_box, replace)
graph export "tutorial_box.png", name(tutorial_box) replace width(1200)
set graphics `old_graphics'
