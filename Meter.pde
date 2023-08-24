//Mater salt = new Mater(100);
//Mater water = new Mater(100);

class Mater {
    float val;
    float maxVal;
    
    Mater(float initVal, int initNum) {
        this.val = initVal;
    }
    
    void change(float diff) {
        this.val += diff
        if (this.val > this.maxVal) {
            this.val = this.maxVal; 
        } else if (this.val =<  0) {
            this.val = 0;
            gameOver();
        }
    }
    float returnVal() {
        return this.val;
    }
    
    
}

void gameOver() {
    println("gameover");
}
