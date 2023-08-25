void waiting(){
  if(waiting){
    background(0);
    fill(#00ff00);
    textSize(50);
    text("Start!!", 250, 40); 
    
    fill(#00ff00);
    textSize(30);
    text("-ルール説明-"+ "\n"+ 
    "落ちてくるアイテムに気をつけながら走りましょう!"+ "\n"+ 
    "太陽と唐辛子に当たると水分と塩分が減っていきます"+ "\n"+ 
    "あなたの体からどちらかが無くなるとゲームオーバーになります"+ "\n"+ 
    "できるだけ長く生き残りましょう!"+ "\n"+ 
    "水とポカリと塩とベットは回復アイテムです"+ "\n"+
    "水とポカリと塩は保持することができます"+ "\n"+
    "水はＦキー、ポカリはＤキー、塩はＳキーで使用できます"+ "\n"+
    "熱中症にならずに走り切りましょう!!!", 600, 600); 
  }else if(dead){
    background(0);
    fill(#00ff00);
    textSize(50);
    text("GameOver!!", CENTER, CENTER);
  }else{
    gameScreen();
  }
}
