"" println
"---------------- Sum two-dimensional array  -------------------" println
sumArray := method(array, array flatten reduce(+))

array := list(list(10,10,10), list(10,10,10))
sumArray(array) println
