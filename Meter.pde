
class Meter {
    float val;
    float maxVal;
    
    Meter(float initVal) {
        this.val = initVal;
    }
    
    void change(float diff) {
        this.val += diff;
        if (this.val > this.maxVal) {
            this.val = this.maxVal; 
        } else if (this.val <=  0) {
            this.val = 0;
            gameOver();
        }
    }
    float returnVal() {
        return this.val;
    }
    
    void display(){
      //if( >40){
      //  fill(#00FF00);
      //}
      //if(p_HP > 15 && p_HP <= 40){
      //  fill(#FFFF00);
      //}
      //if(p_HP<15){
      //  fill(#FF0000);
      //}
      rect(550,30,this.val*2,50);
  
    }
    
    
}

void gameOver() {
    println("gameover");
}
