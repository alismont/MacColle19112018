/*
  Macvalves machine  collage 04/06/2018
*/

// librairies
//#include "VirtuinoBluetooth.h" 
  
#include <Arduino.h>
#include "BasicStepperDriver.h"
#include <Wire.h>
//#include <SoftwareSerial.h>
#include "MultiDriver.h"
#include "SyncDriver.h"

#include "VirtuinoBluetooth.h"  


// Motor steps per revolution. Most steppers are 200 steps or 1.8 degrees/step
#define MOTOR_STEPSX 200
#define MOTOR_STEPSY 200
#define MOTOR_STEPSZ 200
// Motor steps per revolution. Most steppers are 200 steps or 1.8 degrees/step
#define MOTOR_STEPS 200
// Target RPM for X axis motor
#define MOTOR_X_RPM 50
// Target RPM for Y axis motor
#define MOTOR_Y_RPM 50
#define MOTOR_Z_RPM 50

// All the wires needed for full functionality
#define DIRY 5
#define DIRX 6
#define DIRZ 7

#define STEPY 2
#define STEPX 3
#define STEPZ 4

//Uncomment line to use enable/disable functionality
#define ENBL 8
#define axeZ 22

// Since microstepping is set externally, make sure this matches the selected mode
// 1=full step, 2=half step etc.
#define MICROSTEPSX 1
#define MICROSTEPSY 1
#define MICROSTEPSZ 1
#define MICROSTEPS 1
// 2-wire basic config, microstepping is hardwired on the driver
//BasicStepperDriver stepperX(MOTOR_STEPSX, DIRX, STEPX);

//Uncomment line to use enable/disable functionality
BasicStepperDriver stepperX(MOTOR_STEPSX, DIRX, STEPX, ENBL);
BasicStepperDriver stepperY(MOTOR_STEPSY, DIRY, STEPY, ENBL);
BasicStepperDriver stepperZ(MOTOR_STEPSZ, DIRZ, STEPZ, ENBL);
SyncDriver controller(stepperX, stepperY);

String Posy;
String Posx;
int Pos_En_Pixel_X=200;
float Pos_RL_X = 0;
float Pos_DM_X = 0;
float Erreur_Pos_X;
bool X_En_Pos=1;

int Pos_En_Pixel_Y=200;
float Pos_RL_Y = 0;
float Pos_DM_Y = 0;
float Erreur_Pos_Y;
bool Y_En_Pos=1;
int op_mode=0;
int memo_op_mode=0;

int Pos_En_Pixel_Z=200;
float Pos_RL_Z = 0;
float Pos_DM_Z = 0;
float Erreur_Pos_Z;
bool Z_En_Pos=1;


int x;
char val;
boolean HomeX_OK=false;
boolean HomeY_OK=false;
boolean HomeZ_OK=false;

int BpHoming = 52; 
int BpStart = 49; 
int FcXHoming = 53; 
int FcYHoming = 51;
int FcZHoming = 46;
int enableX=48;
int jogXpositif =24;
int jogXnegatif =25;
int jogYpositif =26;
int jogYnegatif =27;
int Seq=0;

char octetReception;
char caractereReception;
char octetReceptionProc;
char caractereReceptionProc;
String chaineReception, Tram;
String chaineReceptionProc, TramProc;
bool ons1=0;

