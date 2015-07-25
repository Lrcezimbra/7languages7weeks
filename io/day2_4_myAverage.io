"-------------------- myAverage -------------------" println

myList := list(5, 15)

myList myAverage := method(
  justNumbers := List clone
  foreach(value, 
    if(value type == Number type) then (
      justNumbers append(value)
    ) else (
      Exception raise("NaN on list")
    )
  )
  justNumbers average
)

myList myAverage println


"" println
"---------------- Exception -----------------------" println
myList append("four", "five")
myList myAverage println
