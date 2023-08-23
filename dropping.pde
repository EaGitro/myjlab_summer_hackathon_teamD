ArrayList<Dropping> dropping = new ArrayList<Dropping>();

class Dropping{
  float x, y, velocity, rad;
  
  Dropping(float x,float y,float velocity){
    this.x = x;
    this.y = y;
    this.velocity = velocity;
    this.rad = 30;
  }
  
  void display(){
    fill(#fa402f);
    noStroke();
    ellipse(x, y, this.rad, this.rad);
  }
  
  void move(){
    y += velocity;
  }
  
  
}

//落下物の生成
void geneDropping(){
  if(time>750){
    if(time%450 == 0){
      dropping.add(new Dropping(random(30,680),-15,random(1,6)));
      //print("work");
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
