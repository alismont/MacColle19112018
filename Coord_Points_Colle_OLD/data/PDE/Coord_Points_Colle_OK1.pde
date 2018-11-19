
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
int[] cx = new int[10000];
int[] cy = new int[10000];

// Points de soudures
//HG haut gauche; HD haut droit ; BG bas gauche ; BD bas droit
int[] HGx = new int[100];
int[] HGy = new int[100];
int[] HDx = new int[100];
int[] HDy = new int[100];
int[] BGx = new int[100];
int[] BGy = new int[100];
int[] BDx = new int[100];
int[] BDy = new int[100];
float val=0.5;
int[] HGxD = new int[100];
int[] HGyD = new int[100];
int[] HDxD = new int[100];
int[] HDyD = new int[100];
int[] BGxD = new int[100];
int[] BGyD = new int[100];
int[] BDxD = new int[100];
int[] BDyD = new int[100];

int PasAPas = 1;
int PasAPasD = 1;

float r;
float g;
float b;
float Tot;
float rMax,rMin;
float gMax,gMin;
float bMax,bMin;
float rMoy,gMoy,bMoy;
float MoyTot;
float increm=0.0;
int NbrPoints;

//Etude Date:06-04-2018
//  Tableau des coordonnées polaire de chaque pièce, valeurs constante
int[] CentrePieces_CoordX0 = new int[100];
int[] CentrePieces_CoordY0 = new int[100];
int[] CerclePieces_CoordX = new int[30000];
int[] CerclePieces_CoordY = new int[30000];
float[] ColorPixel_r = new float[30000];
float[] ColorPixel_r_int = new float[30000];
float[] ColorPixel_r_Trou = new float[30000];
float[] ColorPixel_g = new float[30000];
float[] ColorPixel_b = new float[30000];
float[] ColorPixel_a = new float[30000];
float[] Radian_t = new float[30000];
float[] Radian_Max_TBL = new float[30000];
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
int[] Trou_GaucheX = new int[100];
int[] Trou_GaucheY = new int[100];
int[] Trou_DroitX = new int[100];
int[] Trou_DroitY = new int[100];
int Rayon=33;// rayon en nombre de pixels
int x0,y0,x,y;
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
int Point1_TrouX=0,Point1_TrouY=0;
int Point2_TrouX=0,Point2_TrouY=0;
int Point3_TrouX=0,Point3_TrouY=0;
int Point4_TrouX=0,Point4_TrouY=0;
int Point5_TrouX=0,Point5_TrouY=0;
int Point6_TrouX=0,Point6_TrouY=0;
int Point7_TrouX=0,Point7_TrouY=0;
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
     
     int PTS = 1;
//---------------SETUP-----------------------------
void setup() {
    size(2592, 3872);

 //Etude Date:06-04-2018
 
 photo = loadImage("Lot_pieces.jpg");

}

