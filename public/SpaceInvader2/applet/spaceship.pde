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

