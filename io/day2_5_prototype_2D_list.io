ListTwoD := Object clone

ListTwoD dim := method(x, y,
  self listTwoD := list()

  listX := list()
  for(i, 1, x,
    listX append(i)
  )

  for(i, 1, y,
    listTwoD append(listX clone)
  )
)

ListTwoD set := method(x, y, value,
  listTwoD at(y) atPut(x, value)
)

ListTwoD get := method(x, y,
  listTwoD at(y) at(x)
)

ListTwoD transpose := method(
  x := listTwoD at(0) size
  y := listTwoD size
  flatted := listTwoD flatten
  transposed := list()

  for(i, 0, y + 1,
    listX := list()
    for(i2, i, flatted size - 1, x,
      listX append(flatted at(i2))
    )
    transposed append(listX)
  )

  listTwoD = transposed
)

ListTwoD writeToFile := method(filename,
  file := File clone openForUpdating(filename)

  listTwoD foreach(value, 
    line := ""
    value foreach(val, 
      line = "#{line} #{val}" interpolate
    )
    line = "#{line}\n" interpolate
    file write(line)
  )
)

myList := ListTwoD clone
myList dim(5, 3)
myList listTwoD println
myList set(0, 0, 99999)
myList listTwoD println
myList get(0, 0) println

"" println
"------------------------------- Transpose -----------------------" println
myList transpose
myList listTwoD println


"" println
"------------------------------- Write File -----------------------" println
myList writeToFile("./abc")
