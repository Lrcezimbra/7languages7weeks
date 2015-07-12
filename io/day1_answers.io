"1 + 1 = " print
(1 + 1) println

//(1 + "one") println
"1 + \"one\" = error" println


"" println


if(0); "0 is true" println 
if(""); "empty string is true" println 
if(nil); "nil is true" println 


"" println


person := Object clone
person name := "Lucas"
person age := "18"

"Slots of a prototype: " print
person slotNames println



"" println


"::= - Creates slot, creates setter, assigns value" println
":= - Creates slot, assigns value" println
"= -  Assigns value to slot if it exists, otherwise raises exception" println
