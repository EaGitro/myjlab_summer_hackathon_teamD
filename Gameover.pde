void gameover(){
  
  Martian_Vassals.rewind();
  image(sunlight,0,0,width,height);
  image(lie,0,500,400,300);
  
  textSize(50);
  fill(#050505);
  text("SCORE:" + String.valueOf((int)time/10), 300,300);
  fill(#CB0209);
  textSize(70);
  text("GameOver!!", 200, 400);
  textSize(30);
  fill(#050505);
  text("キーワード: 睡眠", 550, 800);
}
