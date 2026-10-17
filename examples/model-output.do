version 17
set more off
* estimates 与 putexcel：比较和导出回归结果
clear
set seed 20261017
set obs 240
generate double education = 8 + 8 * runiform()
generate double experience = 25 * runiform()
generate double wage = 5 + 2 * education + .4 * experience + 3 * rnormal()
regress wage education, vce(robust)
estimates store output1
regress wage education experience, vce(robust)
estimates store output2
estimates table output1 output2, b(%9.3f) se(%9.3f) stats(N r2)
putexcel set "tutorial_models.xlsx", replace
putexcel A1 = "Statistic" B1 = "Model 1" C1 = "Model 2"
putexcel A2 = "Education coefficient" A3 = "Robust SE" A4 = "N" A5 = "R-squared"
estimates restore output1
putexcel B2 = (_b[education]) B3 = (_se[education]) B4 = (e(N)) B5 = (e(r2))
estimates restore output2
putexcel C2 = (_b[education]) C3 = (_se[education]) C4 = (e(N)) C5 = (e(r2))
putexcel A7 = "Simulated data; heteroskedasticity-robust standard errors."
import excel using "tutorial_models.xlsx", sheet("Sheet1") cellrange(A1:C5) firstrow clear
list, noobs
