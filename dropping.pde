
ArrayList<Dropping> dropping = new ArrayList<Dropping>();

class Dropping{
  float x, y, velocity, rad, water, salt;
  String name;
  boolean isSokuji;
  PImage picture;
  AudioPlayer sound;

  
  Dropping(String name, boolean isSokuji,float water, float salt, float x, float y, float velocity, PImage picture, AudioPlayer sound
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
    this.sound = sound;
  }
  
  void display(){
    image(this.picture, x, y, 70, 70);
  }
  
  void move(){
    y += velocity;
  }
  
  
}


//落下物の生成
void geneDropping(){

  int x = floor(random(7))%4;
  int y = floor(random(3))+4;
  
  if(x==3){
    v = 15;
  }else{
    v = random(5,13);
  }
  
  if(180<time && time<1500){
    
    if(time%120 == 0){
      dropping.add(new Dropping(
      droppingItems.get(x).name, droppingItems.get(x).isSokuji, droppingItems.get(x).water,
      droppingItems.get(x).salt,random(30,680),-15,v, droppingItems.get(x).picture, droppingItems.get(x).sound
      ));
      //print("work");
    }
    if(time%600 == 0){
      dropping.add(new Dropping(
      droppingItems.get(y).name, droppingItems.get(y).isSokuji, droppingItems.get(y).water,
      droppingItems.get(y).salt,random(30,680),-15,v, droppingItems.get(y).picture, droppingItems.get(y).sound
      ));
    }
  }else if(1500<time && time<2400){
    if(time%60 == 0){
      dropping.add(new Dropping(
      //nameImmed[x][0],nameImmed[x][1],nameImmed[x][2], true, random(30,680),-15,random(1,6)
      droppingItems.get(x).name, droppingItems.get(x).isSokuji, droppingItems.get(x).water,
      droppingItems.get(x).salt,random(30,680),-15,v +3, droppingItems.get(x).picture, droppingItems.get(x).sound
      ));
      //print("work");
    }
    if(time%400 == 0){
      dropping.add(new Dropping(
      droppingItems.get(y).name, droppingItems.get(y).isSokuji, droppingItems.get(y).water,
      droppingItems.get(y).salt,random(30,680),-15,v, droppingItems.get(y).picture, droppingItems.get(y).sound
      ));
    }
  }else{
    x = floor(random(1,13))%7;
    if(x==0){
      v = 15;
      x = 3;
    }else{
      v = random(5,13);
      x = x%3;
    }
    if(time%30 == 0){
      dropping.add(new Dropping(
      //nameImmed[x][0],nameImmed[x][1],nameImmed[x][2], true, random(30,680),-15,random(1,6)
      droppingItems.get(x).name, droppingItems.get(x).isSokuji, droppingItems.get(x).water,
      droppingItems.get(x).salt,random(30,680),-15,v +5, droppingItems.get(x).picture, droppingItems.get(x).sound
      ));
      //print("work");
    }
    if(time%100 == 0){
      dropping.add(new Dropping(
      droppingItems.get(y).name, droppingItems.get(y).isSokuji, droppingItems.get(y).water,
      droppingItems.get(y).salt,random(30,680),-15,v, droppingItems.get(y).picture, droppingItems.get(y).sound
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
