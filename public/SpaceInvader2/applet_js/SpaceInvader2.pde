Spaceship ship1 = new Spaceship(mouseX, mouseY);
Alien[] aliens = new Alien[10];
Shoot bullet = new Shoot(mouseX, mouseY);
boolean halfway = false;

void setup() {
  size(600, 400);
  for (int i=0; i < aliens.length; i++) {
    aliens[i] = new Alien();
  }

}

void draw() {
  background(0);
  fill(255);
text("Press spacebar to change directions", 200, 20, 400, 20);
if(keyPressed){
  halfway = !halfway;
}

 

if(halfway ==false){
  ship1.display(mouseX, mouseY, pmouseX, pmouseY); 

if(bullet.moving){
  bullet.bullet();
}
}
else{
ship1.display2(mouseX, mouseY, pmouseX, pmouseY);

if(bullet.moving){
  bullet.bullet2();
}
}
  for (int i=0; i < aliens.length; i++) {
    aliens[i].display();
    aliens[i].mov();
    
   if(bullet.hit(aliens[i])){
      aliens[i].burst();
    }
  }
}
 void mousePressed() {

bullet.start();   
   

}
  




class Alien {

  int x, y;   // Variables for location of alien
  float speed; // Speed of alien
  color c;
  float r;     // Radius of alien

  Alien() {
    r = random(15, 30);               
    x = int(random(width));     
    y = int(random(height));              
    speed = random(1, 4);   // Pick a random speed
   
  }

  // Move the alien down
  void mov() {
    // Increment by speed
    y += speed;
    
    if(y > height || y < 0){
      speed = speed*-1;
    }
  }



  // Display the alien
  void display() {
     c = color(0, random(50, 255), random(0, 200));
    fill(c);
    noStroke();
    ellipse(x, y, r, r);
    rect(x+r/2, y, 30, 1);
    rect(x-r/2, y, 30, 1);
    fill(255);
    ellipse(x-5, y-3, r/4, r/4);
    ellipse(x+5, y-3, r/4, r/4);
    fill(0);
    ellipse(x-5, y-3, r/8, r/8);
    ellipse(x+5, y-3, r/8, r/8);

  }

  // if alien is hit
  void burst() {
    
    stroke(255);
    strokeWeight(4);
    line(x+r/2, y, x+r/2+20, y);
    line(x+r/2, y+r/2, x+r/2+20, y+r/2+20);
  line(x, y+r/2, x, y+r/2 + 20);
line(x-r/2, y+r/2, x-r/2-20, y+r/2+20);
line(x-r/2, y, x-r/2-20, y);
line(x-r/2, y-r/2, x-r/2-20, y-r/2-20);
line(x, y-r/2, x, y-r/2-20);
  y += height+10;
  speed=0;
  }
  }


class Shoot{ //class for bullet
  
 float x;
 float y;
float xspeed; 
boolean moving=false;
  
  Shoot(float mx, float my) {
 

  }
  
void start(){
     x = mouseX+20;
    y = mouseY+10;
    xspeed = 5;
    
  moving = true;
 
  
}
  
void bullet(){  
display();
mov();
  }
 
 void bullet2(){  
display();
mov2();
  }
   
  void display(){

    
  rectMode(CENTER);
    stroke(255);
   fill(0, 0, 255);
    rect(x, y, 10, 5);
  }
  
  void mov() {
    
 x= x + xspeed;
 if (x > width) {
   moving =false;
 }
  
}

void mov2() {
  
  x = x-xspeed;
  if (x < 0) {
    moving = false;
  }
}

  
  
  boolean hit(Alien a) {
   
    if (x < a.x+a.r/2 && x > a.x-a.r/2 && y < a.y+a.r/2 && y > a.y-a.r/2) {  //if bullet hits an alien
      return true;
    } else {
      return false;
    }
  
}
}
class Spaceship {
  float x; //location
  float y; //location
  float xspeed; //speed

    Spaceship(float mx, float my) {
    x = mx;
    y = my;
    xspeed=0;
  }

  void display(float mx, float my, float px, float py) {
    smooth();


    noStroke();
    rectMode(CENTER);
    fill(150);
    ellipseMode(CENTER);
    ellipse(mx, my, 75, 20);
    fill(200);
    rect(mx+20, my+10, 15, 2);
    fill(0, 255, 255);
    ellipse(mx-30, my-8, 8, 15);
    ellipse(mx-30, my+8, 8, 15);
    fill(0, 0, 255);
    triangle(mx+20, my-10, mx+20, my-5, mx, my-5);
    stroke(255);
    line(mx-25, my-8, px-25, my-8);
    line(mx-25, my+8, px-25, my+8);
  }

 
  
 void display2(float mx, float my, float px, float py) {
    smooth();


    noStroke();
    rectMode(CENTER);
    fill(150);
    ellipseMode(CENTER);
    ellipse(mx, my, 75, 20);
    fill(200);
    rect(mx-20, my+10, 15, 2);
    fill(0, 255, 255);
    ellipse(mx+30, my-8, 8, 15);
    ellipse(mx+30, my+8, 8, 15);
    fill(0, 0, 255);
    triangle(mx-20, my-10, mx-20, my-5, mx, my-5);
    stroke(255);
    line(mx+25, my-8, px+25, my-8);
    line(mx+25, my+8, px+25, my+8);
  }
}


