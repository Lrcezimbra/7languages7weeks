"" println
"---------------- Return 0 if the denominator is 0 -------------------" println
"Before" println
"10/0 = #{10/0}" interpolate println
"10/2 = #{10/2}" interpolate println

Number oldDiv := Number getSlot("/")
Number / := method(denom, if(denom == 0, 0, self oldDiv(denom)))

"" println
"After" println
"10/0 = #{10/0}" interpolate println
"10/2 = #{10/2}" interpolate println
