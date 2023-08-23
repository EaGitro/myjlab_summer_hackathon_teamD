boolean right, left;
int time;
PImage beachImg;

void setup(){
  size(700,800);
  frameRate(200);
  print(frameRate);
  //beachImg = loadImage("beach.jpg");
  
}

void draw(){
  time += 3;
  background(0);
  
  //背景
  //image(beachImg,0,0,width,height);
  
  
  //落下物の生成、動き
  geneDropping();
  moveDropping();
  
  //プレイヤーの描画、動き
  player.display();
  player.move();
  player.hitpoint();
  
  //衝突感知
  collisionDetect();
  
  
}
