//Kaif Momin
//Summative Project
/*
This is a day to day city. It has local trafic, buildings and more. To go from day to night, click on the sun or moon, which ever is showing. 
 When it is night, you can turn the building lights on by cliking on the 'w' key, if it is day, it will not work. There is a  street sign in the grass
 which is located at the bottom left corner of the screen, if you right click it, the sign will become bigger so you can read the street name. 
 IT WILL ONLY SHOW FOR 2 SECONDS. Both, when day and night, you will see a plane flying. The height of this plane can be controled by the up and down arrow 
 keys, the plane will not fly out of the screen and it will not crash into the ground. Just for fun, ther is a secret key that when you press it, something funny will
 happen. GOOD LUCK FINDING IT...**giggle****giggle**
 
 CRITERIA:
 3 Different Shapes -> Excellent
 --Circle-sun, moon, door arch
 --Rectangle-buildings, windows road
 --Triangle-street sign
 --line-road lines, sun rays
 1 Custom Shape -> Excellent
 --Plane flying
 --Statue
 3 Different Colours -> Excellent
 --Yellow
 --Red
 --Blue
 --grey-many shades
 --white
 --green
 --maroon
 --pink
 --black
 6 Elements -> Excellent
 --2 Clouds-they move with a if statement
 --plane that moves
 --3 main building with detail
 --sun and moon transformation of scene
 --images-tree, bush, car, spinning door
 --sign
 --windows that change colour
 2 Alive Elements -> Excellent
 --Cars type 1
 --Cars type 1
 --plane
 --clouds
Mouse Control -> Excellent
--Click sun to become night
--Click moon to become day
--Right click street sign to expand
KeyBoard Control
--'w' key to turn window light on
--up and down arrow keys to move plane around
--secret key that you need to find
Communication
--comment were written in a way that a non-coder can understand. They are direct translations from code to understandable english.Cod on almost all the lines
*/

//****************************************************************************//
//****************************************************************************//
boolean day = true;  //this variable will decide if it is day, if this variable is false, it will show the night scene.
boolean windowLight = false;  //this variable will decide if the window light is on or off, if this variable is false, then the window lights will be off (set to white).
boolean dropPoop = false;
int stars = 250;
int cloudXPos1 = 600;  //first cloud position
int cloudXPos2 = 0;  //second cloud position
int starsPos = 0;
int firstCarx = 0;
int secondCarx = 0;
int poopXPos = -100;
int poopYPos = -100;
int signLife;  //stores millis for sign to stay
int planePosx = 0;  //plane x-position 
int planePosy = 0;  //plane y-position
PImage google;  //google represents the google logo image
PImage cloud;  //cloud represents the cloud image
PImage tree;  //tree represents the tree image
PImage bush;  //bush represents the bush image
PImage spindoor;  //spinning door for building 125
PImage car1;  //car1
PImage car2;  //car1
PImage poop;  //poop emoji
PImage smoke;  //smoke from building
//****************************************************************************//
//****************************************************************************//
void setup() {
  size(1200, 900);  //Sets the size of the canvas
  google = loadImage("google.jpg");  //loads the google image from the same folder
  cloud = loadImage("cloud.1.jpg");  //loads the cloud image from the same folder
  tree = loadImage("tree.png");  //loads the tree image from the same folder
  bush = loadImage("bush.png");  //loads the bush image from the same folder
  spindoor = loadImage("spinning_door.png");  //loads the spinning door image from the same folder
  car1 = loadImage("car1.png");  //loads car image from the same folder
  car2 = loadImage("car2.png");  //loads car image from the same folder
  poop = loadImage("poop.png");  //loads the poop emoji image
  smoke = loadImage("smoke.png");  //loads smoke picture
}
//****************************************************************************//
//****************************************************************************//