//SoftwareSerial bluetoothSerial =  SoftwareSerial(15,14);   // arduino RX pin=2  arduino TX pin=3    connect the arduino RX pin to bluetooth module TX pin   -  connect the arduino TX pin to bluetooth module RX pin.  Disable this line if you want to use hardware serial 
// VirtuinoBluetooth virtuino(bluetoothSerial);
VirtuinoBluetooth virtuino(Serial3); 
//************************************************************************************
void setup() {

//   virtuino.DEBUG=true; 
  /*
     Set target motor RPM.
     These motors can do up to about 200rpm.
     Too high will result in a high pitched whine and the motor does not move.
  */
  Serial.begin(115200);
  Serial3.begin(9600);
  
  while (Serial.available() > 0){
  Serial.read() ;   
  }

  pinMode(BpHoming, INPUT);           // set pin to input
digitalWrite(BpHoming, HIGH);       // turn on pullup resistors
  pinMode(FcXHoming, INPUT);           // set pin to input
digitalWrite(FcXHoming, HIGH);       // turn on pullup resistors
  pinMode(FcYHoming, INPUT);           // set pin to input
digitalWrite(FcYHoming, HIGH);       // turn on pullup resistors
  pinMode(FcZHoming, INPUT);           // set pin to input
digitalWrite(FcZHoming, HIGH);       // turn on pullup resistors
  pinMode(BpStart, INPUT);           // set pin to input
digitalWrite(BpStart, HIGH);       // turn on pullup resistors

  pinMode(enableX, INPUT);           // set pin to input
digitalWrite(enableX, HIGH);       // turn on pullup resistors


  pinMode(jogXpositif, INPUT);           // set pin to input
digitalWrite(jogXpositif, HIGH);
  pinMode(jogXnegatif, INPUT);           // set pin to input
digitalWrite(jogXnegatif, HIGH);
  pinMode(jogYpositif, INPUT);           // set pin to input
digitalWrite(jogYpositif, HIGH);
  pinMode(jogYnegatif, INPUT);           // set pin to input
digitalWrite(jogYnegatif, HIGH);

pinMode(axeZ, OUTPUT); 




      stepperX.setRPM(150);
      stepperY.setRPM(150);
      stepperZ.setRPM(150);
  
       stepperX.setMicrostep(MICROSTEPSX);
            stepperX.enable();
       stepperY.setMicrostep(MICROSTEPSX);
            stepperY.enable();
       stepperZ.setMicrostep(MICROSTEPSX);
            stepperZ.enable();
    stepperX.begin(MOTOR_X_RPM, MICROSTEPS);
    stepperY.begin(MOTOR_Y_RPM, MICROSTEPS);
    stepperZ.begin(MOTOR_Z_RPM, MICROSTEPS);


}



//************************************************************************************
void loop() {

   virtuino.run();           //  
     virtuino.vMemoryWrite(0, Pos_RL_Y);
     virtuino.vMemoryWrite(1, Pos_RL_X);
op_mode=virtuino.vDigitalMemoryRead(1);

if (op_mode!=memo_op_mode) {//.........................................................ENVOI MODE 
    memo_op_mode=op_mode;

  switch (op_mode) {
    case 1:
      Serial.write("M1.......=");
    break;

    case 2:
      Serial.write("M2.......=");
    break;
 
    case 3:
      Serial.write("M3.......=");
    break;

    case 4:
      Serial.write("M4.......=");
    break;
  }    
}


      virtuino.vPinMode(axeZ,OUTPUT); 
//............................................................dDEVERROUILLAGE AXES
if (!digitalRead(enableX)) {  // 
   stepperX.disable();
   stepperY.disable();
      stepperZ.disable();  
}else {
  stepperX.enable();
  stepperY.enable(); 
    stepperZ.enable(); 
}
  
  
//....................................................................JOG AXE X 
if (digitalRead(enableX)) { 
   if (!digitalRead(jogXpositif)) {
    HomeX_OK=false;
        stepperX.setRPM(200);
        Pos_En_Pixel_X=Pos_En_Pixel_X+2;
        X_En_Pos=0;

   }
    if (!digitalRead(jogXnegatif)) {
      HomeX_OK=false;
        stepperX.setRPM(200);
        Pos_En_Pixel_X=Pos_En_Pixel_X-2;
        X_En_Pos=0;        
   } 

   if (!digitalRead(jogYpositif)) {
      stepperY.setRPM(200);
      HomeY_OK=false;
      Pos_En_Pixel_Y=Pos_En_Pixel_Y+2;
        Y_En_Pos=0;      
   }
    if (!digitalRead(jogYnegatif)) {
        stepperX.setRPM(200);
        HomeY_OK=false;
        Pos_En_Pixel_Y=Pos_En_Pixel_Y-2;
                Y_En_Pos=0;     
   } 
}



   
//............................................................................GESTION DE LA COMMANDE START
if (!digitalRead(BpStart)& HomeX_OK & HomeY_OK & HomeZ_OK) {  //
    if (!ons1) {  //---bit ons
      ons1 = 1; 
        Serial.write("START....=");
    }
  }
  else {
    ons1 = 0;//---bit ons
  }

//............................................................................. CHOIX SEQUENCE HOMING OU POSITIONNEMENT X Y AVEC Z ON OFF
 if (!digitalRead(BpHoming)) {
  // SEQUENCE HOME
        stepperX.setRPM(200);
      stepperY.setRPM(200);
      Seq=1;
  }     
//....................................................................................SEQUENCE HOME
switch (Seq) {

    case 0:
    break;
    
    case 1:
Pos_En_Pixel_X=Pos_En_Pixel_X-10;
if (!digitalRead(FcXHoming)){
      Pos_RL_X=0;Pos_DM_X=0;Pos_En_Pixel_X=0;
      HomeX_OK=true;
      Seq=2;
}
    break;

    case 2:
Pos_En_Pixel_Y=Pos_En_Pixel_Y-10;
if (!digitalRead(FcYHoming)){
      Pos_RL_Y=0;Pos_DM_Y=0;Pos_En_Pixel_Y=0;
      HomeY_OK=true;
            Seq=3;
}
    break;

        case 3:
Pos_En_Pixel_X=0;
        stepperX.setRPM(200);
            Seq=4;
    break;

        case 4:
Pos_En_Pixel_Y=0;
        stepperY.setRPM(200);
            Seq=5;
    break;  
        case 5:
Pos_En_Pixel_Z=Pos_En_Pixel_Z-10;
if (!digitalRead(FcZHoming)){
      Pos_RL_Z=0;Pos_DM_Z=0;Pos_En_Pixel_Z=0;
      HomeZ_OK=true;
            Seq=6;
                break; 
       case 6:
Pos_En_Pixel_Z=0;
        stepperZ.setRPM(200);
            Seq=0;
    break;
}  
}


  Pos_DM_X = float(Pos_En_Pixel_X);
  Erreur_Pos_X = Pos_DM_X - Pos_RL_X;
  stepperX.move(Erreur_Pos_X);
    Pos_RL_X = Pos_DM_X;
      if (X_En_Pos==0){
          Serial.write("XOK......=");
          X_En_Pos=1;
      }
      
  Pos_DM_Y=float(Pos_En_Pixel_Y);
  Erreur_Pos_Y=Pos_DM_Y-Pos_RL_Y;
  stepperY.move(Erreur_Pos_Y);
    Pos_RL_Y=Pos_DM_Y;
                if (Y_En_Pos==0){
          Serial.write("YOK......=");
            Y_En_Pos=1;
      } 


        

  Pos_DM_Z=float(Pos_En_Pixel_Z);
  Erreur_Pos_Z=Pos_DM_Z-Pos_RL_Z;
  stepperZ.move(Erreur_Pos_Z);
    Pos_RL_Z=Pos_DM_Z;
                if (Z_En_Pos==0){
          Serial.write("ZOK......=");
            Z_En_Pos=1;
      } 


}

