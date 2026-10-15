version 17
set more off
* 字符串清理与拼接
clear
input str20 a str20 b
" a b " "c。d。"
" x y " "z。"
end
generate trimmed = ustrtrim(a)
replace a = subinstr(a," ","",.)
replace b = subinstr(b,"。","",1)
generate combined = upper(a+b)
list, noobs
