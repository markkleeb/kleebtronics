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

if(mouseX > width/2){
  halfway = true;
}
else{
  halfway =false;
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
  




