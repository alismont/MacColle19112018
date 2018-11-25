/*  //<>// //<>// //<>// //<>// //<>// //<>//
 Lismont Alain +32497478075
 */

import java.io.*;

import processing.serial.*;

import controlP5.*;

ControlP5 cp5;

//Données à AJUSTER
int Rayon=45;//.. eeadress=0 ...............................................................Rayon

float xptspixel=0.067979;//.. eeadress=1 ...............................................................xptspixel
float DecalX=260.9;//.. eeadress=2 ...............................................................DecalX
float XHome=49.9;//.. eeadress=3 ...............................................................XHome

float yptspixel=0.067979;//.. eeadress=4 ...............................................................yptspixel
float DecalY=798;//.. eeadress=5 ...............................................................DecalY
float YHome=31.0;//.. eeadress=6 ...............................................................YHome

float zptspixel=1;

boolean PrgStart=false;
int DecalZ=0;
//****************************************
String textValue = "";
PImage photo;

boolean fin=true;
boolean flag=false;
int i;
String line = null;
int Index=0;
int IndexRelatif=0;
int memoBoucle;
int num = 0;
int numm = 0;
//int[] cx = new int[10000];
//int[] cy = new int[10000];
int LU=0;
// Points de soudures
//HG haut gauche; HD haut droit ; BG bas gauche ; BD bas droit
//int[] HGx = new int[100];
//int[] HGy = new int[100];
//int[] HDx = new int[100];
//int[] HDy = new int[100];
//int[] BGx = new int[100];
//int[] BGy = new int[100];
//int[] BDx = new int[100];
//int[] BDy = new int[100];
float val=0.5;
//int[] HGxD = new int[100];
//int[] HGyD = new int[100];
//int[] HDxD = new int[100];
//int[] HDyD = new int[100];
//int[] BGxD = new int[100];
//int[] BGyD = new int[100];
//int[] BDxD = new int[100];
//int[] BDyD = new int[100];

int PasAPas = 1;
int PasAPasD = 1;
String Trame="";
float r;
float g;
float b;
float Tot;
float rMax, rMin;
float gMax, gMin;
float bMax, bMin;
float rMoy, gMoy, bMoy;
float MoyTot;
float increm=0.0;
int NbrPoints;
int MSGRecu=0;
String[] cmd={"gphoto2 --capture-image"};
//Etude Date:06-04-2018
//  Tableau des coordonnées polaire de chaque pièce, valeurs constante
int[] CentrePieces_CoordX0 = new int[100];
int[] CentrePieces_CoordY0 = new int[100];
int[] CerclePieces_CoordX = new int[10000];
int[] CerclePieces_CoordY = new int[10000];
float[] ColorPixel_r = new float[10000];
float[] ColorPixel_r_int = new float[10000];
float[] ColorPixel_r_Trou = new float[10000];
float[] ColorPixel_g = new float[10000];
float[] ColorPixel_b = new float[10000];
float[] ColorPixel_a = new float[10000];
float[] Radian_t = new float[10000];
float[] Radian_Max_TBL = new float[10000];
float Radian_t_ok=0;
float Radian_deux=0;
float Trou_Gauche=0;
float Trou_Droit=0;
int PointZero=0;
float PointUn=0;
float PointDeux=0;
float PointTrois=0;
float PointQuatre=0;
float PointCinq=0;
float PointSix=0;
float PointSept=0;
int[] Trou_GaucheX= new int[100];
int[] Trou_GaucheY = new int[100];
int[] Trou_DroitX = new int[100];
int[] Trou_DroitY = new int[100];

int x0, y0, x, y;
float Moyenne_R=0;
float Moyenne_G=0;
float Moyenne_B=0;
float Min_Color_R=10000;
float Min_Color_G=10000;
float Min_Color_B=10000;
float Max_Color_R=0;
float Max_Color_G=0;
float Max_Color_B=0;
float Min_Color_R_int=10000;
float Min_Color_G_int=10000;
float Min_Color_B_int=10000;
float Max_Color_R_int=0;
float Max_Color_G_int=0;
float Max_Color_B_int=0;
float EntreMAxEtMin_R=0;
float EntreMAxEtMin_R_int=0;
int Point1_TrouX=0, Point1_TrouY=0;
int Point2_TrouX=0, Point2_TrouY=0;
int Point3_TrouX=0, Point3_TrouY=0;
int Point4_TrouX=0, Point4_TrouY=0;
int Point5_TrouX=0, Point5_TrouY=0;
int Point6_TrouX=0, Point6_TrouY=0;
int Point7_TrouX=0, Point7_TrouY=0;
float TestInc=0;
float TestDec=0;
float Radian1_t;
float Radian2_t;
float Radian3_t;
float Radian4_t;
float Radian5_t;
float Radian6_t;
float Radian7_t;
float Radian_Max=0;
float Radian_Min=0;

int loop=0;
int passage=0;
int Points=0;
int boucle=0;
color black = color(0);
color jaune = color(255, 204, 0);
color rouge = color(240, 28, 28);

int PTS =1;

boolean Calcul_Points_Colle_OK;   
boolean Home_OK=false;
boolean Reset_OK=false;

boolean MemoJOGXM=false;
boolean MemoJOGXP=false;
boolean MemoJOGYM=false;
boolean MemoJOGYP=false;
boolean MemoJOGZM=false;
boolean MemoJOGZP=false;

Serial myPort, myPort2;

int octetReception;
char caracter;
String chainerec;
int octetReception2;
char caracter2;
String chainerec2;
int Sequence=0;
int lf=10;
int CptPieces=0;
int CptpPrg=2;
String CoordX, CoordY, CoordZ;
String CoordCTX;
String CoordCTY;
String CoordCTZ;


//float xptspixel=1.037;
//int DecalX=985;
//float yptspixel=1.007;
//int DecalY=197;

String inBuffer="";

String IndexCentre="1";
int PrisePos=0;

int SequencePos=0;
int op_mode=0;
int result=0;
int DefautDetection=0;


boolean SequenceZero=true;
boolean Fin=false;
String inString;
String[] tag = new String[20]; 
int fintest=0;
boolean JOGXP =false;
boolean JOGXM =false;
boolean JOGYP =false;
boolean JOGYM =false;
boolean JOGZP =false;
boolean JOGZM =false;
String Avance="1.0";
//---------------SETUP----------------------------------------------------------------------------------------------SETUP
void setup() {
  size(3872, 2592);//size(6000, 4000);
  //size(700,400);

  printArray(Serial.list());

  //photo = loadImage("Ce PC/S1/Stockage amovible/DCIM/102NC1S1/DSC_1228.jpg");
  //exec("C:/Aurel/mACVALVES/Asbuilt/Coord_Points_Colle/data/test.bat"); 
  myPort = new Serial(this, Serial.list()[33], 115200); //USB1
  myPort.bufferUntil(lf);
  //delay(10000);
  myPort2 = new Serial(this, Serial.list()[32], 115200);//USB0
  myPort2.bufferUntil(lf);
  while (myPort2.available()>0 ) {
    String data=myPort2.readString();
  }
  PFont font = createFont("arial", 20);
  cp5 = new ControlP5(this);

  cp5.addTextfield("X")
    .setPosition(20, 100)
    .setSize(200, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 0, 0))
    ;

  cp5.addTextfield("Y")
    .setPosition(20, 300)
    .setSize(200, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 0, 0))
    ;     


  cp5.addTextfield("Z")
    .setPosition(20, 500)
    .setSize(200, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 0, 0))
    ;   


  cp5.addTextfield("Index")
    .setPosition(20, 700)
    .setSize(200, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 0, 0))
    ;   


  cp5.addButton("START")
    .setValue(0)
    .setOff()
    .setPosition(10, 10)
    .setSize(200, 19)
    ;

  textFont(font);


  delay(100);
  MSGRecu=0;
  myPort.write("$X");
  myPort.write('\r');
  println("$X");
  delay(1000);
  MSGRecu=0;
  myPort.write("$H");
  myPort.write('\r');
  println("$H");
  Home_OK=true;
  Reset_OK=true;
  //*******************************************************************************************POSITION PRISE PHOTO



}


