OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    r doMessage(arg)
  )
  r
)
Map atPutNumber := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)

s := "
  {
    \"Lucas Rangel\" : \"5133334444\",
    \"Lucas Cezimbra\" : \"5188889999\"
  }"
phoneNumbers := doString(s)
phoneNumbers println
phoneNumbers keys println
phoneNumbers values println