void drawPlane(int x, int y) {  //function used to simplfy void draw section
  //PLANE
  stroke(0);
  strokeWeight(2);
  fill(200);
  beginShape();
  //plane drawing, when up or down arrows are clicked, the y value will change depending on the corresponding key
  vertex(0+planePosx, 125+planePosy);  //planePosx for the non-stop movement, planePosy to move the plane up and down with arrow keys
  vertex(0+planePosx, 100+planePosy);  //planePosx for the non-stop movement, planePosy to move the plane up and down with arrow keys
  vertex(10+planePosx, 100+planePosy);  //planePosx for the non-stop movement, planePosy to move the plane up and down with arrow keys
  vertex(25+planePosx, 125+planePosy);  //planePosx for the non-stop movement, planePosy to move the plane up and down with arrow keys
  vertex(80+planePosx, 122+planePosy);  //planePosx for the non-stop movement, planePosy to move the plane up and down with arrow keys
  vertex(115+planePosx, 150+planePosy);  //planePosx for the non-stop movement, planePosy to move the plane up and down with arrow keys
  vertex(0+planePosx, 150+planePosy);  //planePosx for the non-stop movement, planePosy to move the plane up and down with arrow keys
  vertex(0+planePosx, 125+planePosy);  //planePosx for the non-stop movement, planePosy to move the plane up and down with arrow keys
  endShape();
  fill(255);
  stroke(0);
  strokeWeight(2);
  //makes the windows for the plane
  for (int i = 0; i < 4; i++) {  // i is made equal to 0, only 4 windows will be drawn, add 1 to i each time
    fill(100, 200, 200);
    stroke(0);
    strokeWeight(2);
    rect(x + 20 + i * 20, y + 135, 10, 10);  //draws window based on plane position that are 10px by 10px
  }
}


