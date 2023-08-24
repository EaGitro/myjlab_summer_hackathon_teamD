boolean right, left;
int time;
PImage beachImg;

void setup(){
  size(700,800);
  frameRate(200);
  print(frameRate);
  
  ItemStock items = new ItemStock("pocali",70,50,0);
  ItemStock items = new ItemStock("water",100,0,0);
  ItemStock items = new ItemStock("salt",0,100,0);
  
  droppingItems.add(new DroppingItem("running", true, 10, 10));
  droppingItems.add(new DroppingItem("chiliPeper", true, 20, 0));
  droppingItems.add(new DroppingItem("meteor", true, 30, 20));
  droppingItems.add(new DroppingItem("bed", true, -40, -40));
  droppingItems.add(new DroppingItem("water",false, -20, 0));
  droppingItems.add(new DroppingItem("pocali", false, -10, -10));
  droppingItems.add(new DroppingItem("salt", false, 0, -20));
  
  beachImg = loadImage("beach.jpg");
  
}

void draw(){
  time += 3;
  background(0);
  
  //背景
  image(beachImg,0,0,width,height);
  
  
  //落下物の生成、動き
  geneDropping();
  moveDropping();
  
  //プレイヤーの描画、動き
  player.display();
  player.move();
  
  //衝突感知
  collisionDetect();
  
  
}
