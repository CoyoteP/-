int su = 51; // 円の数 + 1
 float[] iti = new float[su]; // 各円の位置
 float haba; // 図形の間 
 float[] x = new float[2]; // x座標
 float[] y = new float[2]; // y座標
 float takasa ; // 図形の大きさ
 float[] speed = new float[su];
 float hi ;
 float[] col = new float[su];
 int[] kakudo = new int[su];
 int[] type = new int[su];
 int[] c = new int[su];
 int gra = 0; // 残楼の割合
 int cnt = 0;
 int kazu = 20; // 図形の数
 
 
void setup(){
  background(255);
  colorMode(HSB,255,100,100,100);
  size(500,500, P3D);
  takasa = 0.05;
  haba = 0;
   su = int(random(20)) + 21;
   cnt = 1;
   for(int p = 1; p <=su - 1;p++){
     speed[p] = random(40) * 0.001 +0.01;
     iti[p] = random(100) ;
      kakudo[p] = int(random(360));
      col[p] = random(255);
      type[p] = int(random(3));
      c[p] = int(random(2));
   }
}
 
void draw(){
  pushMatrix(); 
  translate(0,0,-250);
  fill(255,0,100,100-gra);
  rect(-250,-250,1000,1000);
  popMatrix();
  
 
  translate(width/2, height/2);    //立体の中心を画面中央に移動   
  rotateY(radians(mouseX));
  rotateX(radians(mouseY)); 
    for(int z = 1;z <=su - 1;z++){
      rotateY(radians(kakudo[z]));
      rotateX(radians(kakudo[z]));
      rotateZ(radians(kakudo[z]));
    hi = z * ((((width / 2)-100) / (su - 1)))+cnt; // z個目の円の半径
    iti[z] += speed[z]; // 速度分ずらす
    haba = iti[z];
    for(int i = 1 ; i <=kazu; i ++){
      for(int j = 0;j <=1;j++){
       x[j] = hi*cos(haba);
       y[j] = hi*sin(haba);
       haba += takasa; // 大きさ分ずらす
      }
      if(c[z] ==1){
      fill(col[z],100,100,0);
      }else if(c[z] == 0){
      fill(col[z],100,100,50);
      }
      stroke(col[z],100,100,100);
      if(type[z] == 0){
      triangle(x[0],y[0],x[1],y[1],(((x[0]+x[1])/2) * (1 +takasa)),(((y[0]+y[1])/2) * (1 + takasa)));
     }else if(type[z] == 1){
      quad(x[0],y[0],x[1],y[1],x[1]*(1+takasa),y[1]*(1+takasa),x[0]*(1+takasa),y[0]*(1+takasa));
     }else if(type[z] == 2){
      ellipse((x[0]+x[1])/2,(y[0]+y[1])/2,takasa*100,takasa*100);
     }
    }
  }
  cnt += (100-cnt)/15;
  
 
}
void mousePressed(){
 su = int(random(20)) + 21;
 for(int p = 1; p <=su - 1;p++){
     speed[p] = random(30) * 0.001 +0.01;
     iti[p] = random(100) ;
      kakudo[p] = int(random(360));
      col[p] = random(255);
      type[p] = int(random(3));
      c[p] = int(random(2));
      cnt = 0;
   }
}
  
