
void collisionDetect(){
  for(int i=0; i<dropping.size(); i++){
    if(Math.pow(dropping.get(i).x - player.x,2) + 
    Math.pow(dropping.get(i).y - player.y,2) <= 
    Math.pow(dropping.get(i).rad*0.5 + player.rad*0.5,2)){
      
      if(dropping.get(i).isSokuji){
        //即時関数
        saltMeter.change(dropping.get(i).salt);
        waterMeter.change(dropping.get(i).water);
        dropping.remove(i);
      }else{
        
        //保持する関数
        restore(i);
        
        dropping.remove(i);
      }
      
      //print("work");
    }
  }
}

void restore(int i){
  if(dropping.get(i).name == "pocali"){
    pocaliStock.increase();
  }else if(dropping.get(i).name == "water"){
    waterStock.increase();
  }else if(dropping.get(i).name == "salt"){
    saltStock.increase();
  }
}
