class Position {

final int row; 
final int col;  

  Position (int row, int col) {
    this.row = row;
    this.col = col;
  }

//Give the next position in the entered direction
Position next(String direction) {
    if (direction.equals("up"))    return new Position(row-1, col);
    if (direction.equals("down"))  return new Position(row+1, col);
    if (direction.equals("left"))  return new Position(row, col-1);
    if (direction.equals("right")) return new Position(row, col+1);
    
  
    return this;
  }
// we might not need following method
   String toString() {
    return String.format("(%d,%d)", row, col);
  }
  //////// maybe delete bottom couple of lines
  int posX(){
    return col;
  }
  int posY(){
    return row;
  }
}