//*********************************FIN********************************************
void serialEvent() {
  while (Serial.available() > 0) { // si un caractère en réception

    octetReceptionProc = Serial.read(); // lit le 1er octet de la file d'attente

    if (octetReceptionProc == '=') 
    {
      if (chaineReceptionProc.substring(0, 1).equals("X") == true) 
      {
        String InStringProc;
        InStringProc = chaineReceptionProc.substring(1,5);
        Pos_En_Pixel_X = InStringProc.toFloat();
        X_En_Pos=0;

      }
      if (chaineReceptionProc.substring(0, 1).equals("Y") == true) 
      {
        String InStringProc;
        InStringProc = chaineReceptionProc.substring(1,5);
        Pos_En_Pixel_Y = InStringProc.toFloat();
        Y_En_Pos=0;
      }
            // AXE Z MOTEUR PAS A PAS
      if (chaineReceptionProc.substring(0, 1).equals("Z") == true) 
      {
        String InStringProc;
        InStringProc = chaineReceptionProc.substring(1,5);
        Pos_En_Pixel_Z = InStringProc.toFloat();
        Z_En_Pos=0;
      }


      // AXE Z VALVE ON OFF
      if (chaineReceptionProc.substring(0, 1).equals("Z") == true) 
      {
        String InStringProc;
        InStringProc = chaineReceptionProc.substring(1,3);
        if (InStringProc=="ON"){
          digitalWrite(axeZ,HIGH);
        }
          else {
              
          digitalWrite(axeZ,LOW);
          }
      }
      chaineReceptionProc = "";
      break; 
    }
else {
      caractereReceptionProc = char(octetReceptionProc);
      chaineReceptionProc = chaineReceptionProc + caractereReceptionProc;
    } 
  }
}
