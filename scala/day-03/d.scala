// Take the sizer application and add a message to count the number of links on the page.
// Since the book's example was using an outdated built-in version of actors,
// took the opportunity to migrate to Akka.
// > sbt run

import scala.io._
import akka.actor._

object PageLoader {
 def getPageSize(url : String) = Source.fromURL(url).mkString.length
 def getPageLinks(url: String): Int = {
  val pageSource = Source.fromURL(url).mkString
  return "</a>".r.findAllIn(pageSource).length
 }
}

class PageSizeActor extends Actor {
  def receive = {
    case (url, size) =>
      println("Size for " + url + ": " + size)            
  }
}

class PageLinksActor extends Actor {
  def receive = {
    case (url, linksCount) =>
      println("Number of links for " + url + ": " + linksCount)            
  }
}

object Main extends App {
  val urls = List(
    "http://www.allegro.pl/", 
    "http://www.mashable.com/",
    "http://www.lemonde.fr/",
    "http://www.cnn.com/"
  )

  val system = ActorSystem("SizerSystem")
  val pageSizeActor = system.actorOf(Props[PageSizeActor], name = "pagesizeactor")
  val pageLinksActor = system.actorOf(Props[PageLinksActor], name = "pagelinksactor")

  for (url <- urls) {
    pageSizeActor ! (url, PageLoader.getPageSize(url))
    pageLinksActor ! (url, PageLoader.getPageLinks(url))
  }
}
