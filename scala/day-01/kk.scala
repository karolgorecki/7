import collection.mutable.MutableList
 
object Marker extends Enumeration {
  type Marker = Value
  val EMPTY = Value("_")
  val X = Value("x")
  val O = Value("o")
}
 
import Marker._
 
class Board(boardSize: Int) {
 
  val board = MutableList.fill(boardSize * boardSize)(EMPTY)
 
  def spacer(value: String) = " " * (boardSize.toString.length() - value.length() + 2)
 
  override def toString = printBoard ((marker, index) => marker.toString)
 
  def printMoves() = printBoard ((marker, index) => if (marker == EMPTY) index.toString else EMPTY.toString)
 
  def printBoard(printMarker: (Marker, Int) => String): String = board.zipWithIndex.foldLeft(""){(acc, marker) =>
    val printedMarker = printMarker(marker._1, marker._2) 
    acc + (if (marker._2 > 0 && marker._2 % boardSize == 0) "\n" else "") + printedMarker + spacer(printedMarker)
  }
 
  def placeMarker(index: Int, marker: Marker): Boolean = {
    if (index >= 0 && index < board.length && board(index) == EMPTY) {
      board(index) = marker
      return true
    }
    
    false
  }
 
  def allEqual(elements: MutableList[Marker]) = !elements.contains(EMPTY) && elements.distinct.size == 1
 
  def anyListAllEqual(lists: TraversableOnce[MutableList[Marker]]): Boolean = lists.foldLeft(false)(_ || allEqual(_))
 
  def anyListAllEqual(lists: MutableList[MutableList[Marker]]): Boolean = anyListAllEqual(lists.toIterator)
 
  def rows() = board.grouped(boardSize)
 
  def cols() = board.zipWithIndex.groupBy(_._2 % boardSize).map(_._2.map(_._1))
 
  def diags() = MutableList(
    board.zipWithIndex.filter(_._2 % (boardSize + 1) == 0).map(_._1),
    board.zipWithIndex.filter(value => (value._2 % (boardSize - 1) == 0) && (value._2 > 0) && (value._2 < board.length - 1)).map(_._1)
  )
 
  def boardWon() = anyListAllEqual(rows()) || anyListAllEqual(cols()) || anyListAllEqual(diags())
  
  def boardFull() = board.count(_ == EMPTY) == 0
}
 
val board = new Board(3)
var currentMove = O
while (!board.boardFull() && !board.boardWon()) {
  currentMove = if (currentMove == X) O else X  
  println("\nThe board:\n")
  println(board)
  println("\nAvailable locations on the board:\n")
  println(board.printMoves())
  print("\nIt's " + currentMove + "'s turn! Enter a location: ")
 
  val index = scala.io.StdIn.readInt()
  if (!board.placeMarker(index, currentMove)) {
    println("Invalid location!")    
  }
}
 
println()
 
if (board.boardWon()) {
  println("Player " + currentMove + " wins!")
} else {
  println("It's a draw!")
}
 
println()
println(board)