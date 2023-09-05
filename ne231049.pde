PImage title;
PImage clear;
PImage floor;
PImage charaup; //キャラ上
PImage charadown;
PImage charaleft;
PImage chararight;
PImage currentImage; // 現在表示しているキャラクター画像
PImage closedChest; // 閉じている宝箱の画像
PImage closedChest2; // 閉じている宝箱の画像
PImage closedChest3; // 閉じている宝箱の画像
PImage closedChest4; // 閉じている宝箱の画像
PImage openChest; // 開いた宝箱の画像
PImage exitoff;//テレポーたーoff
PImage exiton;//テレポーたーon
PImage exitoff2;
PImage exitoff3;
PImage exitoff4;
PImage doorclose;
PImage dooropen;
PImage currentgate; // 現在表示している画像
PImage gate1;
PImage gate2;
PImage orb_red;
PImage orb_blue;
PImage orb_green;
int interval = 1000; // 切り替える間隔（ミリ秒）
int lastSwitchTime = 0; // 前回の画像切り替え時刻
int chestx, chesty;//宝箱の座標
int textx = 20, texty = 30;
int xSpeed, ySpeed ; // キャラの移動速度
int charaX, charaY; // キャラの位置
int scene ; // 場面状況切り替え
int wallx, wally;
float orb_redX, orb_redY; // 円の座標
float orb_redSpeedX, orb_redSpeedY; // 円の速度
float orb_blueX, orb_blueY; // 円の座標
float orb_blueSpeedX, orb_blueSpeedY; // 円の速度
float orb_greenX, orb_greenY; // 円の座標
float orb_greenSpeedX, orb_greenSpeedY; // 円の速度
boolean o;
boolean p;
boolean e;
boolean n;
boolean H;
boolean orb_red1;
boolean orb_blue6;
boolean orb_green4;
boolean key1;
boolean key2;
boolean key3;
boolean key4;
boolean all_flags;
import processing.sound.*;
SoundFile sound1;
SoundFile sound2;
void setup() {
  size(500, 500); // ゲーム画面のサイズを設定
  background(255);
  lastSwitchTime = millis(); // 初期化時刻を設定
  frameRate(60);
  textFont(createFont("SansSerif", 13, true));  // フォント、サイズを指定。

  // 円の初期位置をランダムに設定
  orb_redX = random(width);
  orb_redY = random(height);
  orb_blueX = random(width);
  orb_blueY = random(height);
  orb_greenX = random(width);
  orb_greenY = random(height);

  // 円の初期速度をランダムに設定
  orb_redSpeedX = random(1, 5);
  orb_redSpeedY = random(1, 5);
  orb_blueSpeedX = random(1, 5);
  orb_blueSpeedY = random(1, 5);
  orb_greenSpeedX = random(1, 5);
  orb_greenSpeedY = random(1, 5);

  title = loadImage("title.jpg");
  clear = loadImage("clear.jpeg");
  floor = loadImage("floor.png");
  // キャラの初期位置を画面の中央に設定
  charaX = width / 2;
  charaY = height / 2;

  charaup = loadImage("chara_up_stop.png");
  charadown = loadImage("chara_down_stop.png");
  charaleft = loadImage("chara_left_stop.png");
  chararight = loadImage("chara_right_stop.png");
  currentImage = charaup; // 初期表示はキャラクターが上向き

  closedChest = loadImage("closed_chest.png"); // 閉じている宝箱の画像
  closedChest2 = loadImage("closed_chest.png"); // 閉じている宝箱の画像
  closedChest3 = loadImage("closed_chest.png"); // 閉じている宝箱の画像
  closedChest4 = loadImage("closed_chest.png"); // 閉じている宝箱の画像
  openChest = loadImage("open_chest.png"); // 開いた宝箱の画像


  exitoff= loadImage("room_exit_off.png");
  exitoff2= loadImage("room_exit_off.png");
  exitoff3= loadImage("room_exit_off.png");
  exitoff4= loadImage("room_exit_off.png");
  exiton = loadImage("room_exit_on.png");

  dooropen =loadImage("door_open.png");
  doorclose = loadImage("door_close.png");

  gate1 = loadImage("gate1.png");
  gate2 = loadImage("gate2.png");
  currentgate= gate1;

  orb_red = loadImage("orb_red.png");
  orb_blue = loadImage("orb_blue.png");
  orb_green = loadImage("orb_green.png");

  sound1 = new SoundFile(this, "chest_open.mp3");
  sound2 = new SoundFile(this, "door_open.mp3");
}

