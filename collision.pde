
void collisionDetect(){
  for(int i=0; i<dropping.size(); i++){
    if(abs(dropping.get(i).x-player.x -25)<70 && abs(dropping.get(i).y-player.y -35)<90){
      
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
    if(stockingList.pushItem("pocali")){
      pocaliStock.increase();
    }
  }else if(dropping.get(i).name == "water"){
    if(stockingList.pushItem("water")){
      waterStock.increase();
    }
  }else if(dropping.get(i).name == "salt"){
    if(stockingList.pushItem("salt")){
      saltStock.increase();
    }
  }
}