//----------------DRAW-----------------------------------------------------------------------------------------------DRAW
void draw() {
   background(0, 0, 0);
  text ("Rayon="+Rayon, 220, 20);
   //text ("xptspixel="+tags[3], 220, 80);
  text ("DecalX="+DecalX, 220, 100);
  text ("XHome="+XHome, 220, 120);
  //text ("yptspixel="+tags[6], 220, 140);
  text ("DecalY="+DecalY, 220, 160);
  text ("YHome="+YHome, 220, 180);
  text ("CptpPrg="+ CptpPrg, 220, 200);
  text ("BP_JOG_XP="+JOGXP, 220, 220);
  text ("BP_JOG_XM="+JOGXM, 220, 240);
  text ("BP_JOG_YP="+JOGYP, 220, 260);
  text ("BP_JOG_YM="+JOGYM, 220, 280);
  text ("BP_JOG_ZP="+JOGZP, 220, 300);
  text ("BP_JOG_ZM="+JOGZM, 220, 320);
  //*****************************************************************************************************************GESTION ARDUINO
  if (Sequence>0 & SequenceZero) {
    SequenceZero=false;
    //println("NOSTARTZERO");
  }

  while (myPort2.available()>0 ) {
    SerialEventTest(myPort2);
  }

  //*******************************************************************************LECTURE POSITION DES AXES

  //******************************************************************************GESTION JOG X /Y Z
  //**AXE X
  if (Sequence==0 & SequencePos==0) {
    if (JOGXP) {
      MemoJOGXP=true; //<>//
      myPort.write("$J="); 
      myPort.write('\r');
      myPort.write("G91");
      myPort.write('\r');
      myPort.write("G0X"+Avance);
      myPort.write('\r');
    } else {
      if (MemoJOGXP==true) {
        //myPort.write("!");
        //myPort.write('\r');
        MemoJOGXP=false;
      }
    }
    if (JOGXM) {
      MemoJOGXM=true;
      myPort.write("$J="); 
      myPort.write('\r');
      myPort.write("G91");
      myPort.write('\r');
      myPort.write("G0X-"+Avance);
      myPort.write('\r');
    } else {
      if (MemoJOGXM==true) {
        //myPort.write("!");
        //myPort.write('\r');
        MemoJOGXM=false;
      }
    }
    //**AXE Y
    if (JOGYP) {
      MemoJOGYP=true;
      myPort.write("$J="); 
      myPort.write('\r');
      myPort.write("G91");
      myPort.write('\r');
      myPort.write("G0Y"+Avance);
      myPort.write('\r');
    } else {
      if (MemoJOGYP==true) {
        //myPort.write("!");
        //myPort.write('\r');
        MemoJOGYP=false;
      }
    }
    if (JOGYM) {
      MemoJOGYM=true;
      myPort.write("$J="); 
      myPort.write('\r');
      myPort.write("G91");
      myPort.write('\r');
      myPort.write("G0Y-"+Avance);
      myPort.write('\r');
    } else {
      if (MemoJOGYM==true) {
        //myPort.write("!");
        //myPort.write('\r');
        MemoJOGYM=false;
      }
    }
    //**AXE Z
    if (JOGZP) {
      MemoJOGZP=true;
      myPort.write("$J="); 
      myPort.write('\r');
      myPort.write("G91");
      myPort.write('\r');
      myPort.write("G0Z0.1");
      myPort.write('\r');
    } else {
      if (MemoJOGZP==true) {
        //myPort.write("!");
        //myPort.write('\r');
        MemoJOGZP=false;
      }
    }
    if (JOGZM) {
      MemoJOGZM=true;
      myPort.write("$J="); 
      myPort.write('\r');
      myPort.write("G91");
      myPort.write('\r');
      myPort.write("G0Z-0.1");
      myPort.write('\r');
    } else {
      if (MemoJOGZM==true) {
        //myPort.write("!");
        //myPort.write('\r');
        MemoJOGZM=false;
      }
    }
  }


  //if (Sequence==12) {
  //  myPort2.write("STARTFLASH=");
  //  println("STARTFLASH");
  //}

  ////if (SequencePos>0 & !STARTFIXE) {
  ////  myPort2.write("STARTFIXE=");
  ////  println("STARTFIXE");
  ////} 
  //  if (SequencePos==0) {
  //  myPort2.write("STOPFIXE=");
  //  println("STOPFIXE");
  //}
  //if (Sequence==0 & !SequenceZero ) {
  //  myPort2.write("STARTZERO=");
  //  SequenceZero=true;
  //  println("STARTZERO");
  //}

  //*****************************************************************************************************************GESTION ARDUINO

  //*****************************************************************************************************************PROGRAMME
  PrgStart=true;


  // op_mode=0; // forcage mode séquence normale

  switch(op_mode) {

  case 0: 

    break;
  case 1: 
    if (Sequence==0) Sequence=1; 
    break;  
  case 2: 
    if (SequencePos==0) SequencePos=1; 
    CptPieces=1;
    break;
  }  

  //******************************************************************************************************SEQUENCE
  switch(Sequence) {
  case 0: 

    break;

  case 1: //Prise photo

    op_mode=0;
    //Positionnement prise photo
    myPort.write("G90");   
    myPort.write('\r');
    myPort.write("G0X10Y10");   
    myPort.write('\r');
    delay(10000);


    Sequence=11;
    op_mode=0;
    myPort2.write("STOPFIXE=");

    //Process p = exec("gphoto2", "--capture-image-and-download");
    //try {
    //  result = p.waitFor();
    //  print("result photo:");
    //  println(result);
    //}
    //catch(InterruptedException e)
    //{
    //  e.printStackTrace();
    //} 



    //p = exec("python", "/home/lismont/Mac/Coord_Points_Colle/batchCopy.py"); 
    //try {
    //  result = p.waitFor();
    //  print("result save:");
    //  println(result);
    //}
    //catch(InterruptedException e)
    //{
    //  e.printStackTrace();
    //}
    //if (result==1) {
    //  delay(5000);
    //  Sequence=1;
    //  ;
    //} else {      
    //  Sequence=11;
    //}
    break;	

  case 11: //Transfert photo
    Sequence=12;
    break;
  case 12: //Traitement image
    Calcul_Points_Colle_OK=false;
    Rayon=45;
    Traitement_Image(); 

    Sequence=3;
    CptPieces=1;
    //println("---------------------------------------------------");
    //println(Trou_GaucheX[4]);
    //println(Trou_GaucheY[4]);
    //println(Trou_DroitX[4]);
    //println(Trou_DroitY[4]);
    break;      

  case 3: //***********************************************************************************Positionnement en X DROIT
    CoordonneeD();
    Trame=("G90G0X"+CoordX+"Y"+CoordY+'\r');
    myPort.write(Trame);
    Sequence=31;
    print("CoordX:");
    println(Trame);
    print("CoordY:");
    println(Trame);
    break;	

  case 31: //Positionnement en X suite
    // attente en position X
    Sequence=4;
    break;

  case 4: //Positionnement en Y
    //// envoie coordonnée Y
    // Trame=("G90G0Y"+CoordY+'\r');
    //myPort.write(Trame);
    Sequence=41;
    //print("CoordY:");
    //println(Trame);
    break;
  case 41: //Positionnement en Y
    // attente en position Y
    Sequence=5;
    break;

  case 5: //Positionnement en Z descendre
    Trame=("G90G0Z-7"+'\r');
    myPort.write(Trame);
    Sequence=6;
    //myPort.write("Z0150....="); 
    //Sequence=51 ;
    break;
  case 6: //Collage
    delay(2000);
    Sequence=7;
    break;

  case 7: //Positionnement en Z monter
    Trame=("G90G0Z0"+'\r');
    myPort.write(Trame);
    Sequence=8;
    //myPort.write("Z0000....="); 
    delay(500);
    //Sequence=71;
    break;
  case 8: //Positionnement en X GAUCHE
    // envoie coordonnée X
    CoordonneeG();
    Trame=("G90G0X"+CoordX+"Y"+CoordY+'\r');
    myPort.write(Trame);
    Sequence=10;
    print("CoordX:");
    println(CoordX);
    break;  

  case 10: //Positionnement en Z descendre
    Trame=("G90G0Z-7"+'\r');
    myPort.write(Trame);
    Sequence=100;
    break;
  case 100: //Collage
    delay(2000);
    Sequence=101;
    break;

  case 101: //Positionnement en Z monter
    Trame=("G90G0Z0"+'\r');
    myPort.write(Trame);
    Sequence=102;
    delay(2000);
    break;  
  case 102: //Test nombre de pieces
    CptPieces=CptPieces+1;
    Sequence=3;
    if (CptPieces>CptpPrg) Sequence=103;        //............................ CptPieces
    break;


  case 103: //Test nombre de pieces

    //p = exec("python", "/home/pi/Mac/Coord_Points_Colle/EssaiPush.py"); 
    //try {
    //  int result = p.waitFor();
    //  println(result);
    //}
    //catch(InterruptedException e)
    //{
    //  e.printStackTrace();
    //} 

    myPort2.write("STOPFIXE=");
    CptPieces=0;
    myPort.write("G90");
    myPort.write('\r');
    myPort.write("G0X10Y100");
    myPort.write('\r');
    Sequence=0;
    delay(2000);
    break;
  }
  //print("Sequence:");
  // println(Sequence); 



  //......................................................................SEQUENCEPOS
  switch(SequencePos) {
  case 1: 

    op_mode=0;
    CoordonneeCentre();
    Trame=("G90G0X"+CoordX+"Y"+CoordY+'\r');
    myPort.write(Trame); 
    SequencePos=22;
    print("CoordX:");
    println(CoordX);
    println(Trame);
    break;  
  case 11: //Positionnement en X suite
    // attente en position X

    break;

  case 2: //Positionnement en Y
    // envoie coordonnée Y
    myPort.write(CoordY); 
    SequencePos=21;
    print("CoordY:");
    println(CoordY);
    break;
  case 21: //Positionnement en Y
    break;

  case 22: //Positionnement en Z descendre
    Trame=("G90G0Z-8"+'\r');
    myPort.write(Trame); 
    delay(5000);
    SequencePos=23;
    //myPort.write("Z0100....="); 
    //SequencePos=221;
    break;

  case 221: //Positionnement en Z
    // attente en position Z

    break;
  case 23: //Positionnement en Z monter
    Trame=("G90G0Z0"+'\r');
    myPort.write(Trame); 
    delay(5000);
    SequencePos=3;
    //delay(2000);
    // myPort.write("Z0000....="); 
    //SequencePos=231;
    break;

  case 231: //Positionnement en Z
    // attente en position Z

    break;      
  case 3: //Test nombre de pieces
    CptPieces=CptPieces+1;
    SequencePos=1;
    println(CptPieces);
    if (CptPieces>(CptpPrg)) SequencePos=31; //......................................cpt piece

    break;  
  case 31: //Test nombre de pieces
    CptPieces=0;
    myPort2.write("STOPFIXE=");
    Trame=("G90G0X10Y100"+'\r');
    myPort.write(Trame); 
    delay(5000);
    SequencePos=0;
    op_mode=0;
    break;
  }
  //print("SequencePos:");
  //println(SequencePos);

  // exit();
}