void draw() {
  if (scene == 0) {
    title();
  } else if (scene == 1) {
    display1();
  } else if (scene == 2) {
    display2();
  } else if (scene == 3) {
    display3();
  } else if (scene == 4) {
    display4();
  } else if (scene == 5) {
    display5();
  } else if (scene == 6) {
    display6();
  } else if (scene == 7) {
    display7();
  }
  
  
}
void keyPressed() {
  if (key == ' ') {
    scene = 1;
  }
  if (scene == 2 &&key == 'o'|| key == 'O') {
    o = true;
  }
  if (scene == 2 &&o&&key == 'p'|| key == 'P') {
    p = true;
  }
  if (scene == 2 &&o&&p&&key == 'e'|| key == 'E') {
    e = true;
  }
  if (scene == 2 &&o&&p&&e&&key == 'n'|| key == 'N') {
    n = true;
    sound1.play();
  }

  if (scene == 6 &&key == 'h'|| key == 'H') {
    H = true;
    sound1.play();
  }
  if (key == '1') {
    orb_red1 = true;
  }
  if (orb_red1&&key == '6') {
    orb_blue6 = true;
  }
  if (orb_red1&&orb_blue6&&key == '4') {
    orb_green4 = true;
    sound1.play();
  }
  if (key1&&key2&&key3&&key4&&key == ' ') {
    key1 =false;
    key2 = false;
    key3 =false;
    key4 = false;
    dooropen = doorclose;
    scene = 0;
  }

  if (key == CODED) {
    if (keyCode == UP) {
      ySpeed = -5; // 上に移動する速度を設定
      xSpeed = 0;
      currentImage = charaup; // キャラクター画像を上向きに変更
    } else if (keyCode == DOWN) {
      ySpeed = 5; // 下に移動する速度を設定
      xSpeed = 0;
      currentImage = charadown; // キャラクター画像を下向きに変更
    } else if (keyCode == LEFT) {
      xSpeed = -5; // 左に移動する速度を設定
      ySpeed = 0;
      currentImage = charaleft; // キャラクター画像を左向きに変更
    } else if (keyCode == RIGHT) {
      xSpeed = 5; // 右に移動する速度を設定
      ySpeed = 0;
      currentImage = chararight; // キャラクター画像を右向きに変更
    }
  }
}

void title() {
  background(255);
  image(title, 0, 0);
  fill(0, 255, 255);//シアン
  textFont(createFont("SansSerif", 60, true));
  text("迷宮に", textx, texty+30);
  text("閉じ込められた！？", textx, texty+90);
  textFont(createFont("SansSerif", 18, true));
  text("SPACE TO START", textx+150, texty+450);
}


void display1() {
  background(255);
  image(floor, 0, 25);
  drawWalls();
  image(doorclose, 230, 0);
  if (key1&&key2) {
    doorclose = dooropen;
    sound2.play();
  }
  charamove();
  //シーン2に変更
  if (charaX <= 25 && charaY >= 210 && charaY <= 250) {
    scene = 2;
    charaX = 480;
    charaY = 240;
  }
  //シーン3に変更
  else if (charaX >= 435 && charaY >= 200 && charaY <= 240) {
    scene = 3;
    charaX = 30;
    charaY = 240;
  }
  //シーン4に変更
  else if (key1&&key2&&charaX >=220 && charaX <=240 &&charaY <= 30) {
    scene = 4;
    charaX = 220;
    charaY = 450;
  }
}

void display2() {
  background(255);
  image(floor, 0, 25);
  drawWalls3();
  exit1();
  fill(0);
  text("?に当てはまるアルファベットを上から順番に押せ", textx, texty);
  text("D => A", textx, texty + 20);
  text("S => ?", textx, texty + 40);
  text("T => ?", textx, texty+60);
  text("B => ?", textx, texty+80);
  text("K => ?", textx, texty+100);
  if (o&&p&&e&&n) {
    closedChest = openChest;
    key1 = true;
  }

  if (key1) {
    background(255);
    image(floor, 0, 25);
    drawWalls3();
    exit1();
    exitoff = exiton;
    fill(0);
    text("鍵を入手した!", textx, texty);
  }
  if (key1&&charaX <= 55&&charaX >= 35 && charaY >= 350 && charaY <= 380) {

    scene = 1;
  }
  charamove();
  chest();
}

