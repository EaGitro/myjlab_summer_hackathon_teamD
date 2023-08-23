Player player = new Player(400,700,50,100);

class Player{
  float x, y, rad, hp;
  
  Player(float x,float y,float rad, float hp){
    this.x = x;
    this.y = y;
    this.rad = rad;
    this.hp = hp;
  }
  
  void display(){
    surround();
    fill(#0040FF);
    noStroke();
    ellipse(x, y, rad, rad);
  }
  
  void move(){
    if(right){x += 4.5;}
    if(left){x -= 4.5;}
  }
  
  void surround(){
    if(x<20){x = 20;}
    if (x>680){x = 680;}
  }
  
  //HPバーの表示
  void hitpoint(){
    if(hp >40){
      fill(#00FF00);
    }
    if(hp > 15 && hp <= 40){
      fill(#FFFF00);
    }
    if(hp<15){
      fill(#FF0000);
    }
    rect(550,30,hp*2,50);
  }
  

}

//キーボードが押された時呼び出される:矢印キーそれぞれ押されていたらtrue
void keyPressed(){
  if(keyCode==39){
    right=true;
  }
  if(keyCode==37){
    left=true;
  }
}

//キーボードが離れた時呼び出される:矢印キーそれぞれ押されていたらfalse
void keyReleased(){
  if(keyCode==39){
    right=false;
  }
  if(keyCode==37){
    left=false;
  }
}
