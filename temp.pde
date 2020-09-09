//String [][] maze1 =
//  { {"######################"}, //# = wall, e = empty, s = pad, b = box, @ = player, % = trooper, * = gem, ! = trap
//    {"#eeeeeeee#ee##eeeeeee#"}, 
//    {"#es##s#e##eee#e##b##e#"}, 
//    {"#ebebe#e#ee#e#eebebee#"},
//    {"#ebeeb#eee##e#e#sbs#e#"},
//    {"#es##s#e#eeee#e#eee#e#"},
//    {"#eeeeeee#ee#e#eesesee#"},
//    {"#########eeee#e#####e#"},
//    {"#e#e#e#e#e#eeee#eeeee#"},
//    {"#eeeeeeeeeeee#e#e#####"},
//    {"##e#e#e#e#e#e###e#eee#"},
//    {"######ee#e@ee#eeeeeee#"}, //moved @ one to left
//    {"######################"}
//  };
  
//String [][] maze0 = 
//  { {"######################"}, 
//    {"#@*******************#"}, 
//    {"###################e##"}, 
//    {"#*#ee#eee#e#***#ee*ee#"}, 
//    {"#**#eee#e#e#*#*#ee*e*#"}, 
//    {"#***#ee#eee#*#*#bbbbb#"}, 
//    {"##ebe#e#####*#*#ee*ee#"}, 
//    {"###eebeee#***#*#bbbbb#"}, 
//    {"##ebe#ebb#*###*#eee*e#"}, 
//    {"#***#*#eeb*#***#ee**b#"}, 
//    {"#**#**######*#####*###"},
//    {"#eeeeeeeeee#********%#"},
//    {"######################"}
//  };

//void draw() {
//  background(255);
//  //render();
  

//  //for (int posX = xOffset; posX < cols*SIZE; posX += SIZE) {     //position X going across
//  //  for (int posY = yOffset; posY < rows*SIZE; posY += SIZE) {   //position Y going down

//  //  char sprite = maze1[r][c].charAt(c);
//  //  /*wall*/      if (sprite == '#') { 
//  //    wallPos.x = posX; 
//  //    wallPos.y = posY;
//  //    image(wall, posX, posY, SIZE, SIZE);
//  //  } 
//  //  /*pad*/      else if (maze1.charAt(posY).equals("s")) {
//  //    padPos.x = posX; 
//  //    padPos.y = posY;
//  //    image(pad, posX, posY, SIZE, SIZE);
//  //  } 
//  //  /*player*/      else if (maze1.charAt(posY).equals("@")) {
//  //    playerPos.x = posX; 
//  //    playerPos.y = posY;
//  //    image(player, playerPos.x, playerPos.y, SIZE, SIZE);
//  //  } 
//  //  /*box*/      else if (maze1.charAt(posY).equals("b")) {
//  //    boxPos.x = posX; 
//  //    boxPos.y = posY;
//  //    image(box, posX, posY, SIZE, SIZE);
//  //  }
//  //}
//}
////  }
////}
////cells = new Cell[rows][];




//boolean hitWall(){}




//line 203-215
//  for (int r = 0; r < rows; r++) {  //taking away rows-1
//    for (int c = 0; c < cols; c++) {   //same here
//      //println("c:" + c, ", r: " + r);
//      //char[] mazeline = maze1[r][c].toCharArray();
//      //cells[r]= new Cell[cols];
//      //print("Cols: " + cols + ", r: " + r + ", c: " + c);
//      //print(sprite);
//    }
//    //println();
//  }

//  println("Cells Width: " + cells[0].length + ", Cells Height: " + cells.length);
//  println("Cells[0][0]: " + cells[0][0].toString());      //NPE ERROR











//void render() {
//  for ( int i = -1; i < 2; i++) {
//    for ( int j=-1; j < 2; j++) {
//      pushMatrix();
//      translate(x + (i * width), y + (j*height));
//      if ( direction == -1) { 
//        rotate(PI);
//      }
//      if ( direction2 == 1) { 
//        rotate(HALF_PI);
//      }
//      if ( direction2 == -1) { 
//        rotate( PI + HALF_PI );
//      }
//      arc(0, 0, radius, radius, map((millis() % 500), 0, 500, 0, 0.52), map((millis() % 500), 0, 500, TWO_PI, 5.76));
//      popMatrix();
//    }
//  }
//}
