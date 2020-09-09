
class Cell {
    private PImage   type;
    Cell(PImage t){
        if (t.equals(player) || t.equals(empty) || t.equals(pad) || t.equals(wall) ||
            t.equals(box) || t.equals(boxOnPad) || t.equals(gem) || t.equals(trooper)){
            this.type = t;
        }
    }
  
    boolean isEmptyPad() {
        return type.equals(pad);
    }

    boolean hasBox() {
        return (type.equals(box) || type.equals(boxOnPad));
    }
    

    boolean isFree() {
        return (type.equals(empty) || type.equals(pad) || type.equals(gem));
    }

    void removeBox() {
        if (type.equals(box)) { type = empty; }
        else if (type.equals(boxOnPad)) {
          type = pad;
          padCount--;}
    }
     void removeTrooper() {
        if (type.equals(trooper)) { type = empty; }
    }
    
    void collectGem(){
    if (type.equals(gem)){ 
      type = empty;
      gemCount++;
    }
    }
    
boolean hasPad(){
return (type.equals(boxOnPad));
}

void solvePad(){
if (type.equals(boxOnPad)){
  padCount++;
  println("padcount: " +padCount);
}

}
//change cell type to contain box
    void addBox() {
        if (type.equals(empty)) { type = box; }
        else if (type.equals(pad)) { type = boxOnPad; padCount++;}
        else if (type.equals(gem)){ 
          type = box;
          gemCount++;
        }
    }


//draw cell at position
     void drawThis(int left, int top, int size) { 
      image(type, left, top, size, size);  
    }
}
