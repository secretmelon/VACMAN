/**/
/* MAZE INITIALISERS */
int xOffset = 60;
int yOffset = 90;
final int SIZE = 30;
private Cell[][] cells;
String [][] currentMaze;
Position playerPos, trooper1Pos, trooper2Pos, leftPad1, leftPad2, leftPad3, leftPad4;
int lives = 3, level = 1, gemCount = 0, totalGems, x, y, padCount = 0, totalPads, totalTroopers, leftPads;
PImage player, trooper, box, wall, pad, empty, boxOnPad, life, loser, gem;

/* WIN/LOSE SCREEN INITIALISERS */
int fade = 255; //weird
PFont bub, pix;
static final byte time = 3; 
static int sec, startTime;


/* | MAZES |
 *  # = wall, 
 *  e = empty, 
 *  s = pad, 
 *  b = box, 
 *  @ = player, 
 *  % = trooper, 
 *  * = gem, 
 *  ! = trap
 */
String [][] maze2 =
  { {"######################"}, 
  {"#*******@#**##*******#"}, 
  {"#*s##s#*##***#e##b##*#"}, 
  {"#*bebe#*#**#*#eebebe*#"}, 
  {"#*beeb#*%*##*#e#sbs#*#"}, 
  {"#*s##s#*#****#e#***#*#"}, 
  {"#*******#ee#e#eeses**#"}, 
  {"#########****#e#####%#"}, 
  {"#*#*#*#*#*#****#*****#"}, 
  {"#************#e#e#####"}, 
  {"##*#*#*#*#*#*###e#***#"}, 
  {"######ee#e***#*******#"}, 
  {"######################"}
}; 

String [][] maze1 = 
  { {"######################"}, 
  {"#@*******************#"}, 
  {"###################e##"}, 
  {"#*#**#***#*#***#ee*ee#"}, 
  {"#**#***#*#*#*#*#ee*e*#"}, 
  {"#***#**#***#*#*#bbbbb#"}, 
  {"##*be#e#####*#*#ee*ee#"}, 
  {"###**b***#***#*#bbbbb#"}, 
  {"##*be#ebb#*###*#eee*e#"}, 
  {"#***#*#*eb*#***#ee**b#"}, 
  {"#**#**######*#####*###"}, 
  {"#*e*e*e*e*e#*********#"}, 
  {"######################"}
};

// TEST MAZE - DEBUGGING PURPOSES ONLY
//String [][] maze1 = 
//  {{"#####"}, 
//  {"#@**#"}, 
//  {"#####"}, 
//};

//String [][] maze2 = 
//  {{"######"}, 
//  {"#@***#"}, 
//  {"######"}, 
//};
void settings(){
    size(780, 600);
}
void setup() {
  currLevel();
  frameRate(150);
  background(0);

  imageMode(CORNER);
  startTime = second() + time;

  /* IMAGES */
  player    = loadImage("player.png");     
  trooper   = loadImage("trooper.png");
  box       = loadImage("box.png");        
  wall      = loadImage("wall.png");
  pad       = loadImage("pad.png");        
  empty     = loadImage("empty.png");
  boxOnPad  = loadImage("box.png");        
  life      = loadImage("life.png");
  loser     = loadImage("loser.png");      
  gem       = loadImage("gem.png");
  
  /* FONTS */
  bub       = createFont("04B_30__.TTF", 30); 
  pix       = createFont("FiveByFive.ttf", 30);
  loadMaze();
}

//EVERYTHING IN draw() IS REFRESHED AT THE FRAMERATE INITIALISED IN setup()
void draw() {              
  if (!checkWin()) {        //check win returns true if all gems have been collected
    drawMaze();             //redraws 
    textAlign(CENTER, CENTER); 
    textFont(bub, 30);     //pick font
    fill(246,36,219);
    textSize(30);
    text("Vac-Man", 390, 50 );
    textFont(pix, 30);     //pick font
    textAlign(CENTER,BOTTOM);
    fill(255);
    textSize(20);
    text("use arrow keys to navigate", 390, 510 );
    text("ESC = Exit", 390, 530 );
    text("Evacuate by collecting all gems", 390, 550 );
    text("L2: Dismiss guards by solving the pads", 390, 570 );
    fill(254,213,70);
    text("THINK BEFORE YOU PUSH", 390, 590 );
    dismissGuards();
  } else if (checkWin() && level == 1){
    winScreen();
    //level++;
    }
  else {
    gameOver();
    println("the level: " + level);
  }
  }


