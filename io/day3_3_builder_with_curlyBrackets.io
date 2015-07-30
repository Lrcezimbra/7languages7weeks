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
    call message arguments first asString asMutable removePrefix("\"\" ") removeSuffix(" \"\""),
    call evalArgAt(1)
  )
)

Builder := Object clone
Builder indented := true
Builder indentationLevel := -1
Builder indentation := ""
Builder indentationUpdate := method(
  if(indented,
    indentation = ""
    for(i, 1, indentationLevel,
      indentation = "#{indentation}  " interpolate
    )
  )
)
Builder indent := method(indentationLevel = indentationLevel + 1; indentationUpdate)
Builder unindent := method(indentationLevel = indentationLevel - 1; indentationUpdate)
Builder sWrite := Object getSlot("writeln")
Builder addAttributes := method(args, tag,
  first := args first asString
  if(first containsSeq("{") or first containsSeq("curly")) then(
    attr := ""
    mapAttr := doString(first)
    mapAttr foreach(k, v, attr = "#{attr} #{k}=\"#{v}\"" interpolate)
    sWrite("#{indentation}<#{tag}#{attr}>" interpolate)
    args removeFirst
  ) else (
    sWrite("#{indentation}<#{tag}>" interpolate)
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
      sWrite("#{indentation}#{content}" interpolate)
      unindent
    )
  )
  sWrite("#{indentation}</#{messageName}>" interpolate)
  unindent
)

"---------------------- with indentation ---------------------" println
myB := Builder clone
myB ul(
  "{\"name\" : \"lucas\"}",
  li("Io"),
  li("Lua"),
  li("JavaScript")
)


"---------------------- without indentation ---------------------" println
myBu := Builder clone
myBu indented := false
myBu sWrite := Object getSlot("write")
myBu ul(
  "{\"name\" : \"lucas\"}",
  li("Io"),
  li("Lua"),
  li("JavaScript")
)

"---------------------- from file ---------------------" println
myBui := Builder clone
ioXml := File clone openForReading("example.ioxml") contents
myBui doString(ioXml)
