version 17
set more off
* 字符串清理与拼接
sysuse auto, clear
generate padded_make = "  " + make + "  "
generate clean_make = ustrtrim(padded_make)
generate upper_make = ustrupper(clean_make)
generate make_prefix = substr(clean_make, 1, 3)
list make padded_make clean_make upper_make make_prefix in 1/5, noobs
