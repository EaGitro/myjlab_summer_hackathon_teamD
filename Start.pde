void waiting(){
  if(waiting){
    image(beachImg,0,0,width,height);
    fill(#000080);
    textSize(80);
    text("Start!!", 400, 300); 
    
    fill(#4682b4);
    textSize(25);
    textAlign(CENTER, CENTER);
    text("-ルール説明-"+ "\n"+ 
    "落ちてくるアイテムに気をつけながら走りましょう!"+ "\n"+ 
    "太陽と唐辛子に当たると水分と塩分が減っていきます"+ "\n"+ 
    "あなたの体からどちらかが無くなるとゲームオーバーになります"+ "\n"+ 
    "できるだけ長く生き残りましょう!"+ "\n"+ 
    "水とポカリと塩とベットは回復アイテムです"+ "\n"+
    "水とポカリと塩は保持することができます"+ "\n"+
    "水はＦキー、ポカリはＤキー、塩はＳキーで使用できます"+ "\n"+
    "熱中症にならずに走り切りましょう!!!", 400, 700); 
  }else if(dead){
    background(0);
    fill(#00ff00);
    textSize(50);
    text("GameOver!!", CENTER, CENTER);
  }else{
    gameScreen();
  }
}
