ListTwoD := List clone

ListTwoD dim := method(x, y,
  for(i, 1, y, self append(list setSize(x)))
)

ListTwoD set := method(x, y, value, self at(y) atPut(x, value))

ListTwoD get := method(x, y, self at(y) at(x))

ListTwoD transpose := method(
  x := self at(0) size
  y := self size
  flatted := self flatten
  self := empty

  for(i, 0, y + 1,
    listX := list()
    for(i2, i, flatted size - 1, x,
      listX append(flatted at(i2))
    )
    self append(listX)
  )
)

ListTwoD writeToFile := method(filename,
  file := File clone openForUpdating(filename)

  self foreach(value, 
    line := ""
    value foreach(val, 
      line = "#{line}#{val} " interpolate
    )
    line = "#{line}\n" interpolate
    file write(line)
  )
)

ListTwoD readFromFile := method(filename,
  file := File clone openForReading(filename)
  self := empty

  lines := file readLines
  lines foreach(line,
    self append(line split)
  )
)

myList := ListTwoD clone
myList dim(5, 3)
myList println
myList set(0, 0, 99999)
myList println
myList get(0, 0) println

"" println
"------------------------------- Transpose -----------------------" println
myList transpose
myList println


"" println
"------------------------------- Write File -----------------------" println
myList writeToFile("./abc")


"" println
"------------------------------- Read File -----------------------" println
myList println
myList readFromFile("./cba")
myList println