//----------------DRAW----------------------------
void draw() {
      image(photo, 0, 0);
     // filter(DILATE);
      //filter(INVERT);
      filter(GRAY);



// Boucle des 50 pièces A FAIRE.....
// COORDs CENTRE
 CentrePieces_CoordX0[1]=456;CentrePieces_CoordY0[1]=727;
 CentrePieces_CoordX0[2]=657;CentrePieces_CoordY0[2]=730;
 CentrePieces_CoordX0[3]=860;CentrePieces_CoordY0[3]=734;
 CentrePieces_CoordX0[4]=1064;CentrePieces_CoordY0[4]=741;
 CentrePieces_CoordX0[5]=1270;CentrePieces_CoordY0[5]=749;
 CentrePieces_CoordX0[6]=1474;CentrePieces_CoordY0[6]=758;
 CentrePieces_CoordX0[7]=1676;CentrePieces_CoordY0[7]=766;
 CentrePieces_CoordX0[8]=1878;CentrePieces_CoordY0[8]=778;
 CentrePieces_CoordX0[9]=2080;CentrePieces_CoordY0[9]=789;
 CentrePieces_CoordX0[10]=2279;CentrePieces_CoordY0[10]=803;
 
CentrePieces_CoordX0[11]=440;CentrePieces_CoordY0[11]=1023;
CentrePieces_CoordX0[12]=644;CentrePieces_CoordY0[12]=1027;
CentrePieces_CoordX0[13]=848;CentrePieces_CoordY0[13]=1034;
CentrePieces_CoordX0[14]=1052;CentrePieces_CoordY0[14]=1038;
CentrePieces_CoordX0[15]=1257;CentrePieces_CoordY0[15]=1046;
CentrePieces_CoordX0[16]=1462;CentrePieces_CoordY0[16]=1054;
CentrePieces_CoordX0[17]=1666;CentrePieces_CoordY0[17]=1065;
CentrePieces_CoordX0[18]=1867;CentrePieces_CoordY0[18]=1076;
CentrePieces_CoordX0[19]=2069;CentrePieces_CoordY0[19]=1088;
CentrePieces_CoordX0[20]=2269;CentrePieces_CoordY0[20]=1098;

CentrePieces_CoordX0[21]=423;CentrePieces_CoordY0 [21]=1320;
CentrePieces_CoordX0[22]=627;CentrePieces_CoordY0 [22]=1325;
CentrePieces_CoordX0[23]=829;CentrePieces_CoordY0 [23]=1332;
CentrePieces_CoordX0[24]=1036;CentrePieces_CoordY0[24]=1338;
CentrePieces_CoordX0[25]=1243;CentrePieces_CoordY0[25]=1347;
CentrePieces_CoordX0[26]=1451;CentrePieces_CoordY0[26]=1356;
CentrePieces_CoordX0[27]=1655;CentrePieces_CoordY0[27]=1364;
CentrePieces_CoordX0[28]=1861;CentrePieces_CoordY0[28]=1375;
CentrePieces_CoordX0[29]=2062;CentrePieces_CoordY0[29]=1383;
CentrePieces_CoordX0[30]=2263;CentrePieces_CoordY0[30]=1394;

CentrePieces_CoordX0[31]=411;CentrePieces_CoordY0 [31]=1622;
CentrePieces_CoordX0[32]=613;CentrePieces_CoordY0 [32]=1627;
CentrePieces_CoordX0[33]=817;CentrePieces_CoordY0 [33]=1634;
CentrePieces_CoordX0[34]=1025;CentrePieces_CoordY0[34]=1645;
CentrePieces_CoordX0[35]=1233;CentrePieces_CoordY0[35]=1652;
CentrePieces_CoordX0[36]=1439;CentrePieces_CoordY0[36]=1660;
CentrePieces_CoordX0[37]=1647;CentrePieces_CoordY0[37]=1667;
CentrePieces_CoordX0[38]=1851;CentrePieces_CoordY0[38]=1676;
CentrePieces_CoordX0[39]=2054;CentrePieces_CoordY0[39]=1685;
CentrePieces_CoordX0[40]=2254;CentrePieces_CoordY0[40]=1694;

CentrePieces_CoordX0[41]=398;CentrePieces_CoordY0 [41]=1925;
CentrePieces_CoordX0[42]=600;CentrePieces_CoordY0 [42]=1933;
CentrePieces_CoordX0[43]=805;CentrePieces_CoordY0 [43]=1942;
CentrePieces_CoordX0[44]=1010;CentrePieces_CoordY0[44]=1950;
CentrePieces_CoordX0[45]=1218;CentrePieces_CoordY0[45]=1957;
CentrePieces_CoordX0[46]=1427;CentrePieces_CoordY0[46]=1966;
CentrePieces_CoordX0[47]=1632;CentrePieces_CoordY0[47]=1973;
CentrePieces_CoordX0[48]=1839;CentrePieces_CoordY0[48]=1981;
CentrePieces_CoordX0[49]=2043;CentrePieces_CoordY0[49]=1990;
CentrePieces_CoordX0[50]=2243;CentrePieces_CoordY0[50]=1996;

CentrePieces_CoordX0[51]=383;CentrePieces_CoordY0 [51]=2229;
CentrePieces_CoordX0[52]=588;CentrePieces_CoordY0 [52]=2238;
CentrePieces_CoordX0[53]=792;CentrePieces_CoordY0 [53]=2246;
CentrePieces_CoordX0[54]=998;CentrePieces_CoordY0[54]=2256;
CentrePieces_CoordX0[55]=1205;CentrePieces_CoordY0[55]=2265;
CentrePieces_CoordX0[56]=1412;CentrePieces_CoordY0[56]=2272;
CentrePieces_CoordX0[57]=1619;CentrePieces_CoordY0[57]=2280;
CentrePieces_CoordX0[58]=1825;CentrePieces_CoordY0[58]=2289;
CentrePieces_CoordX0[59]=2029;CentrePieces_CoordY0[59]=2293;
CentrePieces_CoordX0[60]=2229;CentrePieces_CoordY0[60]=2299;

CentrePieces_CoordX0[61]=378;CentrePieces_CoordY0 [61]=2530;
CentrePieces_CoordX0[62]=580;CentrePieces_CoordY0 [62]=2541;
CentrePieces_CoordX0[63]=784;CentrePieces_CoordY0 [63]=2550;
CentrePieces_CoordX0[64]=991;CentrePieces_CoordY0 [64]=2560;
CentrePieces_CoordX0[65]=1197;CentrePieces_CoordY0[65]=2567;
CentrePieces_CoordX0[66]=1401;CentrePieces_CoordY0[66]=2576;
CentrePieces_CoordX0[67]=1607;CentrePieces_CoordY0[67]=2583;
CentrePieces_CoordX0[68]=1811;CentrePieces_CoordY0[68]=2590;
CentrePieces_CoordX0[69]=2014;CentrePieces_CoordY0[69]=2596;
CentrePieces_CoordX0[70]=2215;CentrePieces_CoordY0[70]=2597;

CentrePieces_CoordX0[71]=373;CentrePieces_CoordY0 [71]=2831;
CentrePieces_CoordX0[72]=578;CentrePieces_CoordY0 [72]=2842;
CentrePieces_CoordX0[73]=779;CentrePieces_CoordY0 [73]=2853;
CentrePieces_CoordX0[74]=983;CentrePieces_CoordY0 [74]=2862;
CentrePieces_CoordX0[75]=1188;CentrePieces_CoordY0[75]=2872;
CentrePieces_CoordX0[76]=1390;CentrePieces_CoordY0[76]=2879;
CentrePieces_CoordX0[77]=1596;CentrePieces_CoordY0[77]=2882;
CentrePieces_CoordX0[78]=1799;CentrePieces_CoordY0[78]=2891;
CentrePieces_CoordX0[79]=2000;CentrePieces_CoordY0[79]=2895;
CentrePieces_CoordX0[80]=2197;CentrePieces_CoordY0[80]=2889;

while (PTS < 81) {
  //println("PTS"+PTS);
  
//INIT
numm=0;
loop=0;
Max_Color_R=0;
Min_Color_R=300;
Radian_Max=-10000;
Radian_Min=10000;
//Point central pièce
x0=CentrePieces_CoordX0[PTS] ;
y0=CentrePieces_CoordY0[PTS] ;
  //println("X0:"+x0);
  //println("y0:"+y0);
int inc=0;

//Cercle Color de chaque points du cercle
for (float t =0; t < 6.2; t=t + 0.001) {
x= ceil(x0 + Rayon * cos(t));
y = y0-(ceil( y0 + Rayon * sin(t))-y0);
CerclePieces_CoordX[inc]=x;CerclePieces_CoordY[inc]=y;
Radian_t[inc]=t;

//Lecture code couleur de chaque point du cercle
color a = photo.get(x,y);
       r = red(a);
       g = green(a);
       b = blue(a);
Moyenne_R=(r+Moyenne_R)/2;
ColorPixel_r[inc]=r;ColorPixel_g[inc]=g;ColorPixel_b[inc]=b;
if (r<=Min_Color_R) {
  Min_Color_R=r;
  Radian_Min=t;
}
if (r>=Max_Color_R) {
  Max_Color_R=r;
  Radian_Max=t;
}
set(x, y, black);
inc++;
  }


//Intégration courbe r -> r_int
for (boucle =1; boucle < 6201; boucle=boucle+1) {
ColorPixel_r_int[boucle] = ((ColorPixel_r_int[boucle-1] * 100) + ColorPixel_r[boucle] ) / (100 + 1);
if (ColorPixel_r_int[boucle]<=Min_Color_R_int) {
  Min_Color_R_int=ColorPixel_r_int[boucle];
}
if (ColorPixel_r_int[boucle]>=Max_Color_R_int) {
  Max_Color_R_int=ColorPixel_r_int[boucle];
}
}
 //<>// //<>// //<>// //<>// //<>//
 //********************VERIFICATION ET ATTEINDRE LE TROU**********************************
 
        x= ceil(x0 + Rayon * cos(Radian_Max));
       y = y0-(ceil( y0 + Rayon * sin(Radian_Max))-y0);
                              set(x, y, rouge);
                          //ellipse(x, y, 5, 5);
          
TestInc=0;
TestDec=0;
increm=0.0;
     for (float i=0; i<1.8; i=i+0.1)  {      
       x= ceil(x0 + Rayon * cos(Radian_Max+i));
       y = y0-(ceil( y0 + Rayon * sin(Radian_Max+i))-y0);
color  a = photo.get(x,y);
       r = red(a);
       g = green(a);
       b = blue(a);    

            TestInc=TestInc+r;    
  
                          set(x, y, rouge);
                          //ellipse(x, y, 5, 5);
     }
     println("TestInc :"+TestInc); 
     
     for (float i=0; i<1.5; i=i+0.1)  {      
       x= ceil(x0 + Rayon * cos(Radian_Max-i));
       y = y0-(ceil( y0 + Rayon * sin(Radian_Max-i))-y0);
color  a = photo.get(x,y);
       r = red(a);
       g = green(a);
       b = blue(a);    

            TestDec=TestDec+r;    

                                set(x, y, rouge);
                          //ellipse(x, y, 5, 5);         
     }
         println("TestDec: "+TestDec);   
         
 //*******************IMPRESSION DES POINTS*****************                                                                                    
  if (TestInc>TestDec){ 
       increm=(0.5*TestDec)/2000;
        println("increm: "+increm); 
       x= ceil(x0 + Rayon * cos(Radian_Max-increm));
        y = y0-(ceil( y0 + Rayon * sin(Radian_Max-increm))-y0);
        Radian_deux=Radian_Max-increm;
          color  a = photo.get(x,y);
           r = red(a);
           g = green(a);
           b = blue(a); 
           
        if (r>180){
        x= ceil(x0 + Rayon * cos(Radian_Max-increm-0.3));
        y = y0-(ceil( y0 + Rayon * sin(Radian_Max-increm-0.3))-y0);
        Radian_deux=Radian_deux-0.3;  
           a = photo.get(x,y);
           r = red(a);
           g = green(a);
           b = blue(a);         
                  if (r>100){
                              x= ceil(x0 + Rayon * cos(Radian_Max-increm-0.6));
                              y = y0-(ceil( y0 + Rayon * sin(Radian_Max-increm-0.6))-y0);
                                        Radian_deux=Radian_deux-0.6;     
                  }
        }        
            Trou_DroitX[PTS]=x;
            Trou_DroitY[PTS]=y;
                           set(x, y, rouge);
                           ellipse(x, y, 5, 5); 
                           Radian_deux=Radian_deux+3.14; 
  } else {
       increm=(0.5*TestInc)/2000; //<>//
        println("increm: "+increm); 
        x= ceil(x0 + Rayon * cos(Radian_Max+increm));
        y = y0-(ceil( y0 + Rayon * sin(Radian_Max+increm))-y0);
        Radian_deux=Radian_Max+increm;
          color  a = photo.get(x,y);
           r = red(a);
           g = green(a);
           b = blue(a); 
        if (r>180){ //<>//
        x= ceil(x0 + Rayon * cos(Radian_Max+increm+0.3)); //<>//
        y = y0-(ceil( y0 + Rayon * sin(Radian_Max+increm+0.3))-y0);
                Radian_deux=Radian_deux+0.3;
                
           a = photo.get(x,y);
           r = red(a);
           g = green(a);
           b = blue(a);         
                  if (r>100){
                              x= ceil(x0 + Rayon * cos(Radian_Max+increm+0.6)); //<>//
                              y = y0-(ceil( y0 + Rayon * sin(Radian_Max+increm+0.6))-y0);
                                        Radian_deux=Radian_deux+0.6;     
                  } //<>//
        }      
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
println("Point_Un "+PointUn);println("PointDeux: "+PointDeux);
println("Radian_Min: "+Radian_Min);
println("Radian_Max: "+Radian_Max);
println("Min Color"+Min_Color_R);
println("Max Color"+Max_Color_R);
//SUITE PIECE SUIVANTE
 PTS=PTS+1;
}

save("Data/outputImage.jpg"); //<>//

exit();

}