fib_recursion := method(number,
  if(number < 1) then(
    "erro" println
  )
  if(number == 1) then(
    return 1
  ) else (if(number == 2) then(
      return 1
    ) else (
      return fib_recursion(number - 1) + fib_recursion(number - 2)
    )
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
