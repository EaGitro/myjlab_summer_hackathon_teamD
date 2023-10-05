import ddf.minim.*;

boolean right, left, waiting, dead;
int time;
float v;
PImage beachImg, pocali, player1, player2, sun1, sun2, waterPic, chiliPepper, saltPic, bed, sunlight, lie;
ItemStock waterStock, pocaliStock, saltStock;
Player player;

Minim minim;
AudioPlayer punch, restore, getitem, restore2, Martian_Vassals;

final float WATER_AMOUNT_DECREASE = -0.04; // waterMeter.change() in myjlabSummerHackathon.pde
final float SALT_AMOUNT_DECREASE = -0.1;  // saltMeter.change() in player.pde, keyPressed() 

final float PLAYER_MOVEMENT_AMOUNT_FAST = 7.5; // player.move() in player.pde 
final float PLAYER_MOVEMENT_AMOUNT_SLOW = 4.5; // player.move() in player.pde 


// メーターのインスタンス
Meter saltMeter;
Meter waterMeter;

//スタッキングリスト
StockingList stockingList = new StockingList(6);

void setup(){
  size(800,850);
  frameRate(200);
  PFont font = createFont("Meiryo", 50);
  textFont(font);
  print(frameRate);
  
  dead = false;
  waiting = true;
  
  //効果音ども
  minim = new Minim(this);
  punch = minim.loadFile("sound/punch.mp3");
  restore = minim.loadFile("sound/restore.mp3");
  getitem = minim.loadFile("sound/get.mp3");
  restore2 = minim.loadFile("sound/restore2.mp3");
  //BGM
  Martian_Vassals = minim.loadFile("sound/Martian_Vassals.mp3");
  
  saltMeter = new Meter(100, 100, 20, 50, 30, #E2FAD9);
  waterMeter = new Meter(100, 100, 20, 90, 30, #00B5FA);

  
  
  
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
  
  //プレーヤー画像
  player1 = loadImage(sketchPath("image/player1.png"));
  player2 = loadImage(sketchPath("image/player2.png"));
  
  //ゲームオーバー画像
  sunlight = loadImage(sketchPath("image/sunlight.jpg"));
  lie = loadImage(sketchPath("image/lie.png"));
  
  //プレーヤーインスタンス
  player = new Player(400, 700, 50, player1);

  droppingItems.add(new DroppingItem("sun1", true, -30, -20, sun1, punch));
  droppingItems.add(new DroppingItem("sun2", true, -30, -20, sun2, punch));
  droppingItems.add(new DroppingItem("chiliPeper", true, -20, 0, chiliPepper, punch));
  droppingItems.add(new DroppingItem("bed", true, 40, 40, bed, restore));
  droppingItems.add(new DroppingItem("water",false, 20, 0, waterPic, restore));
  droppingItems.add(new DroppingItem("pocali", false, 10, 10, pocali, restore));
  droppingItems.add(new DroppingItem("salt", false, 0, 20, saltPic, restore));
  
  //アイテムストックのインスタンス
  waterStock = new ItemStock(droppingItems.get(4).name, droppingItems.get(4).water, droppingItems.get(4).salt,0, waterPic);
  pocaliStock = new ItemStock(droppingItems.get(5).name, droppingItems.get(5).water, droppingItems.get(5).salt, 0, pocali);
  saltStock = new ItemStock(droppingItems.get(6).name, droppingItems.get(6).water, droppingItems.get(6).salt,0, saltPic);
  
}

//初期化関数
void init(){
  time = 0;
  dead = false;
  
  dropping.clear();
  //for(int i =0;i <= dropping.size(); i ++){
  //  dropping.remove(0);
  //}
  stockingList.arr.clear();
  
  //プレーヤーのインスタンス
  player = new Player(400, 700, 50, player1);
  
  //メーターのインスタンス
  saltMeter = new Meter(100, 100, 20, 50, 30, #E2FAD9);
  waterMeter = new Meter(100, 100, 20, 90, 30, #00B5FA);
  
  //落下物のインスタンス
  droppingItems.add(new DroppingItem("sun1", true, -30, -20, sun1, punch));
  droppingItems.add(new DroppingItem("sun2", true, -30, -20, sun2, punch));
  droppingItems.add(new DroppingItem("chiliPeper", true, -20, 0, chiliPepper, punch));
  droppingItems.add(new DroppingItem("bed", true, 40, 40, bed, restore));
  droppingItems.add(new DroppingItem("water",false, 20, 0, waterPic, restore));
  droppingItems.add(new DroppingItem("pocali", false, 10, 10, pocali, restore));
  droppingItems.add(new DroppingItem("salt", false, 0, 20, saltPic, restore));
  
  //アイテムストックのインスタンス
  waterStock = new ItemStock(droppingItems.get(4).name, droppingItems.get(4).water, droppingItems.get(4).salt,0, waterPic);
  pocaliStock = new ItemStock(droppingItems.get(5).name, droppingItems.get(5).water, droppingItems.get(5).salt, 0, pocali);
  saltStock = new ItemStock(droppingItems.get(6).name, droppingItems.get(6).water, droppingItems.get(6).salt,0, saltPic);
}



void draw(){
  waiting();
}

//ゲームの画面
void gameScreen(){
  Martian_Vassals.play();
  print(time);
  print();
  time += 3;
  background(0);
  // decrease salt by time 
  waterMeter.change(WATER_AMOUNT_DECREASE);
  
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
  
  // 
  String strwater= String.valueOf((int)waterMeter.val);
  String strsalt= String.valueOf((int)saltMeter.val);
  fill(#000000);
  textSize(25);
  text("salt:" + strsalt, 230,70);
  text("water:" + strwater, 230, 120);
  
  //所持アイテムの表示
  //waterStock.display();
  //pocaliStock.display();
  //saltStock.display();
  
  stockingList.displayStockingItems();
  
  textSize(50);
  text("SCORE:" + String.valueOf((int)time/10), 500,50);
  //text(String.format("%.1f",time/10),500, 50);
}
