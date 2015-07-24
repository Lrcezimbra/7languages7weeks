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

for(i, 1, 9, fib_recursion(i) println)
