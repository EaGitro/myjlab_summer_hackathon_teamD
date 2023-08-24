 //ItemStock items = new ItemStock("pocali",70,50,0);
 //ItemStock items = new ItemStock("water",100,0,0);
 //ItemStock items = new ItemStock("salt",0,100,0);

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
 }

 void display(){
   text(name +":" + quantity,100,50);
 }
}
