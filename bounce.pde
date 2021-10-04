float a = 0.2;
float speed = 0.5;
float xspeed =5;// random(3,5)*pow(-1,(int)random(1,2));
float y=200;
float x=400;
int score=0;
int timer;

void setup() {
  noCursor();
  size(800, 1000);
  strokeWeight(10);
  background(0, 0, 255);
}
void draw() {
  if (millis()<5000) {
    background(0, 0, 255);
    timer = 5-millis()/1000;
    textSize(60);
    ellipse(x, y, 200, 200);
    text("Début dans "+timer, 200, 500);
    textSize(40);
    text("Restez dans le cercle !", 180, 700);
    ellipse(mouseX, mouseY, 30, 30);
  } else {
    background(0);
    textSize(45);
    stroke(0, 0, 0);
    if (abs(mouseX - x) > 100 || abs(mouseY-y) > 100) {
      stroke(255, 0, 0);
    } else {
      score++;
    }
    strokeWeight(0); // Score et Timer
    fill(0, 255, 0);
    rect(0, 0, 150, 70);
    fill(0, 0, 255);
    rect(700, 0, 120, 70);
    fill(255, 255, 255);
    text(score, 10, 50);
    text(timer, 720, 50);
    strokeWeight(10); //Balle + curseur
    ellipse(x, y, 200, 200);
    ellipse(mouseX, mouseY, 30, 30);
    if (y > 899 && speed > 0) {
      speed = speed * -0.99;
    }
    if ((x > 699 && xspeed > 0) || (x < 101 && xspeed < 0)) {
      xspeed = xspeed * (-1) + (xspeed/abs(xspeed))*score/-1100;//random(-0.5,-0.2);
    }
    fill(0, 255, 0);
    text((int)abs(xspeed)-4, x-16, y+15); // Vitesse de la balle
    timer = 35 - millis()/1000;
    x = x + xspeed;
    y = y + speed;
    speed = speed + a;
    if (timer < 0) {
      background(255, 255, 255);
      textSize(60);
      fill(0, 0, 0);
      text("Score final : "+score, 170, 500);
      ellipse(mouseX, mouseY, 30, 30);
      x=-200;
      y=-200;
      speed = 0;
      xspeed = 0;
    }
  }
}
