
void collisionDetect(){
  for(int i=0; i<dropping.size(); i++){
    if(abs(dropping.get(i).x-player.x -25)<70 && abs(dropping.get(i).y-player.y -35)<90){
      
      if(dropping.get(i).isSokuji){
        //即時関数
        saltMeter.change(dropping.get(i).salt);
        waterMeter.change(dropping.get(i).water);
        dropping.get(i).sound.play();
        dropping.get(i).sound.rewind();
        dropping.remove(i);
      }else{
        
        //保持する関数
        restore(i);
        getitem.play();
        getitem.rewind();
        dropping.remove(i);
      }
      
      //print("work");
    }
  }
}

void restore(int i){
  if(dropping.get(i).name == "pocali"){
    if(stockingList.pushItem("pocali", getitem)){
      pocaliStock.increase();
    }
  }else if(dropping.get(i).name == "water"){
    if(stockingList.pushItem("water", getitem)){
      waterStock.increase();
    }
  }else if(dropping.get(i).name == "salt"){
    if(stockingList.pushItem("salt", getitem)){
      saltStock.increase();
    }
  }
}
