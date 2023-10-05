
class ItemStock{
  String  name;
  float water, salt;
  int quantity;
  PImage picPath;
  
  ItemStock(String name,float water,float salt,int quantity, PImage picPath){
    this.name = name;
    this.water = water;
    this.salt = salt;
    this.quantity = quantity;
    this.picPath = picPath;
  }
  
  void increase(){
    this.quantity += 1;
    //println(this.name + " :" + this.quantity);
  }

  void discrease(){
    this.quantity += -1;
    restore2.play();
    restore2.rewind();
    waterMeter.change(this.water);
    saltMeter.change(this.salt);
    stockingList.removeItem(this.name);
    //println(this.name + " :" + this.quantity);
   }
   
}
