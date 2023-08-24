
class ItemStock{
String  name;
float water, salt;
int quantity;


 ItemStock(String name,float water,float salt,int quantity){
    this.name = name;
    this.water = water;
    this.salt = salt;
    this.quantity = quantity;
 }
 void increase(){
   this.quantity += 1;
 }

 void discrease(){
   this.quantity += -1;
   waterMeter.change(this.waterMeter);
   saltMeter.change(this.saltMeter);
 }

 void display(){
   text(name +":" + quantity,100,50);
 }
}
