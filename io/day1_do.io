Person := Object clone
Person name := "Lucas"
Person say := method("Hello World" println)
Person sayName := method(name println)
Person sayThis := method(toSay, toSay println)

Person perform("say")
Person perform("sayName")
Person name = "João"
Person perform("sayName")
Person sayThis("Hi, I'm saying this")
