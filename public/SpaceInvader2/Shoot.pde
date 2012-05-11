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
