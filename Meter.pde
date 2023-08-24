class Meter {
    float val;
    float maxVal;
    float xCoord;
    float yCoord;
    float xHeight;
    String colorCode;
    
    Meter(float initVal, float maxVal, float xCoord, float yCoord, float xHeight, String colorCode) {
        this.val = initVal;
        this.maxVal = maxVal;
        this.xCoord = xCoord;
        this.yCoord = yCoord;
        this.xHeight = xHeight;
        this.colorCode = colorCode;
        
        this.display(this.val, this.xCoord, this.yCoord, this.xHeight, this.colorCode);
    }
    
    void change(float diff) {
        this.val += diff;
        if (this.val > this.maxVal) {
            this.val = this.maxVal; 
            this.display(this.val, this.xCoord, this.yCoord, this.xHeight, this.colorCode);
        } else if (this.val <=  0) {
            this.val = 0;
            this.display(this.val, this.xCoord, this.yCoord, this.xHeight, this.colorCode);
            gameOver();
        }
        this.display(this.val, this.xCoord, this.yCoord, this.xHeight, this.colorCode);
    }
    float returnVal() {
        return this.val;
    }
    
    void display(float val, float xCoord, float yCoord, float xHeight, String colorCode) {
        
        fill(colorCode);
        rect(xCoord, yCoord, val * 2, xHeight);
        
    }
    
    
}

void gameOver() {
    println("gameover");
}
