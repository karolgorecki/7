import collection.mutable.HashMap
 
trait Censor {
  val curseWords = new HashMap[String, String]()
 
  io.Source.fromFile("censor.txt").getLines().foreach { (line) =>
    val parts = line.split(": ")
    curseWords += parts(0) -> parts(1)
  }
 
  def censor(s: String) = curseWords.foldLeft(s)((prev, curr) => prev.replaceAll(curr._1, curr._2))
}
 
class Text(s: String) extends Censor {
  def value = s
 
  def censoredValue = censor(s)
}
 
val text = new Text("I hate php it's shit")
println(text.value)
println(text.censoredValue)