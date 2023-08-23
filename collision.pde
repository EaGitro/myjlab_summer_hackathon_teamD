
void collisionDetect(){
  for(int i=0; i<dropping.size(); i++){
    if(Math.pow(dropping.get(i).x - player.x,2) + 
    Math.pow(dropping.get(i).y - player.y,2) <= 
    Math.pow(dropping.get(i).rad*0.5 + player.rad*0.5,2)){
      
      damage(i);
      dropping.remove(i);
      print("work");
    }
  }
}

void damage(int i){
  player.hp -= dropping.get(i).damage;
}
