OperatorTable addAssignOperator(":", "atPutValue")
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    r doMessage(arg)
  )
  r
)
Map atPutValue := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)

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
Builder addAttributes := method(args, tag,
  first := args first asString
  if(first containsSeq("{")) then(
    attr := ""
    mapAttr := doString(doString(first))
    mapAttr foreach(k, v, attr = "#{attr} #{k}=\"#{v}\"" interpolate)
    writeln("#{indentation}<#{tag}#{attr}>" interpolate)
    args removeFirst
  ) else (
    writeln("#{indentation}<#{tag}>" interpolate)
  )
)
Builder forward := method(
  indent
  args := call message arguments
  messageName := call message name
  addAttributes(args, messageName)
  args foreach(arg,
    content := self doMessage(arg)
    if(content type == "Sequence",
      indent
      writeln("#{indentation}#{content}" interpolate)
      unindent
    )
  )
  writeln("#{indentation}</#{messageName}>" interpolate)
  unindent
)

"!!!!!!!!!!!!!!!!" println
Builder ul(
  li("Io"),
  li("Lua"),
  li("JavaScript")
)

"----------------------------------" println
Builder ul("{\"name\" : \"lucas\"}", li("io"))