//*************************************************************************************************************************************************************************************//
//..................................................................FONCTIONS
//..................................................................TESTPOS
void TestPos() {
  text(cp5.get(Textfield.class, "X").getText(), 360, 130);
  println(CoordCTX);
  CoordX="X"+CoordCTX+"....=";
  myPort.write(CoordX);

  text(cp5.get(Textfield.class, "Y").getText(), 360, 130);
  println(CoordCTY);           
  CoordY="Y"+CoordCTY+"....=";
  myPort.write(CoordY); 


  text(cp5.get(Textfield.class, "Z").getText(), 360, 130);
  //text(textValue, 360,180);
  //println(CoordCTY);           
  CoordZ="Z"+CoordCTZ+"....=";
  myPort.write(CoordZ);
}

//..................................................................CoordonneeCentre
void CoordonneeCentre() {
  // COORDs CENTRE


  CentrePieces_CoordX0[1]=263;
  CentrePieces_CoordY0[1]=811;
  CentrePieces_CoordX0[2]=676;
  CentrePieces_CoordY0[2]=811;
  CentrePieces_CoordX0[3]=1088;
  CentrePieces_CoordY0[3]=811;
  CentrePieces_CoordX0[4]=1505;
  CentrePieces_CoordY0[4]=811;
  CentrePieces_CoordX0[5]=1917;
  CentrePieces_CoordY0[5]=811;
  CentrePieces_CoordX0[6]=1541;
  CentrePieces_CoordY0[6]=1487;
  CentrePieces_CoordX0[7]=2470;
  CentrePieces_CoordY0[7]=496;
  CentrePieces_CoordX0[8]=2805;
  CentrePieces_CoordY0[8]=500;
  CentrePieces_CoordX0[9]=3139;
  CentrePieces_CoordY0[9]=504;
  CentrePieces_CoordX0[10]=3471;
  CentrePieces_CoordY0[10]=508;


  //CentrePieces_CoordX0[1]=1692;CentrePieces_CoordY0[1]=1148;
  // CentrePieces_CoordX0[2]=2081;CentrePieces_CoordY0[2]=1137;
  // CentrePieces_CoordX0[3]=2475;CentrePieces_CoordY0[3]=1130;
  // CentrePieces_CoordX0[4]=2871;CentrePieces_CoordY0[4]=1132;
  // CentrePieces_CoordX0[5]=3266;CentrePieces_CoordY0[5]=1122;
  // CentrePieces_CoordX0[6]=1681;CentrePieces_CoordY0[6]=1726;
  // CentrePieces_CoordX0[7]=2077;CentrePieces_CoordY0[7]=1718;
  // CentrePieces_CoordX0[8]=2474;CentrePieces_CoordY0[8]=1722;
  // CentrePieces_CoordX0[9]=2867;CentrePieces_CoordY0[9]=1715;
  // CentrePieces_CoordX0[10]=3261;CentrePieces_CoordY0[10]=1708;

  //CentrePieces_CoordX0[1]=1793;CentrePieces_CoordY0[1]=1234;
  // CentrePieces_CoordX0[2]=2010;CentrePieces_CoordY0[2]=1228;
  // CentrePieces_CoordX0[3]=2231;CentrePieces_CoordY0[3]=1225;
  // CentrePieces_CoordX0[4]=2450;CentrePieces_CoordY0[4]=1220;
  // CentrePieces_CoordX0[5]=2668;CentrePieces_CoordY0[5]=1220;
  // CentrePieces_CoordX0[6]=1788;CentrePieces_CoordY0[6]=1558;
  // CentrePieces_CoordX0[7]=2009;CentrePieces_CoordY0[7]=1553;
  // CentrePieces_CoordX0[8]=2230;CentrePieces_CoordY0[8]=1555;
  // CentrePieces_CoordX0[9]=2449;CentrePieces_CoordY0[9]=1550;
  // CentrePieces_CoordX0[10]=2666;CentrePieces_CoordY0[10]=1546;



  CentrePieces_CoordX0[11]=1062;
  CentrePieces_CoordY0[11]=603;
  CentrePieces_CoordX0[12]=644;
  CentrePieces_CoordY0[12]=1027;
  CentrePieces_CoordX0[13]=848;
  CentrePieces_CoordY0[13]=1034;
  CentrePieces_CoordX0[14]=1052;
  CentrePieces_CoordY0[14]=1038;
  CentrePieces_CoordX0[15]=1257;
  CentrePieces_CoordY0[15]=1046;
  CentrePieces_CoordX0[16]=1462;
  CentrePieces_CoordY0[16]=1054;
  CentrePieces_CoordX0[17]=1666;
  CentrePieces_CoordY0[17]=1065;
  CentrePieces_CoordX0[18]=1867;
  CentrePieces_CoordY0[18]=1076;
  CentrePieces_CoordX0[19]=2069;
  CentrePieces_CoordY0[19]=1088;
  CentrePieces_CoordX0[20]=2269;
  CentrePieces_CoordY0[20]=1098;

  CentrePieces_CoordX0[21]=423;
  CentrePieces_CoordY0 [21]=1320;
  CentrePieces_CoordX0[22]=627;
  CentrePieces_CoordY0 [22]=1325;
  CentrePieces_CoordX0[23]=829;
  CentrePieces_CoordY0 [23]=1332;
  CentrePieces_CoordX0[24]=1036;
  CentrePieces_CoordY0[24]=1338;
  CentrePieces_CoordX0[25]=1243;
  CentrePieces_CoordY0[25]=1347;
  CentrePieces_CoordX0[26]=1451;
  CentrePieces_CoordY0[26]=1356;
  CentrePieces_CoordX0[27]=1655;
  CentrePieces_CoordY0[27]=1364;
  CentrePieces_CoordX0[28]=1861;
  CentrePieces_CoordY0[28]=1375;
  CentrePieces_CoordX0[29]=2062;
  CentrePieces_CoordY0[29]=1383;
  CentrePieces_CoordX0[30]=2263;
  CentrePieces_CoordY0[30]=1394;

  CentrePieces_CoordX0[31]=411;
  CentrePieces_CoordY0 [31]=1622;
  CentrePieces_CoordX0[32]=613;
  CentrePieces_CoordY0 [32]=1627;
  CentrePieces_CoordX0[33]=817;
  CentrePieces_CoordY0 [33]=1634;
  CentrePieces_CoordX0[34]=1025;
  CentrePieces_CoordY0[34]=1645;
  CentrePieces_CoordX0[35]=1233;
  CentrePieces_CoordY0[35]=1652;
  CentrePieces_CoordX0[36]=1439;
  CentrePieces_CoordY0[36]=1660;
  CentrePieces_CoordX0[37]=1647;
  CentrePieces_CoordY0[37]=1667;
  CentrePieces_CoordX0[38]=1851;
  CentrePieces_CoordY0[38]=1676;
  CentrePieces_CoordX0[39]=2054;
  CentrePieces_CoordY0[39]=1685;
  CentrePieces_CoordX0[40]=2254;
  CentrePieces_CoordY0[40]=1695;

  CentrePieces_CoordX0[41]=398;
  CentrePieces_CoordY0 [41]=1925;
  CentrePieces_CoordX0[42]=600;
  CentrePieces_CoordY0 [42]=1933;
  CentrePieces_CoordX0[43]=805;
  CentrePieces_CoordY0 [43]=1942;
  CentrePieces_CoordX0[44]=1010;
  CentrePieces_CoordY0[44]=1950;
  CentrePieces_CoordX0[45]=1218;
  CentrePieces_CoordY0[45]=1957;
  CentrePieces_CoordX0[46]=1427;
  CentrePieces_CoordY0[46]=1966;
  CentrePieces_CoordX0[47]=1632;
  CentrePieces_CoordY0[47]=1973;
  CentrePieces_CoordX0[48]=1839;
  CentrePieces_CoordY0[48]=1981;
  CentrePieces_CoordX0[49]=2043;
  CentrePieces_CoordY0[49]=1990;
  CentrePieces_CoordX0[50]=2243;
  CentrePieces_CoordY0[50]=1996;

  CentrePieces_CoordX0[51]=383;
  CentrePieces_CoordY0 [51]=2229;
  CentrePieces_CoordX0[52]=588;
  CentrePieces_CoordY0 [52]=2238;
  CentrePieces_CoordX0[53]=792;
  CentrePieces_CoordY0 [53]=2246;
  CentrePieces_CoordX0[54]=998;
  CentrePieces_CoordY0[54]=2256;
  CentrePieces_CoordX0[55]=1205;
  CentrePieces_CoordY0[55]=2265;
  CentrePieces_CoordX0[56]=1412;
  CentrePieces_CoordY0[56]=2272;
  CentrePieces_CoordX0[57]=1619;
  CentrePieces_CoordY0[57]=2280;
  CentrePieces_CoordX0[58]=1825;
  CentrePieces_CoordY0[58]=2289;
  CentrePieces_CoordX0[59]=2029;
  CentrePieces_CoordY0[59]=2293;
  CentrePieces_CoordX0[60]=2229;
  CentrePieces_CoordY0[60]=2299;

  CentrePieces_CoordX0[61]=378;
  CentrePieces_CoordY0 [61]=2530;
  CentrePieces_CoordX0[62]=580;
  CentrePieces_CoordY0 [62]=2541;
  CentrePieces_CoordX0[63]=784;
  CentrePieces_CoordY0 [63]=2550;
  CentrePieces_CoordX0[64]=991;
  CentrePieces_CoordY0 [64]=2560;
  CentrePieces_CoordX0[65]=1197;
  CentrePieces_CoordY0[65]=2567;
  CentrePieces_CoordX0[66]=1401;
  CentrePieces_CoordY0[66]=2576;
  CentrePieces_CoordX0[67]=1607;
  CentrePieces_CoordY0[67]=2583;
  CentrePieces_CoordX0[68]=1811;
  CentrePieces_CoordY0[68]=2590;
  CentrePieces_CoordX0[69]=2014;
  CentrePieces_CoordY0[69]=2596;
  CentrePieces_CoordX0[70]=2215;
  CentrePieces_CoordY0[70]=2597;

  CentrePieces_CoordX0[71]=373;
  CentrePieces_CoordY0 [71]=2831;
  CentrePieces_CoordX0[72]=578;
  CentrePieces_CoordY0 [72]=2842;
  CentrePieces_CoordX0[73]=779;
  CentrePieces_CoordY0 [73]=2853;
  CentrePieces_CoordX0[74]=983;
  CentrePieces_CoordY0 [74]=2862;
  CentrePieces_CoordX0[75]=1188;
  CentrePieces_CoordY0[75]=2872;
  CentrePieces_CoordX0[76]=1390;
  CentrePieces_CoordY0[76]=2879;
  CentrePieces_CoordX0[77]=1596;
  CentrePieces_CoordY0[77]=2882;
  CentrePieces_CoordX0[78]=1799;
  CentrePieces_CoordY0[78]=2891;
  CentrePieces_CoordX0[79]=2773;
  CentrePieces_CoordY0[79]=2270;
  CentrePieces_CoordX0[80]=3067;
  CentrePieces_CoordY0[80]=2279;


  CoordX=str(XHome+((CentrePieces_CoordX0[CptPieces]-DecalX)*xptspixel));

  CoordY=str(YHome+((CentrePieces_CoordY0[CptPieces]-DecalY)*yptspixel));
}


