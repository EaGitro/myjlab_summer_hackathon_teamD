
Player player = new Player(400,700,50);

class Player{
  float x, y, rad;
  
  Player(float x,float y,float rad){
    this.x = x;
    this.y = y;
    this.rad = rad;
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
