float angle;
float concentration;
float viewOff;
int num;

PVector half = new PVector();
PVector mouse = new PVector();

PShape coral1;
PShape coral2;
PShape coral3;
//PShape coral4;
PShape coral5;

PShape shell1;
PShape shell2;
//PShape shell3;
PShape shell4;
PShape shell5;

PShape starfish1;
PShape starfish2;
PShape starfish3;
PShape starfish4;
PShape starfish5;

PShape jelly1;
PShape jelly2;
PShape squid1;
//PShape squid2;
PShape squid3;

PShape[][] myArray = {  {coral1, coral2, coral3, coral5},
                     {shell1, shell2, shell4, shell5},
                     {starfish2, starfish3, starfish4, starfish5},
                     {jelly1, jelly2, squid1, squid3}  };
                     
PImage img;
void setup() {
  size(1000, 1000, P3D);
  
  myArray[0][0] = loadfile("coral1.obj", 3);
  myArray[0][1] = loadfile("coral2.obj", 10);
  myArray[0][3] = loadfile("coral3.obj", 10);
  //coral4 = loadfile("coral4.obj", 10);
  myArray[0][2] = loadfile("coral5.obj", 10);
  
  myArray[1][2] = loadfile("shell1.obj", 7);
  myArray[1][1] = loadfile("shell2.obj", 22);
  //shell3 = loadfile("shell3.obj", 10);
  myArray[1][3] = loadfile("shell4.obj", 12);
  myArray[1][0] = loadfile("shell5.obj", 22);
  
  //starfish1 = loadfile("starfish1.obj", 10);
  myArray[2][0] = loadfile("starfish2.obj", 10);
  myArray[2][2] = loadfile("starfish3.obj", 10);
  myArray[2][1] = loadfile("starfish4.obj", 7);
  myArray[2][3] = loadfile("starfish5.obj", 10);

  
  myArray[3][0] = loadfile("Jellyfish.obj", 20);
  myArray[3][1] = loadfile("jellyfish2.obj", 20);
  myArray[3][2] = loadfile("squid1.obj", 5);
  //squid2 = loadfile("squid2.obj", 10);
  myArray[3][3] = loadfile("squid3.obj", 80);
  
                     
  angle = QUARTER_PI;
  viewOff = height * .86602;

  half.set(width * .5, height * .5);
  img = loadImage("bg.jpg");
}

void draw() {
  int num=50;
  //background(0xff000000);
  background(img);
  camera(0, 0, viewOff,
    0, 0, 0,
    0, 1, 0);

  lightSpecular(64, 64, 64);

  // Horizonal light.
  //spotLight(0, 127, 255,
  //  -half.x, sin(frameCount * .02) * half.y, 0, 1, 0, 0, PI, 25);

  spotLight(0, 127, 255,
    -half.x*0, -0.25 * half.y, 0, 0, 1, 0, PI, 8.50);
  
  // Vertical light.
  //spotLight(0, 255, 127,
  //  cos(frameCount * .02) * half.x, -half.y, 0,
  //  0, 1, 0,
  //  PI, 25);
  
   spotLight(0, 255, 127,
    -half.x*0, 0.25 * half.y, 0, 0, 1, 0, PI, 2.50);

   spotLight(0, 255, 127,
    -half.x*0, 0.25 * half.y, 0, 1, 0, 0, PI, 2.50);
  
   spotLight(255, 100, 100,
    0, 0, viewOff, -0.8, -0.8, -1, QUARTER_PI, 4.5);
    
  // Flash light.
  spotLight(255, 100, 0,
    0, 0, viewOff,
    mouse.x, mouse.y, -1,
    angle, concentration);
  for (int i = 0; i <4; i++) {
    for (int j = 0; j < 4; j++) {
      pushMatrix();
      translate(i*num*5-half.x+100, j*num*5-half.y+100);
      float ratio = (i*5  + j*3)/49.0;
      float angle = sin(millis() / 2000.0 +  ratio * (PI/2)) * PI;
      rotateX(angle);
      rotateY(angle);
      
      
       shape(myArray[j][i]);
       
     //pieta.rotateY(.01);
      popMatrix();
    }
  }

  concentration = map(cos(frameCount * .01), -1, 1, 12, 100);
  mouse.set(mouseX - half.x, mouseY - half.y, viewOff);
  mouse.normalize();
  saveFrame();
}

PShape loadfile(String filename, float scale) {
  PShape shape;
  shape = loadShape(filename);
  shape.setFill(0xffffffff);
  shape.setSpecular(0xfffff7d5);
  shape.scale(scale);
  //shape.rotateY(PI/2);
  //shape.rotateX(PI/2);
  return(shape);
}
