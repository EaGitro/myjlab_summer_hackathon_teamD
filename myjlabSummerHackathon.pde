boolean right, left;
int time;
PImage beachImg, pocali, player1, player2, sun1, sun2, waterPic, chiliPepper, saltPic, bed;
ItemStock waterStock, pocaliStock, saltStock;
Player player;




// メーターのインスタンス
Meter saltMeter = new Meter(100, 100, 20, 50, 30, #00B5FA);
Meter waterMeter = new Meter(100, 100, 20, 90, 30, #E2FAD9);

void setup(){
  size(700,800);
  frameRate(200);
  print(frameRate);
  
  
  
  //背景画像
  beachImg = loadImage(sketchPath("image/beach.jpg"));
  
  //落下物の画像
  sun1 = loadImage(sketchPath("image/sun1.png"));
  sun2 = loadImage(sketchPath("image/sun2.png"));
  chiliPepper = loadImage(sketchPath("image/chiliPepper.png"));
  bed = loadImage(sketchPath("image/bed.png"));
  waterPic = loadImage(sketchPath("image/water.png"));
  pocali = loadImage(sketchPath("image/pocali.png"));
  saltPic = loadImage(sketchPath("image/salt.png"));
  
  //プレーヤー
  player1 = loadImage(sketchPath("image/player1.png"));
  player2 = loadImage(sketchPath("image/player2.png"));
  
  
  //プレーヤーインスタンス
  player = new Player(400, 700, 50, player1);

  droppingItems.add(new DroppingItem("sun1", true, -30, -20, sun1));
  droppingItems.add(new DroppingItem("sun2", true, -30, -20, sun2));
  droppingItems.add(new DroppingItem("chiliPeper", true, -20, 0, chiliPepper));
  droppingItems.add(new DroppingItem("bed", true, 40, 40, bed));
  droppingItems.add(new DroppingItem("water",false, 20, 0, waterPic));
  droppingItems.add(new DroppingItem("pocali", false, 10, 10, pocali));
  droppingItems.add(new DroppingItem("salt", false, 0, 20, saltPic));
  
  //アイテムストックのインスタンス
  waterStock = new ItemStock(droppingItems.get(4).name, droppingItems.get(4).water, droppingItems.get(4).salt,0,waterPic);
  pocaliStock = new ItemStock(droppingItems.get(5).name, droppingItems.get(5).water, droppingItems.get(5).salt, 0,pocali);
  saltStock = new ItemStock(droppingItems.get(6).name, droppingItems.get(6).water, droppingItems.get(6).salt,0,saltPic);
  
  
  
  
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
  
  //メーターの描画
  waterMeter.display();
  saltMeter.display();
  
  waterStock.display();
  pocaliStock.display();
  saltStock.display();
  
  
}
