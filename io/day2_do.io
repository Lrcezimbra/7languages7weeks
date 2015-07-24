fib_recursion := method(number,
  if(number <= 1) then(
    return number
  ) else (
    return fib_recursion(number - 1) + fib_recursion(number - 2)
  )
)

"---------------- Recursive Fibonacci -------------------" println
for(i, 1, 9, fib_recursion(i) println)
"" println



fib_loops := method(number,
  fibonacci := list(1,1)
  for(i, 2, number,
    fibonacci append((fibonacci at(i - 1)) + (fibonacci at(i - 2)))
  )

  return fibonacci at(number - 1)
)

"---------------- Fibonacci with loops -------------------" println
for(i, 1, 9, fib_loops(i) println)






"---------------- Return 0 if the denominator is 0-------------------" println
"Before" println
"10/0 = #{10/0}" interpolate println
"10/2 = #{10/2}" interpolate println

Number oldDiv := Number getSlot("/")
Number / := method(denom, if(denom == 0, 0, self oldDiv(denom)))

"After" println
"10/0 = #{10/0}" interpolate println
"10/2 = #{10/2}" interpolate println
