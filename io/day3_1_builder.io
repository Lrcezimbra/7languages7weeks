Builder := Object clone
Builder indentationLevel := -1
Builder indentation := ""
Builder indentationUpdate := method(
  indentation = ""
  for(i, 1, indentationLevel,
    indentation = "#{indentation}  " interpolate
  )
)
Builder indent := method(indentationLevel = indentationLevel + 1; indentationUpdate)
Builder unindent := method(indentationLevel = indentationLevel - 1; indentationUpdate)

Builder forward := method(
  indent
  writeln("#{indentation}<" interpolate, call message name, ">")
  call message arguments foreach(arg,
    content := self doMessage(arg)
    if(content type == "Sequence", 
      indent
      writeln("#{indentation}#{content}" interpolate)
      unindent
    )
  )
  writeln("#{indentation}</" interpolate, call message name, ">")
  unindent
)
Builder ul(
  li("Io"),
  li("Lua"),
  li("JavaScript")
)