void display3() {
  background(0);
  fill(255);
  text("暗闇のどこかに宝箱がある...", textx, texty);
  if (charaX >= chestx+80 &&charaX <= chestx+120&& charaY >= chesty+80&& charaY == chesty+120) {
    sound1.play();

    key2 = true;
  }

  if (key2) {
    background(255);
    image(floor, 0, 25);
    drawWalls3();
    exit2();
    chest2();
    exitoff2 = exiton;
    closedChest2 = openChest;
    fill(0);
    text("鍵を入手した!", textx, texty);
  }

  if (key2&&charaX <= 55&&charaX >= 35 && charaY >= 350 && charaY <= 380) {
    scene = 1;
  }
  charamove();
}

void display4() {
  background(255);
  image(floor, 0, 25);
  drawWalls2();
  charamove();
  if (millis() - lastSwitchTime >= interval) {
    switchImage(); // 画像を切り替える関数を呼び出す
    lastSwitchTime = millis(); // 最終切り替え時刻を更新
  }
  image(currentgate, 220, 60);

  //シーン7に変更
  if (key3&&key4&&charaX <= 300&&charaX >= 180 && charaY >= 30 && charaY <= 120) {
    scene = 7;
    fill(0);
    text("ゲートが起動した！", textx, texty);
  } else if (charaX <= 300&&charaX >= 180 && charaY >= 30 && charaY <= 120) {
    fill(0);
    text("ゲートの動力が足りない", textx, texty);
  }
  //シーン5に変更
  else if (charaX <= 25 && charaY >= 210 && charaY <= 250) {
    scene = 5;
    charaX = 480;
    charaY = 240;
  }
  //シーン6に変更
  else if (charaX >= 435 && charaY >= 200 && charaY <= 240) {
    scene = 6;
    charaX = 30;
    charaY = 240;
  }
}

void display5() {
  background(255);
  image(floor, 0, 25);
  drawWalls3();
  exit3();
  fill(0);
  text("オーブの個数を数えて赤→青→緑の順番で数字キーを押せ", textx, texty);
  orb_red();
  orb_blue();
  orb_green();

  if (orb_red1&&orb_blue6&&orb_green4) {
    closedChest3 = openChest;
    key3 = true;
  }
  if (key3) {
    background(255);
    image(floor, 0, 25);
    drawWalls3();
    exit3();
    exitoff3 = exiton;
    fill(0);
    text("ゲートに動力が送られた", textx, texty);
  }
  if (key3&&charaX <= 55&&charaX >= 35 && charaY >= 350 && charaY <= 380) {

    scene = 4;
  }
  charamove();
  chest3();
}

void display6() {
  background(255);
  image(floor, 0, 25);
  drawWalls3();
  exit4();
  fill(0);
  text("?に当てはまるアルファベットを押せ", textx, texty);
  text("A・F・?・L・M・N・S・X", textx, texty+20);


  if (H) {
    closedChest4 = openChest;
    key4 = true;
  }
  if (key4) {
    background(255);
    image(floor, 0, 25);
    drawWalls3();
    exit4();
    exitoff4 = exiton;
    fill(0);
    text("ゲートに動力が送られた", textx, texty);
  }

  if (key4&&charaX <= 55&&charaX >= 35 && charaY >= 350 && charaY <= 380) {
    scene = 4;
  }
  chest4();
  charamove();
}

void display7() {
  background(255);
  image(clear, 0, 0);
  fill(255, 69, 0);//オレンジ
  textFont(createFont("SansSerif", 60, true));
  text("クリアー！", textx, texty+30);
  textFont(createFont("SansSerif", 18, true));
  text("SPACE TO RESTART", textx+140, texty+450);
}

