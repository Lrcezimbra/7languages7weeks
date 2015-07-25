readNumber := method(
  "Type a number between 1 and 100: " print
  return ReadLine readLine asNumber
)

number := Random value(1, 100) round
i := 0


for(i, 1, 10,
  typed := readNumber
  if(number == typed) then (
    "Congratulations, you guessed the number!" println
    return
  )else(
    diff := number - typed
    if(diff >= -10 and diff <= 10, "hot" println, "cold" println)
  )
)

"You don't guessed the number. The number was #{number}" interpolate println
