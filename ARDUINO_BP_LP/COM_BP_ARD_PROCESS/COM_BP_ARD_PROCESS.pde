
//****************************************************************************************************DECLARATION
import processing.serial.*;




String inString;

Serial myPort;
int octetReception;
char caracter;
String chainerec;
int STARTFIXE=0;
int Sequence=4;
boolean SequenceZero=true;
int lf=10;

//****************************************************************************************************SETUP
void setup() {

  printArray(Serial.list());

  myPort = new Serial(this, Serial.list()[0], 9600);
}

//******************************************************************************************************** DRAW
void draw() {

  
  
  
  
  //*****************************************************************************************************LECTURE BOUTON START SI MACHINE INITIALISEE
  while (myPort.available()>0 ) {
    octetReception = myPort.read();
//println(chainerec);
    if (octetReception=='=') {
      if (chainerec.length()>8) {
        if (chainerec.substring(0, 9).equals("START....")==true) {
          if (Sequence==2) {
            myPort.write("STARTFIXE=");
            println("STARTFIXE");
          }
          if (Sequence==4) {
            myPort.write("STARTFLASH=");
            println("STARTFLASH");
          }
        }
      }
      println(chainerec);
      chainerec="";
    } else {
      caracter=char(octetReception);
      chainerec=chainerec+caracter;
    }
  }


  if (Sequence==0 & !SequenceZero ) {
    myPort.write("STARTZERO=");
    SequenceZero=true;
    println("STARTZERO");
  }
  if (Sequence>0 & SequenceZero) {
    SequenceZero=false;
    println("NOSTARTZERO");
  }
}