void charamove() {
  image(currentImage, charaX, charaY); // 現在のキャラクター画像を表示
  charaX += xSpeed; // キャラのX座標を更新
  charaY += ySpeed; // キャラのY座標を更新

  xSpeed *= 0.8;
  ySpeed *= 0.8;

  // キャラクターの位置を画面内に収める
  if (charaX < 0) {
    charaX = 0;
  } else if (charaX > width - currentImage.width) {
    charaX = width - currentImage.width;
  }

  if (charaY < -30) {
    charaY = -30;
  } else if (charaY > height - currentImage.height) {
    charaY = height - currentImage.height;
  }
}

// 壁を描画する関数
void drawWalls() {
  fill(100); //灰色
  noStroke();
  rect(wallx, wally, 30, 230);//左壁上
  rect(wallx, wally+290, 30, 270);//左壁下
  rect(wallx, wally, 500, 65); //上壁
  rect(wallx, wally+470, 500, 65); //下壁
  rect(wallx+470, wally, 30, 230);//右壁上
  rect(wallx+470, wally+290, 30, 230);//右壁下
}

void drawWalls2() {
  fill(100); // 灰色
  noStroke();
  rect(wallx, wally, 30, 230);//左壁上
  rect(wallx, wally+290, 30, 270);//左壁下
  rect(wallx, wally, 500, 65); //上壁
  rect(wallx+470, wally, 30, 230);//右壁上
  rect(wallx+470, wally+290, 30, 230);//右壁下
}

void drawWalls3() {
  fill(100); // 灰色
  noStroke();
  rect(wallx, wally, 30, 500);//左壁
  rect(wallx, wally, 500, 65); //上壁
  rect(wallx, wally+470, 500, 65); //下壁
  rect(wallx+470, wally, 30, 500);//右壁
}
void chest() {
  image(closedChest, chestx+100, chesty+100);
}

void chest2() {
  image(closedChest2, chestx+100, chesty+100);
}
void chest3() {
  image(closedChest3, chestx+100, chesty+100);
}

void chest4() {
  image(closedChest4, chestx+100, chesty+100);
}

void exit1() {
  image(exitoff, 50, 400);
}

void exit2() {
  image(exitoff2, 50, 400);
}
void exit3() {
  image(exitoff3, 50, 400);
}
void exit4() {
  image(exitoff4, 50, 400);
}
void switchImage() {
  if (currentgate == gate1 && key1&&key2&&key3&&key4) {
    currentgate = gate2;
  } else {
    currentgate = gate1;
  }
}

void orb_red() {
  // orb位置更新
  orb_redX += orb_redSpeedX;
  orb_redY += orb_redSpeedY;

  // 画面の端にきたら速度を反転させる
  if (orb_redX <= 0 || orb_redX >= width) {
    orb_redSpeedX *= -1;
  }
  if (orb_redY <= 0 || orb_redY >= height) {
    orb_redSpeedY *= -1;
  }

  image(orb_red, orb_redX, orb_redY);
}

void orb_blue() {

  // orb位置更新
  orb_blueX += orb_blueSpeedX;
  orb_blueY += orb_blueSpeedY;

  // 画面の端にきたら速度を反転させる
  if (orb_blueX <= 0 || orb_blueX >= width) {
    orb_blueSpeedX *= -1;
  }
  if (orb_blueY <= 0 || orb_blueY >= height) {
    orb_blueSpeedY *= -1;
  }

  image(orb_blue, orb_blueX-60, orb_blueY+110);
  image(orb_blue, orb_blueX+150, orb_blueY+10);
  image(orb_blue, orb_blueX-18, orb_blueY-126);
  image(orb_blue, orb_blueX+231, orb_blueY-246);
  image(orb_blue, orb_blueX-125, orb_blueY+114);
  image(orb_blue, orb_blueX+119, orb_blueY-20);
}

void orb_green() {
  // orb位置更新
  orb_greenX += orb_greenSpeedX;
  orb_greenY += orb_greenSpeedY;

  // 画面の端にきたら速度を反転させる
  if (orb_greenX <= 0 || orb_greenX >= width) {
    orb_greenSpeedX *= -1;
  }
  if (orb_greenY <= 0 || orb_greenY >= height) {
    orb_greenSpeedY *= -1;
  }

  image(orb_green, orb_greenX-130, orb_greenY+26);
  image(orb_green, orb_greenX+210, orb_greenY-90);
  image(orb_green, orb_greenX+18, orb_greenY-210);
  image(orb_green, orb_greenX-221, orb_greenY+30);
}