//++++++++++++++++++++++++++++++++
void mouseClicked() {
  text(cp5.get(Textfield.class, "Index").getText(), 360, 130);
  if (PrisePos==1) {
    CentrePieces_CoordX0[int(IndexCentre)]=mouseX;
    CentrePieces_CoordY0[int(IndexCentre)]=mouseY;
  }
}
//++++++++++++++++++++++++++++++++
void CoordonneeG() {
  //CoordX=str(int(((Trou_GaucheX[CptPieces]-DecalX)*xptspixel))/10.0);
  CoordX=str(XHome+((Trou_GaucheY[CptPieces]-DecalX)*xptspixel)); //ALI CORRECTION
  CoordY=str(YHome+((Trou_GaucheX[CptPieces]-DecalY)*yptspixel));
}


//++++++++++++++++++++++++++++++++
void CoordonneeD() {
  //CoordX=str(int(((Trou_DroitX[CptPieces]-DecalX)*xptspixel))/10.0);
  //CoordY=str(int(((Trou_DroitY[CptPieces]-DecalY)*yptspixel))/10);

  CoordX=str(XHome+((Trou_DroitY[CptPieces]-DecalX)*xptspixel));//ALI CORRECTION
  CoordY=str(YHome+((Trou_DroitX[CptPieces]-DecalY)*yptspixel));
}
//****************************************************************************************************************SERIALEVENT MYPORT
void SerialEventTestCNC(Serial myPort) {
  String dataCNC=myPort.readString();
  println("QUOI:"+dataCNC);
}
//****************************************************************************************************************SERIALEVENT MPORT2
void SerialEventTest(Serial myPort2) {
  String data=myPort2.readString();
  String[] vals = split(trim(data), '='); 
  //println("TRAM:"+ data);
  if (data!=null) {

    println(vals.length);
    if (vals.length==18) {
      tag[0]=vals[0];
      tag[1]=vals[1];
      tag[2]=vals[2];
      tag[3]=vals[3];
      tag[4]=vals[4];
      tag[5]=vals[5];
      tag[6]=vals[6];
      tag[7]=vals[7];
      tag[8]=vals[8];
      tag[9]=vals[9];
      tag[10]=vals[10];
      tag[11]=vals[11];
      tag[12]=vals[12];
      tag[13]=vals[13];
      tag[14]=vals[14];
      tag[15]=vals[15];
      tag[16]=vals[16];
    }
    data="";
    AffichageTags(tag);
  }
}
//++++++++++++++++++++++++++++++++
void AffichageTags(String[] tags) {
  // background(0, 0, 0);
  //********************************************TRAITEMENT DU RAYON
  if (tags[0] != null) {
    //text ("Rayon="+tags[0], 220, 20);
    Rayon=int(trim(tags[0]));
    text ("Rayon="+Rayon, 220, 20);
  }
  //********************************************TRAITEMENT BPV_START
  if (tags[1] != null) {
    text ("BPV_START="+tags[1], 220, 40);
    if (int(trim(tags[1]))==1) {
      tags[1] = "";
      myPort2.write("STARTFIXE=");
      op_mode=1;
    }
  }
  //********************************************TRAITEMENT BPV_STOP
  if (tags[2] != null) {
    text ("BPV_STOP="+tags[2], 220, 60);
    if (int(trim(tags[2]))==1) {
      myPort2.write("STOPFIXE=");
      tags[2] = "";
      if (SequencePos>0) {
        op_mode=0;
        Sequence=0;
      }
    }
  }
  //********************************************TRAITEMENT DU xptspixel
  if (tags[3] != null) {
    // text ("xptspixel="+tags[3], 220, 80);
    xptspixel=0.067979;//float(tags[3]);
  }
  //********************************************TRAITEMENT DU DecalX
  if (tags[4] != null) {
    // text ("DecalX="+tags[4], 220, 100);
    DecalX=float(trim(tags[4]));
    text ("DecalX="+DecalX, 220, 100);
  }
  //********************************************TRAITEMENT DU XHome
  if (tags[5] != null) {
    //text ("XHome="+tags[5], 220, 120);
    XHome=float(trim(tags[5]));
    text ("XHome="+XHome, 220, 120);
  }
  //********************************************TRAITEMENT DU yptspixel
  if (tags[6] != null) {
    //text ("yptspixel="+tags[6], 220, 140);
    yptspixel=0.067979;//float(tags[6]);
  }
  //********************************************TRAITEMENT DU DecalY
  if (tags[7] != null) {
    // text ("DecalY="+tags[7], 220, 160);
    DecalY=float(trim(tags[7]));
    text ("DecalY="+DecalY, 220, 160);
  }
  //********************************************TRAITEMENT DU YHome
  if (tags[8] != null) {
    // text ("YHome="+tags[8], 220, 180);
    YHome=float(trim(tags[8]));
    text ("YHome="+YHome, 220, 180);
  }
  //********************************************TRAITEMENT DU CptPieces
  if (tags[9] != null) {
    //println(tags[9]); 
    CptpPrg=int(trim(tags[9]));
    //println(CptpPrg); 
    text ("CptpPrg="+CptpPrg, 220, 200);
  }
  //********************************************TRAITEMENT BP_JOG_X+
  if (tags[10] != null) {
    text ("BP_JOG_XP="+tags[10], 220, 220);
    if (int(trim(tags[10]))==1) {
      JOGXP=true;
    } else {
      JOGXP=false;
    }
    //********************************************TRAITEMENT BP_JOG_X+
    if (tags[11] != null) {
      text ("BP_JOG_XP="+tags[11], 320, 240);
      if (int(trim(tags[11]))==1) {
        JOGXM=true;
      } else {
        JOGXM=false;
      }
    }
  }
  //********************************************TRAITEMENT BP_JOG_Y+
  if (tags[12] != null) {
    text ("BP_JOG_YP="+tags[12], 220, 260);
    if (int(trim(tags[12]))==1) {
      JOGYP=true;
    } else {
      JOGYP=false;
    }
    //********************************************TRAITEMENT BP_JOG_Y+
    if (tags[13] != null) {
      text ("BP_JOG_YP="+tags[13], 320, 280);
      if (int(trim(tags[13]))==1) {
        JOGYM=true;
      } else {
        JOGYM=false;
      }
    }
  }
  //********************************************TRAITEMENT BP_JOG_Z+
  if (tags[14] != null) {
    text ("BP_JOG_ZP="+tags[12], 220, 300);
    if (int(trim(tags[14]))==1) {
      JOGZP=true;
    } else {
      JOGZP=false;
    }
    //********************************************TRAITEMENT BP_JOG_Z+
    if (tags[15] != null) {
      text ("BP_JOG_ZP="+tags[15], 320, 320);
      if (int(trim(tags[15]))==1) {
        JOGZM=true;
      } else {
        JOGZM=false;
      }
    }
  }

  //********************************************TRAITEMENT DU Avance Jog
  if (tags[16] != null) {
    // text ("YHome="+tags[16], 220, 180);
    Avance=tags[16];
    text ("Avance="+Avance, 220, 340);
  }
}
//++++++++++++++++++++++++++++++++
void Collage() {
  //APPEL POSITIONNEMENT DES AXES
  //SERIAL.WRITE VERS MEGA POUR ENVOI DES COORDONNEES
}


