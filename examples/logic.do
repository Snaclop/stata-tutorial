version 17
set more off
* cond、inlist 与 inrange
clear
input score
50
80
120
.
end
generate passed=cond(missing(score),.,cond(score>=60,1,0))
generate legal=inrange(score,0,100)
generate selected=inlist(score,50,80)
list, noobs