void winScreen() {
  background(255);
  fade -= 2;
  if (fade > 0) {
    println("fade: " + fade);
    fill(246, 36, fade);   //change B value by int fade (light pink to red)      
    textAlign(CENTER, CENTER); 
    textFont(bub, 30);     //pick font
    textSize(90);
    text("Level", 390, 300 );
    text("Complete!", 390, 375 );
  } else {
    textFont(pix, 40);
    fill(0);
    text("Press ENTER to continue", 390, 300);
    text("or ESC to quit", 390, 340);
    if (keyCode == ESC) {
      exit();
    } else if (keyCode == ENTER) {
      level++;
      setup(); 
      draw();
    }
  }
}


void currLevel() {      //loads the maze array for the current level
  if (level == 1) {
    currentMaze = maze1;
  } else {
    currentMaze = maze2; 
    println("level: " + level);}
  }


void gameOver() {
  if (level ==2){
   background(255);
   fill(246, 36, 219);   //change B value by int fade (light pink to red)      
    textAlign(CENTER, CENTER); 
    textFont(bub, 30);     //pick font
    textSize(90);
    text("You won!", 390, 300 );
    textFont(pix, 30);
    fill(0);
    text("(you can leave now)", 390, 350);
    text("Press ESC", 390, 390);
    if (keyCode == ESC) {
      exit();
    }
  }

}

boolean checkWin() {
  if (gemCount == totalGems)return true;
  else return false;
}

//void drawLives() {
//  imageMode(CORNER);
//  if (lives > 0) {                           //if we still have lives,
//    int x = 60;                              //starting point of drawing lives is 60
//    for (int i = 0; i < lives; i++) {        //iterate through each life that is available
//      image(life, x, 60, SIZE, SIZE);        // and draw each life starting at point x
//      x += SIZE;                             // and add SIZE to x each time
//    }
//  } else {
//    lostGame();
//  }
//}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      movePush("left");
    } else if (keyCode == RIGHT) {
      movePush("right");
    } else if (keyCode == UP) {
      movePush("up");
    } else if (keyCode == DOWN) {
      movePush("down");
    } else if (keyCode == ENTER) {
      setup();
      draw();
    } else if (keyCode == ESC) {
      exit();
    }
  }
}

// DRAWS MAZE FROM LEVEL ARRAY 
void drawMaze() {
  background(0);
  for (int r = 0; r < cells.length; r++) {            //taking away cellslength //-1//
    for (int c = 0; c < cells[r].length; c++) {        //same here
      //println("r: " + r + ", c: " + c);
      drawCell(r, c);
    }
  }
  drawPlayer();
}


// DRAW CELL AT POS
private void drawCell(Position pos) {
  drawCell(pos.row, pos.col);
}

//DRAW CELL AT ROW,COL
private void drawCell(int row, int col) { 
  int left = xOffset+(SIZE * col);
  int top  = yOffset+(SIZE * row);
  //println("Top: " + top + ", Left: " + left + ", Row: " + row + ", Col: " + col);
  cells[row][col].drawThis(left, top, SIZE);
}

void movePush(String direction) {
  println("direction: " + direction);
  println(playerPos);
  Position nextP = playerPos.next(direction);  // where the player would move to
  Position nextNextP = nextP.next(direction);  // where a box would be pushed to
  if (cells[nextP.row][nextP.col].hasBox() && cells[nextNextP.row][nextNextP.col].isFree() ) { 
    push(direction);
  }
  // is the next cell free for the worker to move into?
  else if (cells[nextP.row][nextP.col].isFree()) { 
    move(direction);
  }
}

void move(String direction) {
  drawCell(playerPos);                   
  playerPos = playerPos.next(direction);  // put player in new position
  cells[playerPos.row][playerPos.col].collectGem();
  println(gemCount + " gems collected out of "+ totalGems);
  drawPlayer();
}

void push(String direction) {
  Position boxPos     = playerPos.next(direction);   // current box Position
  Position newBoxPos  = boxPos.next(direction);      // next box position
  cells[boxPos.row][boxPos.col].removeBox();         // remove box from current cell
  cells[newBoxPos.row][newBoxPos.col].addBox();      // place box in its new position
  drawCell(playerPos);                               // redisplay cell under worker
  drawCell(boxPos);                                  // redisplay cell without the box
  drawCell(newBoxPos);                               // redisplay cell with the box
  playerPos = boxPos;                                // put worker in new position
  drawPlayer();                                      // display worker at new position
}