//..........................................................................................Traitement image....................................
void Traitement_Image() { 
  photo = loadImage("Lot_piece.jpg");

  tint(204, 153, 0);
  image(photo, 0, 0);
  // filter(DILATE);
  //filter(INVERT);
  //filter(GRAY);


  // ...........................................................................................COORDs CENTRE
  CentrePieces_CoordX0[1]=798;
  CentrePieces_CoordY0[1]=261;
  CentrePieces_CoordX0[2]=799;
  CentrePieces_CoordY0[2]=677;
  CentrePieces_CoordX0[3]=801;
  CentrePieces_CoordY0[3]=1088;
  CentrePieces_CoordX0[4]=800;
  CentrePieces_CoordY0[4]=1500;
  CentrePieces_CoordX0[5]=801;
  CentrePieces_CoordY0[5]=1910;
  CentrePieces_CoordX0[6]=805;
  CentrePieces_CoordY0[6]=2315;
  CentrePieces_CoordX0[7]=1078;
  CentrePieces_CoordY0[7]=258;
  CentrePieces_CoordX0[8]=1079;
  CentrePieces_CoordY0[8]=673;
  CentrePieces_CoordX0[9]=1079;
  CentrePieces_CoordY0[9]=1086;
  CentrePieces_CoordX0[10]=1081;
  CentrePieces_CoordY0[10]=1498;


  //CentrePieces_CoordX0[1]=1692;CentrePieces_CoordY0[1]=1148;
  // CentrePieces_CoordX0[2]=2081;CentrePieces_CoordY0[2]=1137;
  // CentrePieces_CoordX0[3]=2475;CentrePieces_CoordY0[3]=1130;
  // CentrePieces_CoordX0[4]=2871;CentrePieces_CoordY0[4]=1132;
  // CentrePieces_CoordX0[5]=3266;CentrePieces_CoordY0[5]=1122;
  // CentrePieces_CoordX0[6]=1681;CentrePieces_CoordY0[6]=1726;
  // CentrePieces_CoordX0[7]=2077;CentrePieces_CoordY0[7]=1718;
  // CentrePieces_CoordX0[8]=2474;CentrePieces_CoordY0[8]=1722;
  // CentrePieces_CoordX0[9]=2867;CentrePieces_CoordY0[9]=1715;
  // CentrePieces_CoordX0[10]=3261;CentrePieces_CoordY0[10]=1708;


  //CentrePieces_CoordX0[1]=1793;CentrePieces_CoordY0[1]=1234;
  // CentrePieces_CoordX0[2]=2010;CentrePieces_CoordY0[2]=1228;
  // CentrePieces_CoordX0[3]=2231;CentrePieces_CoordY0[3]=1225;
  // CentrePieces_CoordX0[4]=2450;CentrePieces_CoordY0[4]=1220;
  // CentrePieces_CoordX0[5]=2668;CentrePieces_CoordY0[5]=1220;
  // CentrePieces_CoordX0[6]=1788;CentrePieces_CoordY0[6]=1558;
  // CentrePieces_CoordX0[7]=2009;CentrePieces_CoordY0[7]=1553;
  // CentrePieces_CoordX0[8]=2230;CentrePieces_CoordY0[8]=1555;
  // CentrePieces_CoordX0[9]=2449;CentrePieces_CoordY0[9]=1550;
  // CentrePieces_CoordX0[10]=2666;CentrePieces_CoordY0[10]=1546;




  CentrePieces_CoordX0[11]=1079;
  CentrePieces_CoordY0[11]=1905;
  CentrePieces_CoordX0[12]=1079;
  CentrePieces_CoordY0[12]=2317;
  
  CentrePieces_CoordX0[13]=1073;
  CentrePieces_CoordY0[13]=422;
  CentrePieces_CoordX0[14]=1388;
  CentrePieces_CoordY0[14]=425;
  CentrePieces_CoordX0[15]=1257;
  CentrePieces_CoordY0[15]=1046;
  CentrePieces_CoordX0[16]=1462;
  CentrePieces_CoordY0[16]=1054;
  CentrePieces_CoordX0[17]=1666;
  CentrePieces_CoordY0[17]=1065;
  CentrePieces_CoordX0[18]=1867;
  CentrePieces_CoordY0[18]=1076;
  CentrePieces_CoordX0[19]=2069;
  CentrePieces_CoordY0[19]=1088;
  CentrePieces_CoordX0[20]=2269;
  CentrePieces_CoordY0[20]=1098;

  CentrePieces_CoordX0[21]=423;
  CentrePieces_CoordY0 [21]=1320;
  CentrePieces_CoordX0[22]=627;
  CentrePieces_CoordY0 [22]=1325;
  CentrePieces_CoordX0[23]=829;
  CentrePieces_CoordY0 [23]=1332;
  CentrePieces_CoordX0[24]=1036;
  CentrePieces_CoordY0[24]=1338;
  CentrePieces_CoordX0[25]=1243;
  CentrePieces_CoordY0[25]=1347;
  CentrePieces_CoordX0[26]=1451;
  CentrePieces_CoordY0[26]=1356;
  CentrePieces_CoordX0[27]=1655;
  CentrePieces_CoordY0[27]=1364;
  CentrePieces_CoordX0[28]=1861;
  CentrePieces_CoordY0[28]=1375;
  CentrePieces_CoordX0[29]=2062;
  CentrePieces_CoordY0[29]=1383;
  CentrePieces_CoordX0[30]=2263;
  CentrePieces_CoordY0[30]=1394;

  CentrePieces_CoordX0[31]=411;
  CentrePieces_CoordY0 [31]=1622;
  CentrePieces_CoordX0[32]=613;
  CentrePieces_CoordY0 [32]=1627;
  CentrePieces_CoordX0[33]=817;
  CentrePieces_CoordY0 [33]=1634;
  CentrePieces_CoordX0[34]=1025;
  CentrePieces_CoordY0[34]=1645;
  CentrePieces_CoordX0[35]=1233;
  CentrePieces_CoordY0[35]=1652;
  CentrePieces_CoordX0[36]=1439;
  CentrePieces_CoordY0[36]=1660;
  CentrePieces_CoordX0[37]=1647;
  CentrePieces_CoordY0[37]=1667;
  CentrePieces_CoordX0[38]=1851;
  CentrePieces_CoordY0[38]=1676;
  CentrePieces_CoordX0[39]=2054;
  CentrePieces_CoordY0[39]=1685;
  CentrePieces_CoordX0[40]=2254;
  CentrePieces_CoordY0[40]=1695;

  CentrePieces_CoordX0[41]=398;
  CentrePieces_CoordY0 [41]=1925;
  CentrePieces_CoordX0[42]=600;
  CentrePieces_CoordY0 [42]=1933;
  CentrePieces_CoordX0[43]=805;
  CentrePieces_CoordY0 [43]=1942;
  CentrePieces_CoordX0[44]=1010;
  CentrePieces_CoordY0[44]=1950;
  CentrePieces_CoordX0[45]=1218;
  CentrePieces_CoordY0[45]=1957;
  CentrePieces_CoordX0[46]=1427;
  CentrePieces_CoordY0[46]=1966;
  CentrePieces_CoordX0[47]=1632;
  CentrePieces_CoordY0[47]=1973;
  CentrePieces_CoordX0[48]=1839;
  CentrePieces_CoordY0[48]=1981;
  CentrePieces_CoordX0[49]=2043;
  CentrePieces_CoordY0[49]=1990;
  CentrePieces_CoordX0[50]=2243;
  CentrePieces_CoordY0[50]=1996;

  CentrePieces_CoordX0[51]=383;
  CentrePieces_CoordY0 [51]=2229;
  CentrePieces_CoordX0[52]=588;
  CentrePieces_CoordY0 [52]=2238;
  CentrePieces_CoordX0[53]=792;
  CentrePieces_CoordY0 [53]=2246;
  CentrePieces_CoordX0[54]=998;
  CentrePieces_CoordY0[54]=2256;
  CentrePieces_CoordX0[55]=1205;
  CentrePieces_CoordY0[55]=2265;
  CentrePieces_CoordX0[56]=1412;
  CentrePieces_CoordY0[56]=2272;
  CentrePieces_CoordX0[57]=1619;
  CentrePieces_CoordY0[57]=2280;
  CentrePieces_CoordX0[58]=1825;
  CentrePieces_CoordY0[58]=2289;
  CentrePieces_CoordX0[59]=2029;
  CentrePieces_CoordY0[59]=2293;
  CentrePieces_CoordX0[60]=2229;
  CentrePieces_CoordY0[60]=2299;

  CentrePieces_CoordX0[61]=378;
  CentrePieces_CoordY0 [61]=2530;
  CentrePieces_CoordX0[62]=580;
  CentrePieces_CoordY0 [62]=2541;
  CentrePieces_CoordX0[63]=784;
  CentrePieces_CoordY0 [63]=2550;
  CentrePieces_CoordX0[64]=991;
  CentrePieces_CoordY0 [64]=2560;
  CentrePieces_CoordX0[65]=1197;
  CentrePieces_CoordY0[65]=2567;
  CentrePieces_CoordX0[66]=1401;
  CentrePieces_CoordY0[66]=2576;
  CentrePieces_CoordX0[67]=1607;
  CentrePieces_CoordY0[67]=2583;
  CentrePieces_CoordX0[68]=1811;
  CentrePieces_CoordY0[68]=2590;
  CentrePieces_CoordX0[69]=2014;
  CentrePieces_CoordY0[69]=2596;
  CentrePieces_CoordX0[70]=2215;
  CentrePieces_CoordY0[70]=2597;

  CentrePieces_CoordX0[71]=373;
  CentrePieces_CoordY0 [71]=2831;
  CentrePieces_CoordX0[72]=578;
  CentrePieces_CoordY0 [72]=2842;
  CentrePieces_CoordX0[73]=779;
  CentrePieces_CoordY0 [73]=2853;
  CentrePieces_CoordX0[74]=983;
  CentrePieces_CoordY0 [74]=2862;
  CentrePieces_CoordX0[75]=1188;
  CentrePieces_CoordY0[75]=2872;
  CentrePieces_CoordX0[76]=1390;
  CentrePieces_CoordY0[76]=2879;
  CentrePieces_CoordX0[77]=1596;
  CentrePieces_CoordY0[77]=2882;
  CentrePieces_CoordX0[78]=1799;
  CentrePieces_CoordY0[78]=2891;
  CentrePieces_CoordX0[79]=2773;
  CentrePieces_CoordY0[79]=2270;
  CentrePieces_CoordX0[80]=3067;
  CentrePieces_CoordY0[80]=2279;

  // boucle pour les pieces
  while (PTS < CptpPrg+1) { //CptpPrg) {  //................................................................PTS
    println("PTS"+PTS);

    //...................................................................................INIT VARIABLES
    numm=0;
    loop=0;
    Max_Color_R=0;
    Min_Color_R=300;
    Radian_Max=-10000;
    Radian_Min=10000;
    //....................................................................................Point central pièce
    x0=CentrePieces_CoordX0[PTS] ; 
    y0=CentrePieces_CoordY0[PTS] ;
    //println("X0:"+x0);
    //println("y0:"+y0);


    //.........................................................................Cercle Color de chaque points du cercle
    int inc=0;
    for (float t =0; t < 6.2; t=t + 0.001) { //................................DE 0 RADIAN TO 6.2 RADIAN
      x= ceil(x0 + Rayon * cos(t));
      y = y0-(ceil( y0 + Rayon * sin(t))-y0);
      CerclePieces_CoordX[inc]=x;
      CerclePieces_CoordY[inc]=y;
      Radian_t[inc]=t;

      //.........................................................................Lecture code couleur de chaque point du cercle
      color a = photo.get(x, y);
      r = red(a);//  r
      g = green(a);// g
      b = blue(a);// b
      Moyenne_R=(r+Moyenne_R)/2;//...............................................Calcul moyenne de r
      ColorPixel_r[inc]=r;
      ColorPixel_g[inc]=g;
      ColorPixel_b[inc]=b;
      if (r<=Min_Color_R) {
        Min_Color_R=r;//.........................................................valeur de r minimum
        Radian_Min=t;//..........................................................a quel radian
      }
      if (r>=Max_Color_R) { //...................................................valeur dde r maximum
        Max_Color_R=r;//.........................................................valeur de r maximum
        Radian_Max=t;//..........................................................a quel radian
      }
      set(x, y, black);
      inc++;
    }


    //.........................................................................Intégration courbe r -> r_int
    for (boucle =1; boucle < 6201; boucle=boucle+1) {
      ColorPixel_r_int[boucle] = ((ColorPixel_r_int[boucle-1] * 100) + ColorPixel_r[boucle] ) / (100 + 1);
      if (ColorPixel_r_int[boucle]<=Min_Color_R_int) {
        Min_Color_R_int=ColorPixel_r_int[boucle];
      }
      if (ColorPixel_r_int[boucle]>=Max_Color_R_int) {
        Max_Color_R_int=ColorPixel_r_int[boucle];
      }
    }
    //********************VERIFICATION ET ATTEINDRE LE TROU**********************************

    x= ceil(x0 + Rayon * cos(Radian_Min));
    y = y0-(ceil( y0 + Rayon * sin(Radian_Min))-y0);
    set(x, y, rouge);
    //ellipse(x, y, 15, 15);//.................................dessin du point color min normalement passage trou butee


    TestInc=0;
    TestDec=0;
    increm=0.0;
    for (float i=0; i<1.5; i=i+0.1) {     //.....................................accumulation valeur color r partant du x y min vers plus 
      x= ceil(x0 + Rayon * cos(Radian_Min+i));
      y = y0-(ceil( y0 + Rayon * sin(Radian_Min+i))-y0);
      color  a = photo.get(x, y);
      r = red(a);
      g = green(a);
      b = blue(a);    

      TestInc=TestInc+r;    

      set(x, y, rouge);
      //ellipse(x, y, 10, 10);
    }
    //text(TestInc,100,210);
    println("TestInc :"+TestInc); 

    for (float i=0; i<1.5; i=i+0.1) {       //.....................................accumulation valeur color r partant du x y min vers moins 
      x= ceil(x0 + Rayon * cos(Radian_Min-i));
      y = y0-(ceil( y0 + Rayon * sin(Radian_Min-i))-y0);
      color  a = photo.get(x, y);
      r = red(a);
      g = green(a);
      b = blue(a);    

      TestDec=TestDec+r;    

      set(x, y, rouge);
      //ellipse(x, y, 5, 5);
    }
    //text(TestDec,400,210);
    println("TestDec: "+TestDec);  

    //...................................................................................Etude recherche défaut
    DefautDetection=0; //...................NOT USE......................................0=pas de défaut-- 1=défaut 13h -- 2=défaut 16h -- 3=défaut 11h -- 4=défaut 8h
    //...................................................................Traitement 13h
    if (Radian_Min<=1.57 & Radian_Min>0.78 &  TestDec>TestInc ) DefautDetection=1;
    //...................................................................Traitement 16h 
    if (Radian_Min>=4.71 & Radian_Min<6.28 &  TestInc<TestDec ) DefautDetection=2;  
    //...................................................................Traitement 11h
    if (Radian_Min>1.57 & Radian_Min<3.1416 &  TestInc>TestDec  ) DefautDetection=3;
    //...................................................................Traitement 8h 
    if (Radian_Min<4.71 & Radian_Min>=3.1416 &  TestDec>TestInc ) DefautDetection=4;
    //text(DefautDetection,400,210);


    //....................................................................*******************IMPRESSION DES POINTS*****************                                                                                    
    if (TestInc>TestDec) { 
      //increm=((abs(TestInc-TestDec)*0.5)/1000);
      increm=0.5;
      println("increm: "+increm); 
      x= ceil(x0 + Rayon * cos(Radian_Min-increm));
      y = y0-(ceil( y0 + Rayon * sin(Radian_Min-increm))-y0);
      Radian_deux=Radian_Min-increm;
      color  a = photo.get(x, y);
      r = red(a);
      g = green(a);
      b = blue(a); 


      Trou_DroitX[PTS]=x;
      Trou_DroitY[PTS]=y;
      set(x, y, rouge);
      ellipse(x, y, 5, 5); 
      Radian_deux=Radian_deux+3.14;
    } else {
      //increm=((abs(TestInc-TestDec)*0.5)/1000);
      increm=0.5;
      println("increm: "+increm); 
      x= ceil(x0 + Rayon * cos(Radian_Min+increm));
      y = y0-(ceil( y0 + Rayon * sin(Radian_Min+increm))-y0);
      Radian_deux=Radian_Min+increm;
      color  a = photo.get(x, y);
      r = red(a);
      g = green(a);
      b = blue(a); 

      Trou_DroitX[PTS]=x;
      Trou_DroitY[PTS]=y;
      set(x, y, rouge);
      ellipse(x, y, 5, 5); 
      Radian_deux=Radian_deux-3.14;
    }



    //****************** CALCUL POINT OPPOSE*****************************     
    x= ceil(x0 + Rayon * cos(Radian_deux));
    y = y0-(ceil( y0 + Rayon * sin(Radian_deux))-y0);
    Trou_GaucheX[PTS]=x; 
    Trou_GaucheY[PTS]=y;
    set(x, y, rouge);
    ellipse(x, y, 5, 5); 


    //***************FIN****************
    println("Point_Un "+PointUn);
    println("PointDeux: "+PointDeux);
    println("Radian_Min: "+Radian_Min);
    println("Radian_Max: "+Radian_Max);
    println("Min Color"+Min_Color_R);
    println("Max Color"+Max_Color_R);
    //SUITE PIECE SUIVANTE
    PTS=PTS+1;
  }

  saveFrame("data/outputImage.jpg");
  //photo = loadImage("Lot_piece.jpg");
  //image(photo, 0, 0);
  // background(photo);
  Calcul_Points_Colle_OK=false;
}


//**********************************************************************************************************************

public void clear() {
  cp5.get(Textfield.class, "textValue").clear();
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {
    println("controlEvent: accessing a string from controller '"
      +theEvent.getName()+"': "
      +theEvent.getStringValue()
      );
    if (theEvent.getName()=="X") CoordCTX=theEvent.getStringValue();
    if (theEvent.getName()=="Y") CoordCTY=theEvent.getStringValue();
    if (theEvent.getName()=="Z") CoordCTZ=theEvent.getStringValue();
    if (theEvent.getName()=="Index") IndexCentre=theEvent.getStringValue();
  }
}

public void START(int theValue) {
  println("START: "+theValue);
  if (PrgStart) {
    //op_mode=2;
    //myPort.write("$");
    myPort.write(0x18);   
    myPort.write('\r');
  }
}

public void input(String theText) {
  // automatically receives results from controller input
  println("a textfield event for controller 'input' : "+theText);
}
