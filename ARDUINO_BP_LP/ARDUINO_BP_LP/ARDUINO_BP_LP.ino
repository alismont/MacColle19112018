/*
  LISMONT ALAIN 19/11/2018
*/
/*========= Virtuino General methods

   void vDigitalMemoryWrite(int digitalMemoryIndex, int value)       write a value to a Virtuino digital memory   (digitalMemoryIndex=0..31, value range = 0 or 1)
   int  vDigitalMemoryRead(int digitalMemoryIndex)                   read  the value of a Virtuino digital memory (digitalMemoryIndex=0..31, returned value range = 0 or 1)
   void vMemoryWrite(int memoryIndex, float value);                  write a value to Virtuino memory             (memoryIndex=0..31, value range as float value)
   float vMemoryRead(int memoryIndex);                               read a value of  Virtuino memory             (memoryIndex=0..31, returned a float value
   run();                                                            neccesary command to communicate with Virtuino android app  (on start of void loop)
   int getPinValue(int pin);                                         read the value of a Pin. Usefull to read the value of a PWM pin
   long lastCommunicationTime;                                       Stores the last communication with Virtuino time
   void vDelay(long milliseconds);
*/
//******************************************************************************************************************DECLARATION
#include <WiFi.h>
#include <EEPROM.h>
#include "Virtuino_ESP_WifiServer.h"

WiFiServer server(8000);                      // Server port
Virtuino_ESP_WifiServer virtuino(&server);

char octetReception;
char caractereReception;
char octetReceptionProc;
char caractereReceptionProc;
String chaineReception, Tram;
String chaineReceptionProc, TramProc;
bool ons1 = 1;
bool ons2 = 1;
bool ons3 = 1;
bool ons4 = 1;
int LED_START = 0; // 0=LED ETEINTE , 1=Led ON, 2=Led flash
int BP_START = 0;
int Cpt = 0;
int BP = 0;
int BPV_START = 0;
int BPV_STOP = 0;
int IMAGE = 0;
char charVal[10];
int LU = 0;

//eeprom
int Rayon = 45;
int MemoRayon = 45;

float xptspixel = 0.067979;
float Memoxptspixel = 0.067979;
float DecalX = 260.9;
float MemoDecalX = 260.9;
float XHome = 49.9;
float MemoXHome = 49.9;

float yptspixel = 0.067979;
float Memoyptspixel = 0.067979;
float DecalY = 798.0;
float MemoDecalY = 798.0;
float YHome = 30.4;
float MemoYHome = 30.4;

// *****************************************************************************************************************SETUP
void setup() {
  Serial.begin(115200);
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_START, OUTPUT);
  pinMode(BP_START, INPUT_PULLUP);
  Serial.println("test");
  //*******************************************************************************************************************eeprom
  //EEPROM.put(0, Rayon);
  EEPROM.get(0, Rayon);

  // EEPROM.put(1, xptspixel);
  // EEPROM.put(2, DecalX);
  // EEPROM.put(3, XHome);
  EEPROM.get(1, xptspixel);
  EEPROM.get(2, DecalX);
  EEPROM.get(3, XHome);


  //********************************************************************************************************************Virtuino settings
  virtuino.DEBUG = false;                       // set this value TRUE to enable the serial monitor status
  //EEPROM.put(4, yptspixel);
  //EEPROM.put(5, DecalY);
  //EEPROM.put(6, YHome);
  EEPROM.get(4, yptspixel);
  EEPROM.get(5, DecalY);
  EEPROM.get(6, YHome);
  virtuino.password = "12345678";

  initAccessPoint();
  server.begin();
}