//DRAW PLAYER AT POS
private void drawPlayer() {
  //background(0);
  int left = xOffset + (SIZE* playerPos.col); //took away xoffset +
  int top = yOffset+(SIZE* playerPos.row);    //and yoffset + 
  //smooth();
  //noStroke();
  //fill(246,36,219);
  //rect(left,top,SIZE,SIZE);   
  //filter( BLEND, 6 );
  image(player, left, top, SIZE, SIZE); 
  //blend(player, left, top, SIZE, SIZE, left-10, top-10, SIZE+10, SIZE, BLEND);
}

void dismissGuards() {
  //drawCell(trooperPos1);
  //first guard
  if (totalTroopers > 0 && padCount >= leftPads) { //remove && > if it doesnt work
    //if (padCount == leftPads) {
    if (cells[leftPad1.row][leftPad1.col].hasPad() &&
      cells[leftPad2.row][leftPad2.col].hasPad() &&
      cells[leftPad3.row][leftPad4.col].hasPad() &&
      cells[leftPad4.row][leftPad4.col].hasPad()) { 
      cells[trooper1Pos.row][trooper1Pos.col].removeTrooper();
    }
    //second guard
    if (padCount == totalPads) {
      cells[trooper2Pos.row][trooper2Pos.col].removeTrooper();
    }
  }
}


void loadMaze() {
  int rows         = currentMaze.length;                //number of maze cells going down (no. of arrays)
  char[] colLength = currentMaze[0][0].toCharArray();   //making the current row a line of chars, rather than a string
  int cols         = colLength.length;            //number of chars/cells in the row
  char[][] charMaze = new char[rows][cols];      //array of chars
  char[] currentLine = new char[cols];            //the current row of chars


  /*  This iterates through every character in the maze1 array
   *  and places it in a char array, instead of an array of strings.
   */
  for (int r = 0; r < rows; r++) {                  
    currentLine = currentMaze[r][0].toCharArray();        
    for (int c = 0; c < cols; c++) {
      charMaze[r][c] = currentLine[c];
    }
  }

  cells = new Cell[rows][cols];               //array of Cell objects with unique row and column specifications

  /* This iterates through every character in the newly made 'cells' array
   *  and recognises each one as a particular sprite.
   */
  for (int r = 0; r < rows; r++) {    
    for (int c = 0; c < cols; c++) {  
      //cells[r][c] = new Cell(empty); 
      char sprite =  charMaze[r][c];         //assigning each symbol in charMaze1 array to a sprite variable
      if (sprite=='e')   cells[r][c] = new Cell(empty);
      else if (sprite=='@') { 
        //cells[r][c] = new Cell(empty);
        cells[r][c] = new Cell(player);
        cells[r][c] = new Cell(empty);
        playerPos = new Position(r, c);
      } else if (sprite=='#') cells[r][c] = new Cell(wall);

      else if (sprite=='s') {
        totalPads++;       //all the pads
        if (c < 11) {
          leftPads++;
          if (leftPads == 1) {  //the first left group pad
            cells[r][c] = new Cell(pad);
            leftPad1 = new Position(r, c);
          } else if (leftPads == 2) {  //the second left group pad
            cells[r][c] = new Cell(pad);
            leftPad2 = new Position(r, c);
          } else if (leftPads == 3) {  //the third left group pad
            cells[r][c] = new Cell(pad);
            leftPad3 = new Position(r, c);
          } else if (leftPads == 4) {  //the fourth left group pad
            cells[r][c] = new Cell(pad);
            leftPad4 = new Position(r, c);
          }
        } else { 
          cells[r][c] = new Cell(pad);
        }
      } else if (sprite=='b') cells[r][c] = new Cell(box);     


      else if (sprite=='*') {
        cells[r][c] = new Cell(gem); 
        totalGems++;
      } else if (sprite=='%') { 
        totalTroopers++;
        if (totalTroopers == 1) {
          cells[r][c] = new Cell(trooper);
          trooper1Pos = new Position(r, c);
        } else if (totalTroopers == 2) {
          cells[r][c] = new Cell(trooper);
          trooper2Pos = new Position(r, c);
        }
      }

      //else if (sprite=='!') cells[r][c] = new Cell(trap);
      //still need to enter trooper into maze and here as well
      else print("invalid character at c: " + c + ", r: " + r);
    }
  }
}


//void trooperChase(){
//  float dx = playerPos.posX - trooper.posX;
//if (abs(dx) > 1) {
//  trooper.Position.posX += dx * easing;
//}

//float dy = foxY - houndY;
//if (abs(dy) > 1) {
//  houndY += dy * easing;
//}
//}
