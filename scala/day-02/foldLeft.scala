val list = List("foo", "bar", "moo")
val totalLength = list.foldLeft(0)(_ + _.length)
println(totalLength)