// ********************************************************************************************************************LOOP
void loop() {
  //  while (LU == 0) {
  //    //ATTENDRE
  //    RS();
  //  }

  virtuino.run();
  //*******************************************************************************************************************LECTURE ECRITURE VIRTUINO
  BPV_START = virtuino.vDigitalMemoryRead(1);
  BPV_STOP = virtuino.vDigitalMemoryRead(2);
  IMAGE = virtuino.vDigitalMemoryRead(3);

  //Base de Temps
  Cpt = Cpt + 1;
  if (Cpt > 4) {
    Cpt = 0;
  }
  virtuino.vMemoryWrite(1, Cpt);
  //************************************************************************************************************************GESTION LED START
  if (LED_START == 1) {
    virtuino.vDigitalMemoryWrite(0, 1);                                                                   //digitalWrite(LED_START, HIGH);
    //Serial.println("Led High");
  }

  if (LED_START == 2) {
    if (Cpt < 2) {
      virtuino.vDigitalMemoryWrite(0, 1);                                                                //digitalWrite(LED_START, HIGH);
      //Serial.println("Led High");
    } else {
      virtuino.vDigitalMemoryWrite(0, 0);                                                                //digitalWrite(LED_START, LOW);
      // Serial.println("Led Low");
    }
  }

  if (LED_START == 0) {
    virtuino.vDigitalMemoryWrite(0, 0);                                                                 // digitalWrite(LED_START, LOW);
    //Serial.println("Led Low");
  }

  //*********************************************************************************************************GESTION VALEUR DE POSITIONNEMENT

  // Lecture Rayon dans HMI
  Rayon = virtuino.vMemoryRead(2);
  if (Rayon !=  MemoRayon) {
    MemoRayon = Rayon;
    //envoie vers processing
    Lecture();
    EEPROM.put(0, Rayon);
  }

  // Lecture xptspixel dans HMI
  xptspixel =  virtuino.vMemoryRead(3);
  if (xptspixel !=  Memoxptspixel) {
    Memoxptspixel = xptspixel;
    //envoie vers processing
    Lecture();
    EEPROM.put(1, xptspixel);
  }

  // Lecture DecalX dans HMI
  DecalX =  virtuino.vMemoryRead(4);
  if (DecalX !=  MemoDecalX) {
    MemoDecalX = DecalX;
    //envoie vers processing
    Lecture();
    EEPROM.put(2, DecalX);
  }

    // Lecture XHome dans HMI
  XHome =  virtuino.vMemoryRead(5);
  if (XHome !=  MemoXHome) {
    MemoXHome = XHome;
    //envoie vers processing
    Lecture();
    EEPROM.put(3, XHome);
  }

   // Lecture yptspixel dans HMI
  yptspixel =  virtuino.vMemoryRead(6);
  if (yptspixel !=  Memoyptspixel) {
    Memoyptspixel = yptspixel;
    //envoie vers processing
    Lecture();
    EEPROM.put(4, yptspixel);
  }

  // Lecture DecalX dans HMI
  DecalY =  virtuino.vMemoryRead(7);
  if (DecalY !=  MemoDecalY) {
    MemoDecalY = DecalY;
    //envoie vers processing
    Lecture();
    EEPROM.put(5, DecalY);
  }

    // Lecture YHome dans HMI
  YHome =  virtuino.vMemoryRead(8);
  if (YHome !=  MemoYHome) {
    MemoYHome = YHome;
    //envoie vers processing
    Lecture();
    EEPROM.put(6, YHome);
  }
  // ********************************************************************************************************ONS BP START
  if (BPV_START) {                              // a remplacer par des BPs
    if (!ons1) {  //---bit ons
      ons1 = 1;
      Lecture();
    }
  }
  else {
    ons1 = 0;//---bit ons
  }

  if (!BPV_START) {                              // a remplacer par des BPs
    if (!ons3) {  //---bit ons
      ons3 = 1;
      Lecture();
    }
  }
  else {
    ons3 = 0;//---bit ons
  }

  if (BPV_STOP) {                             // a remplacer par des BPs
    if (!ons2) {  //---bit ons
      ons2 = 1;
      Lecture();
    }
  }
  else {
    ons2 = 0;//---bit ons
  }

  if (!BPV_STOP) {                             // a remplacer par des BPs
    if (!ons4) {  //---bit ons
      ons4 = 1;
      Lecture();
    }
  }
  else {
    ons4 = 0;//---bit ons
  }

  RS();
  //virtuino.vDelay(200);        // wait 1 seconds
}

//**********************************************************************************************************FONCTION SERIAL PERIODIQUE
void RS() {
  while (Serial.available() > 0) { // si un caractère en réception

    octetReceptionProc = Serial.read(); // lit le 1er octet de la file d'attente

    if (octetReceptionProc == '=')
    {


      if (chaineReceptionProc.substring(0, 2).equals("LU") == true)
      {
        LU = 1;
      }

      if (chaineReceptionProc.substring(0, 9).equals("STARTFIXE") == true)
      {
        LED_START = 1;
        Serial.write("LED_START 1....=");

      }
      if (chaineReceptionProc.substring(0, 10).equals("STARTFLASH") == true)
      {
        LED_START = 2;
        Serial.write("LED_START 2....=");
      }

      if (chaineReceptionProc.substring(0, 9).equals("STARTZERO") == true)
      {
        LED_START = 0;
      }


      chaineReceptionProc = "";
    }
    else {
      caractereReceptionProc = char(octetReceptionProc);
      chaineReceptionProc = chaineReceptionProc + caractereReceptionProc;
    }
  }
}

//******************************************************************************************************************Lecture
void Lecture() {

  Tram = "";

  dtostrf( Rayon, 3, 0, charVal);
  Tram = Tram  +  charVal;
  Tram = Tram + "=";

  dtostrf( BPV_START, 1, 0, charVal);
  Tram = Tram  +  charVal;
  Tram = Tram + "=";

  dtostrf( BPV_STOP, 1, 0, charVal);
  Tram = Tram  +  charVal;
  Tram = Tram + "=";

  dtostrf( xptspixel, 10, 10, charVal);
  Tram = Tram  +  charVal;
  Tram = Tram + "=";

  dtostrf( DecalX, 6, 2, charVal);
  Tram = Tram  +  charVal;
  Tram = Tram + "=";

  dtostrf( XHome, 6, 2, charVal);
  Tram = Tram  +  charVal;
  Tram = Tram + "=";
  
  dtostrf( yptspixel, 10, 10, charVal);
  Tram = Tram  +  charVal;
  Tram = Tram + "=";

  dtostrf( DecalY, 6, 2, charVal);
  Tram = Tram  +  charVal;
  Tram = Tram + "=";

  dtostrf( YHome, 6, 2, charVal);
  Tram = Tram  +  charVal;
  Tram = Tram + "=";

  Serial.print(Tram);
}

//*****************************************************************************************************************CONNECTION PARAMETRE
void initAccessPoint() {
  //Serial.print("Setting soft-AP ... ");                   // Default IP: 192.168.4.1
  WiFi.mode(WIFI_AP);                                     // Config module as Access point only.  Set WiFi.mode(WIFI_AP_STA); to config module as Acces point and station
  boolean result = WiFi.softAP("dlink", "12345678");      // SSID: Virtuino Network   Password:12345678
  if (result == true)  {
    //Serial.println("Server Ready");
    // Serial.println(WiFi.softAPIP());
  }
  else Serial.println("Failed!");
}
