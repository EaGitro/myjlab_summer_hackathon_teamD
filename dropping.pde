
ArrayList<Dropping> dropping = new ArrayList<Dropping>();

class Dropping{
  float x, y, velocity, rad, water, salt;
  String name;
  boolean isSokuji;
  PImage picture;

  
  Dropping(String name, boolean isSokuji,float water, float salt, float x, float y, float velocity, PImage picture
  ){
    this.name = name;
    this.isSokuji = isSokuji;
    this.x = x;
    this.y = y;
    this.velocity = velocity;
    this.rad = 30;
    this.water = water;
    this.salt = salt;
    this.picture = picture;
  }
  
  void display(){
    image(this.picture, x, y, 50, 50);
  }
  
  void move(){
    y += velocity;
  }
  
  
}


//落下物の生成
void geneDropping(){

  int x = floor(random(4));
  int y = floor(random(3))+4;
  
  if(time>180){
    if(time%120 == 0){
      dropping.add(new Dropping(
      //nameImmed[x][0],nameImmed[x][1],nameImmed[x][2], true, random(30,680),-15,random(1,6)
      droppingItems.get(x).name, droppingItems.get(x).isSokuji, droppingItems.get(x).water,
      droppingItems.get(x).salt,random(30,680),-15,random(2,7), droppingItems.get(x).picture
      ));
      //print("work");
    }
    if(time%600 == 0){
      dropping.add(new Dropping(
      droppingItems.get(y).name, droppingItems.get(y).isSokuji, droppingItems.get(y).water,
      droppingItems.get(y).salt,random(30,680),-15,random(2,7), droppingItems.get(x).picture
      ));
    }
  }
}

//落下物の表示
void moveDropping(){
  for(int i=0; i<dropping.size(); i++){
    dropping.get(i).display();
    dropping.get(i).move();
    //print("work!");
  }
}
