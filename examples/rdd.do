version 17
set more off
* RDD：断点附近的局部比较
clear
set seed 20261020
set obs 2000
generate double score = 450 + 100*runiform()
generate double running = score - 500
generate byte treated = (running >= 0) if !missing(running)
generate double outcome = 60 + .2*running + 3*treated + .1*running*treated + rnormal()
foreach h in 10 20 30 {
    regress outcome i.treated##c.running if abs(running) <= `h', vce(robust)
    estimates store bandwidth`h'
}
estimates table bandwidth10 bandwidth20 bandwidth30, b(%9.3f) se(%9.3f) stats(N)
estimates restore bandwidth20
lincom 1.treated
