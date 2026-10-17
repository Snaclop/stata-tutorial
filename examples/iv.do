version 17
set more off
* ivregress：工具变量与识别诊断
clear
set seed 20261018
set obs 1200
generate double z1 = rnormal()
generate double z2 = rnormal()
generate double w = rnormal()
generate double u = rnormal()
generate double x = 1.2*z1 + .9*z2 + .5*w + u + .5*rnormal()
generate double y = 1 + 2*x + .5*w + u + rnormal()
regress y x w, vce(robust)
estimates store ols_iv_demo
ivregress 2sls y w (x = z1 z2), vce(robust)
estimates store iv_demo
estat firststage
estat endogenous
estat overid
estimates table ols_iv_demo iv_demo, b(%9.3f) se(%9.3f) stats(N)