void draw() {

  //If it is day, draw blue sky, clouds and the sun, grass else draw the night sky and the moon.
  if (day) {
    background(88, 175, 237);  //Blue sky
    //CLOUDS
    image(cloud, cloudXPos1, 50, 500, 250);  //cload in the day
    image(cloud, cloudXPos2, 15, 400, 200);  //cload in the day
    cloudXPos1 ++;  //cloud moves two pixels
    cloudXPos2 ++;  //cloud moves 2 pixels
    if (cloudXPos1 >= 1200) {  //when the first cloud goes outside the screen
      cloudXPos1 = -500;  //start back from the beginning
    }
    if (cloudXPos2 >= 1200) {  //when the second cloud goes outside the screen
      cloudXPos2 = -500;  //start back from the beginning
    }

    //SUN
    stroke(0);
    fill(245, 201, 5);  //Yellow for sun
    ellipse(1200, 0, 200, 200);  //circle for sun in top right corner
    stroke(245, 201, 5);
    strokeWeight(10);
    line(1100, 5, 1010, 5);      //sun ray 1
    line(1115, 35, 1025, 65);    //sun ray 2
    line(1130, 65, 1055, 125);   //sun ray 3
    line(1165, 85, 1120, 170);   //sun ray 4
    line(1195, 95, 1195, 185);   //sun ray 5
  } else {
    background(0);

    //MOON
    noStroke();
    fill(255);
    ellipse(1100, 100, 150, 150);  //circle for the moon
    stroke(255);
    strokeWeight(5);

    //Stars
    pushMatrix();  //to contain this code
    stroke(255);
    strokeWeight(3);
    randomSeed(7);  //to spawn random point for stars only once
    //loop for stars
    for (int i = 0; i < stars; i++) { //as long as i is smaller than the amount to be drawn 
      float xpos = random(0, width); //random value between 0 and width
      float ypos = random(0, height);//random value between 0 and height 
      point(xpos, ypos); //draw point
    }
    popMatrix();  //end of containment
  }

  //GRASS
  fill(67, 115, 41);
  noStroke();
  rect(0, 750, 1200, 50);

  //PLANE
  //This calls the draw plane function and draws a plane on the screen
  drawPlane(planePosx, planePosy);
  if (planePosx >= 1200) {  //when the plane goes outside the screen
    planePosx = -500;  //start back from the beginning
  }
  planePosx += 3;  //add 3px to the x position every frame

  //ROAD
  //The section draws the road. 
  fill(40);  //gray fill for road
  noStroke();  //nostroke on the road
  rect(0, 800, 1200, 100);  //rectangle for road
  //the for loop below is for the dotted lines and the solid line seperating the lanes on a road
  strokeWeight(5);
  stroke(245, 201, 5);
  line(0, 850, 1200, 850);
  strokeWeight(2);
  stroke(255);
  for (int i = 0; i <= 1200; i += 30) {
    line(i, 825, i+15, 825); //there is a 15px space between all the lines
    line(i, 875, i+15, 875); //there is a 15px space between all the lines
  }

  //BUILDING 123
  fill(186, 157, 115); //building colour
  stroke(0);
  strokeWeight(2);
  rect(100, 150, 210, 600);//main building shape
  rect(132.5, 100, 150, 50); //middle rectangle of the building
  rect(158, 50, 100, 50);//top rectangle of the building
  noStroke();
  image(google, 143, 102, 130, 60); //building name-google
  stroke(0); //black stroke for the arch above window
  strokeWeight(2);
  fill(110, 40, 0);
  ellipse(205, 675, 100, 75);  //arch above door
  fill(255); //colour for the building number
  textSize(25); //font size for number
  text("123", 182, 668);  //building number
  fill(139, 69, 19);  // colour for door
  rect(155, 675, 50, 75);  //door 1
  rect(205, 675, 50, 75);   //door 2
  fill(218, 165, 32);  //colour for door knob
  strokeWeight(1);
  ellipse(190, 705, 10, 10);  //door knob 1
  ellipse(220, 705, 10, 10);  // door knob 2
  //Draws the windows
  if (windowLight) {  //if window light is true
    fill(265, 252, 71);  //make windows yellow
  } else if (!day) {  //if night
    fill(0);  //make windows black
  } else {  //if day
    fill(255);  // make windows white
  }
  noStroke();
  //This loop runs for each row of windows
  for (int i = 0; i < 7; i++) {
    //This loops for each window in a specific row
    for (int x = 0; x < 5; x++) {
      rect(110 +(40*x), 160 + (65*i), 30, 50);
    }
  }

  //BUILDING 125
  fill(176, 168, 165); //building colour
  stroke(0);
  strokeWeight(2);
  rect(350, 500, 380, 250);//main building shape
  image(smoke, 680, 148, 100, 200);
  fill(75);
  stroke(255);
  strokeWeight(2);
  //shape for the air vetilation system
  beginShape();
  vertex(545, 498);
  vertex(545, 448);
  vertex(695, 448);
  vertex(695, 348);
  vertex(715, 348);
  vertex(715, 448);
  vertex(725, 448);
  vertex(725, 498);
  endShape(CLOSE);
  //Draws the windows
  if (windowLight) {  //if window light is true
    fill(265, 252, 71);  //make windows yellow
  } else if (!day) {  //if night make windows black
    fill(0);  //make windows black
  } else {  //if day
    fill(255);  //make windows white
  }
  stroke(2);
  //This loop runs for each row of windows
  for (int i = 0; i < 2; i++) {
    //This loops for each window in a specific row
    for (int x = 0; x < 4; x++) {
      rect(360 +(100*x), 510 + (30*i), 30, 30);
      rect(390 +(100*x), 510 + (30*i), 30, 30);
    }
  }
  rect(360, 580, 360, 50);  //long window
  for (int i = 0; i <= 350; i += 51.75) {  //for loop for the line for the long window
    line(360+i, 580, 360+i, 630);  //lines for the long window
  }
  image(spindoor, 395, 653, 200, 95);
  fill(255); //colour for the building number
  textSize(50); //font size for number
  text("125", 620, 685);  //building number

  //BUILDING 127
  fill(186, 84, 61);
  stroke(0);
  strokeWeight(2);
  rect(860, 200, 300, 550);
  stroke(0); //black stroke for the arch above door
  strokeWeight(2);
  fill(110, 40, 0);
  ellipse(940, 675, 100, 75);  //arch above door
  fill(255); //colour for the building number
  textSize(25); //font size for number
  text("127", 915, 668);  //building number
  fill(139, 69, 19);  // colour for door
  rect(890, 675, 50, 75);  //door 1
  rect(940, 675, 50, 75);   //door 2
  fill(218, 165, 32);  //colour for door knob
  strokeWeight(1);
  ellipse(930, 705, 10, 10);  //door knob 1
  ellipse(950, 705, 10, 10);  // door knob 2
  noStroke();
  //Draws the windows
  if (windowLight) {  //if window light is true
    fill(265, 252, 71);  //fill yellow
  } else if (!day) {  //if not day
    fill(0);  //fill black
  } else {  //if day fill white
    fill(255);
  }
  //This loop runs for each row of windows
  for (int i = 0; i < 6; i++) {
    //This loops for each window in a specific row
    for (int x = 0; x < 7; x++) {
      rect(875 +(40*x), 210 + (65*i), 30, 50);
    }
  }

  //NATURE
  tint(67, 115, 41);
  image(tree, 280, 650, 90, 130);  //tree between building 123 and 125
  noTint();
  image(bush, 600, 695, 100, 60);  //bush infront building 125

  //STREET SIGN
  stroke(192, 192, 192);  //sliver colour for street sign pole
  strokeWeight(5);  //pole size
  line(50, 680, 50, 780); //pole
  stroke(0); //black outline for sign
  strokeWeight(2); //stroke size
  fill(59, 115, 33); //green colour for sign
  rect(25, 670, 50, 15); //street sign
  strokeWeight(1);
  triangle(76, 670, 76, 685, 82.5, 677.5);
  strokeWeight(2);
  textSize(9);
  fill(255);
  text("CARL Ave", 30, 680);
  if (signLife >= millis()) {   //if time of click is smaller then 2 seconds in the future, show a big sign
    fill(59, 115, 33);
    rect(200, 100, 800, 300);
    textSize(150);
    fill(255);
    text("CARL Ave", 250, 300);
  }


  if (firstCarx < 0) {  //when variable firstCarx is smaller then 0 
    firstCarx = firstCarx + 1; //add one to the value of the variable firstCarx
    for (int x = firstCarx; x <= 1200; x += 50) { //loops the car and make more to fit on the screen
      x = x++;
      image(car1, x, 805, 25, 15);
      image(car1, x+30, 830, 25, 15);
    }
  } else {
    firstCarx = -1200;
  }
  if (secondCarx > 0) {  //when variable firstCarx is smaller then 0 
    secondCarx = secondCarx - 1; //add one to the value of the variable secondCarx
    for (int y = secondCarx; y >= -25; y -= 50) { //loops the car and make more to fit on the screen
      y = y--;
      image(car2, y, 855, 25, 15);
      image(car2, y- 30, 880, 25, 15);
    }
  } else {
    secondCarx = 4800;
  }

  //STATUE
  fill(120, 16, 38);  //colour of statue
  stroke(0);
  strokeWeight(2); //border on statue
  beginShape();
  vertex(780, 750);
  vertex(780, 680);
  vertex(800, 650);
  vertex(800, 625);
  vertex(810, 625);
  vertex(810, 650);
  vertex(830, 680);
  vertex(830, 750);
  vertex(780, 750);
  vertex(805, 680);
  vertex(830, 750);
  vertex(805, 680);
  vertex(780, 680);
  vertex(830, 680);
  endShape();

  //POOP DROP
  if (dropPoop) {  //If the poop is in flight, this will update the x and y position of the poop image
    poopYPos += 8;
    poopXPos += 3;
  }
  if (poopYPos > 950) {  //If the poop emoji is off the screen, it will move it "back to the plane" and the plane will be reloaded with fresh poop which will be ready to drop
    dropPoop = false;
    poopYPos = -100;
    poopXPos = -100;
  }

  image(poop, poopXPos, poopYPos, 50, 50);  //This draws the poop emoji
}
//****************************************************************************//
//****************************************************************************//
void mousePressed() {
  if (mouseButton == LEFT) {  //when left button clicked
    if (day) {  //if it is day then,
      //Check if sun is clicked
      if (dist(mouseX, mouseY, 1200, 0) <= 100) {
        day = false;  //if it is clicked make it night
      }
    } else {  //if night then,
      //Check if moon is clicked
      if (dist(mouseX, mouseY, 1100, 100) <= 75) {
        day = true;  //if it is clicked make it day
        windowLight = false;  //don't allow window lights to turn on
      }
    }
  }

  if (mouseX <= 75  &&  mouseX >= 25  &&  mouseY <= 685  &&  mouseY >= 670) {  //if you right click on the street sign
    if (mouseButton == RIGHT) {
      signLife = millis() + 2000; //sets time to 2000 millis in the future
    }
  }
}

void keyPressed() {
  if (!day) {  // 'w' key to make lights on only works when it is not day
    if (key == 'w') {
      windowLight = !windowLight; //Change the windowLight to its opposite value.
    }
  }

  if (key == 'p' && poopXPos == -100) {  //If p is pressed and the poop is "loaded" it will drop the poop emoji from the plane.
    dropPoop = true;
    poopXPos = planePosx + 15;
    poopYPos = planePosy + 140;
  }

  //CONTROLS FOR THE PLANE
  if (key == CODED) {
    if (keyCode == UP && planePosy > -100) {  //when up arrow is pressed move up
      planePosy--;
    }
    if (keyCode == DOWN && planePosy < 500) {  //when down arrow is pressed move down
      planePosy++;
    }
  }
}
